import AVFoundation
import MediaPlayer
import PocketCastsDataModel
import PocketCastsServer
import PocketCastsUtils
import UIKit

class PlaybackManager: ServerPlaybackDelegate {
    static let shared = PlaybackManager()

    private let updatesPerSave = 30 // save the users progress every 30 seconds

    var queue: PlaybackQueue
    var uuidOfPlayingList = ""

    private static let notSeeking: TimeInterval = -1
    private var seekingTo: TimeInterval = PlaybackManager.notSeeking

    private let chapterManager = ChapterManager()

    var sleepTimeRemaining = -1 as TimeInterval
    var sleepOnEpisodeEnd = false {
        didSet {
            if sleepOnEpisodeEnd {
                sleepTimeRemaining = -1
            }
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.sleepTimerChanged)
        }
    }

    private var updateTimer: Timer?
    private var updateCount = 0

    private var currentEffects: PlaybackEffects?
    private var player: PlaybackProtocol?

    private var switchingToDifferentUpNextEpisode = false
    private var interruptInProgress = false

    private var wasPlayingBeforeInterruption = false
    private let aboutToPlay = AtomicBool()

    private let shouldDeactivateSession = AtomicBool()
    private var haveCalledPlayerLoad = false

    private let updateTimerInterval = 1 as TimeInterval

    #if !os(watchOS)
        private var backgroundTask = UIBackgroundTaskIdentifier.invalid
    #endif

    private var playersToCleanUp = [AnyHashable]()
    private let playerCleanupQueue: DispatchQueue

    private let playerCreateDestroyLock = NSObject()

    private let catchUpHelper = PlaybackCatchUpHelper()

    init() {
        queue = PlaybackQueue()
        queue.loadPersistedQueue()

        playerCleanupQueue = DispatchQueue(label: "PlayerCleanupQueue")

        setupRemoteControlSupport()

        NotificationCenter.default.addObserver(self, selector: #selector(handleRouteChanged(_:)), name: AVAudioSession.routeChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleAudioInterruption(_:)), name: AVAudioSession.interruptionNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleSystemAudioReset(_:)), name: AVAudioSession.mediaServicesWereResetNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(handleSkipTimesChanged), name: Constants.Notifications.skipTimesChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleEpisodeDidUpdate(_:)), name: Constants.Notifications.userEpisodeUpdated, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleEpisodeDidDownload(_:)), name: Constants.Notifications.episodeDownloaded, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateExtraActions), name: Constants.Notifications.extraMediaSessionActionsChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateNowPlayingInfo), name: Constants.Notifications.userEpisodeUpdated, object: nil)

        // run these on a background queue because some of them might call our singleton instance back, causing a crash because PlaybackManager.shared is called from the init method
        DispatchQueue.global().async {
            self.updateAllNowPlayingData()
            self.updateChapterInfo()
            self.queue.updateUpNextInfo()
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - API

    func isNowPlayingEpisode(episodeUuid: String?) -> Bool {
        if let episodeUuid = episodeUuid, let playingEpisode = currentEpisode() {
            return playingEpisode.uuid == episodeUuid
        }

        return false
    }

    func isActivelyPlaying(episodeUuid: String?) -> Bool {
        isNowPlayingEpisode(episodeUuid: episodeUuid) && playing()
    }

    func currentEpisode() -> BaseEpisode? {
        queue.currentEpisode()
    }

    func playing() -> Bool {
        if aboutToPlay.value { return true }

        guard let player = player else { return false }

        return player.playing()
    }

    func buffering() -> Bool {
        guard let player = player else { return false }

        return player.buffering()
    }

    func futureBufferAvailable() -> TimeInterval {
        player?.futureBufferAvailable() ?? 0
    }

    func load(episode: BaseEpisode, autoPlay: Bool, overrideUpNext: Bool, saveCurrentEpisode: Bool = true, completion: (() -> Void)? = nil) {
        objc_sync_enter(playerCreateDestroyLock)
        defer { objc_sync_exit(playerCreateDestroyLock) }

        FileLog.shared.addMessage("Loading \(episode.displayableTitle()) with UUID \(episode.uuid) autoPlay \(autoPlay)")

        let episodeIsChanging = episode.uuid != currentEpisode()?.uuid

        // if the user has built an Up Next list, preserve that but make this the currently playing episode
        if !overrideUpNext && !switchingToDifferentUpNextEpisode && queue.upNextCount() > 0 {
            if let currEpisode = currentEpisode(), currEpisode.uuid != episode.uuid {
                switchTo(episodeToPlay: episode, moveExistingToUpNext: true, autoPlay: true, completion: completion)

                return
            }
        }

        if let uuid = currentEpisode()?.uuid, uuid != episode.uuid {
            chapterManager.clearChapterInfo()
        }

        if saveCurrentEpisode && currentEpisode() != nil && !switchingToDifferentUpNextEpisode {
            recordPlaybackPosition(sendToServerImmediately: false, fireNotifications: false)
        }

        // pressing play/pause when using the Effects Player will cause the code to go through here again, but we only need to mess with the Up Next if we're not playing the same episode anymore
        if episodeIsChanging {
            if overrideUpNext || queue.upNextCount() == 0 {
                queue.overrideAllEpisodesWith(episode: episode)
            } else {
                queue.pushNewCurrentlyPlaying(episode: episode)
            }
        } else {
            // even if the episode isn't changing, we might have a stale copy of it, so update ours
            queue.nowPlayingEpisodeChanged()
        }
        uuidOfPlayingList = ""

        cleanupCurrentPlayer(permanent: false)
        setupPlayer()

        // Played and unplayed episodes should always start from 0
        if episode.played() || episode.unplayed() {
            episode.playedUpTo = 0
            DataManager.sharedManager.saveEpisode(playedUpTo: 0, episode: episode, updateSyncFlag: false)
            queue.refreshList(checkForAutoDownload: false)
        }
        DataManager.sharedManager.updateEpisodePlaybackInteractionDate(episode: episode)
        DataManager.sharedManager.saveEpisode(playbackError: nil, episode: episode)

        if autoPlay {
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackStarting)
            play(completion: completion)

            checkIfStreamBufferRequired(episode: episode, effects: effects())
        } else if episodeIsChanging {
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.upNextQueueChanged)
        }
    }

    func play(completion: (() -> Void)? = nil) {
        guard let currEpisode = currentEpisode() else { return }

        aboutToPlay.value = true

        if playerSwitchRequired() {
            load(episode: currEpisode, autoPlay: false, overrideUpNext: false)
        }
        if !haveCalledPlayerLoad {
            player?.loadEpisode(currEpisode)
            haveCalledPlayerLoad = true
        }

        activateAudioSession(completion: { activated in
            if !activated {
                self.aboutToPlay.value = false
                return
            }

            self.player?.play {
                completion?()
            }
            self.startUpdateTimer()
            self.updateCommandCenterSkipTimes(addTarget: false)

            NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackStarted)

            if currEpisode.videoPodcast() {
                self.setAudioSessionVideoProperties()
            }

            self.updateIdleTimer()
        })
    }

    func pause() {
        guard let episode = currentEpisode() else { return }

        // one kind of interruption would be to launch siri and ask it to pause, handle this here
        wasPlayingBeforeInterruption = false

        FileLog.shared.addMessage("pausing playback")

        recordPlaybackPosition(sendToServerImmediately: playing(), fireNotifications: true)

        if let player = player {
            player.pause()
        }
        updateNowPlayingInfo()

        catchUpHelper.playbackDidPause(of: episode)
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackPaused)
        cancelUpdateTimer()
        deactiveAudioSession()

        updateIdleTimer()
    }

    func playPause() {
        if playing() {
            pause()
        } else {
            play()
        }
    }

    func skipBack() {
        let skipBackAmount = TimeInterval(ServerSettings.skipBackTime())
        skipBack(amount: skipBackAmount)
    }

    private func skipBack(amount: TimeInterval) {
        let currPos = currentTime()
        let backTime = max(currPos - amount, 0)
        seekTo(time: backTime)
    }

    func skipForward() {
        let skipForwardAmount = TimeInterval(ServerSettings.skipForwardTime())
        skipForward(amount: skipForwardAmount)
    }

    private func skipForward(amount: TimeInterval) {
        let forwardTime = min(currentTime() + amount, duration())
        seekTo(time: forwardTime)

        StatsManager.shared.addSkippedTime(amount)
    }

    func skipToPreviousChapter(startPlaybackAfterSkip: Bool = false) {
        guard let previousChapter = chapterManager.previousChapter() else { return }

        seekTo(time: ceil(previousChapter.startTime.seconds), startPlaybackAfterSeek: startPlaybackAfterSkip)
    }

    func skipToNextChapter(startPlaybackAfterSkip: Bool = false) {
        guard let nextChapter = chapterManager.nextChapter() else { return }

        seekTo(time: ceil(nextChapter.startTime.seconds), startPlaybackAfterSeek: startPlaybackAfterSkip)
    }

    func skipToChapter(_ chapter: ChapterInfo, startPlaybackAfterSkip: Bool = false) {
        seekTo(time: ceil(chapter.startTime.seconds), startPlaybackAfterSeek: startPlaybackAfterSkip)
    }

    func chapterCount() -> Int {
        chapterManager.chapterCount()
    }

    func chapterAt(index: Int) -> ChapterInfo? {
        chapterManager.chapterAt(index: index)
    }

    func currentChapter() -> ChapterInfo? {
        chapterManager.currentChapter
    }

    func chapterForTime(time: TimeInterval) -> ChapterInfo? {
        chapterManager.chapterForTime(time)
    }

    private func checkForChapterChange() {
        guard let episodeUuid = currentEpisode()?.uuid else { return }

        if chapterManager.haveTriedToParseChaptersFor(episodeUuid: episodeUuid), chapterManager.updateCurrentChapter(time: currentTime()) {
            fireChapterChangeNotification()
            updateNowPlayingInfo()
        }
    }

    func isSeeking() -> Bool {
        seekingTo != PlaybackManager.notSeeking
    }

    func seekTo(time: TimeInterval, startPlaybackAfterSeek: Bool = false) {
        seekTo(time: time, syncChanges: SyncManager.isUserLoggedIn(), startPlaybackAfterSeek: startPlaybackAfterSeek)
    }

    func seekToFromSync(time: TimeInterval, syncChanges: Bool, startPlaybackAfterSeek: Bool) {
        seekTo(time: time, syncChanges: syncChanges, startPlaybackAfterSeek: startPlaybackAfterSeek)
    }

    func seekTo(time: TimeInterval, syncChanges: Bool, startPlaybackAfterSeek: Bool = false) {
        guard let playingEpisode = currentEpisode() else { return } // nothing to actually seek

        // if we're seeking an episode, and it's not in progress, it should be
        if !playingEpisode.inProgress() {
            DataManager.sharedManager.saveEpisode(playingStatus: .inProgress, episode: playingEpisode, updateSyncFlag: SyncManager.isUserLoggedIn())
        }

        seekingTo = time
        FileLog.shared.addMessage("seek to \(time) startPlaybackAfterSeek \(startPlaybackAfterSeek)")
        if let player = player {
            player.seekTo(time, completion: { [weak self] () in
                guard let strongSelf = self else { return }

                strongSelf.seekingTo = PlaybackManager.notSeeking

                strongSelf.recordPlaybackPosition(sendToServerImmediately: false, fireNotifications: true)
                strongSelf.checkForChapterChange()
                strongSelf.fireProgressNotification()
                strongSelf.updateNowPlayingInfo()

                if startPlaybackAfterSeek, !strongSelf.playing() {
                    strongSelf.play()
                }
            })
        } else {
            // the player isn't currently initialised, so just set this time directly on the episode, as long as it's not past the duration
            if time >= 0, time <= playingEpisode.duration, time != playingEpisode.playedUpTo {
                DataManager.sharedManager.saveEpisode(playedUpTo: time, episode: playingEpisode, updateSyncFlag: syncChanges)

                seekingTo = PlaybackManager.notSeeking
                NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackPositionSaved, object: playingEpisode.uuid)
                checkForChapterChange()
                fireProgressNotification()
            } else {
                seekingTo = PlaybackManager.notSeeking
            }

            if startPlaybackAfterSeek, !playing() {
                play()
            }
        }
    }

    func currentTime() -> TimeInterval {
        guard let episode = currentEpisode() else { return -1 }

        if seekingTo >= 0, seekingTo <= duration(), !playing() { return seekingTo }

        let playerTime = !aboutToPlay.value ? player?.currentTime() ?? 0 : 0

        if playerTime <= 0 {
            let startFromTime = startFromTimeForCurrentEpisode()
            return episode.playedUpTo < 1 ? startFromTime : episode.playedUpTo
        }

        return playerTime
    }

    func duration() -> TimeInterval {
        guard let currentEpisode = currentEpisode() else { return 0 }

        if let player = player, !aboutToPlay.value, !buffering() {
            let episodeDuration = currentEpisode.duration
            let playerDuration = player.duration()
            return (playerDuration > 0) ? playerDuration : episodeDuration
        }

        return currentEpisode.duration
    }

    func inUpNext(episode: BaseEpisode?) -> Bool {
        guard let episode = episode else { return false }

        return queue.contains(episode: episode)
    }

    func addToUpNext(episode: BaseEpisode, ignoringQueueLimit: Bool, toTop: Bool) {
        addToUpNext(episode: episode, ignoringQueueLimit: ignoringQueueLimit, toTop: toTop, userInitiated: false)
    }

    func addToUpNext(episode: BaseEpisode, ignoringQueueLimit: Bool = false, toTop: Bool = false, userInitiated: Bool) {
        guard let playingEpisode = currentEpisode() else {
            // if there's nothing playing, just play this
            load(episode: episode, autoPlay: false, overrideUpNext: true)

            return
        }

        if playingEpisode.uuid == episode.uuid { return }

        // if the episode is somewhere in our future queue, ignore this add call
        if queue.contains(episode: episode), !toTop {
            return
        }

        // check the queue isn't already full
        if !ignoringQueueLimit, queue.upNextCount() >= ServerSettings.autoAddToUpNextLimit() {
            return
        }

        if let episode = episode as? Episode, episode.archived {
            EpisodeManager.unarchiveEpisode(episode: episode, fireNotification: true, userInitiated: false)
        }

        if episode.played() {
            EpisodeManager.markAsUnplayed(episode: episode, fireNotification: true, userInitiated: false)
        }

        // otherwise we don't have this item, so add it to the bottom of our future list
        queue.add(episode: episode, fireNotification: true, partOfBulkAdd: false, toTop: toTop)
    }

    func insertIntoUpNext(episode: Episode, position: Int) {
        guard let playingEpisode = currentEpisode() else {
            // if there's nothing playing, just play this
            load(episode: episode, autoPlay: false, overrideUpNext: true)

            return
        }

        if playingEpisode.uuid == episode.uuid { return }

        queue.insert(episode: episode, position: position)
    }

    func removeIfPlayingOrQueued(episode: BaseEpisode?, fireNotification: Bool, saveCurrentEpisode: Bool = true, userInitiated: Bool = false) {
        if isNowPlayingEpisode(episodeUuid: episode?.uuid) {
            if queue.upNextCount() > 0 {
                playNextEpisode(autoPlay: playing())
            } else {
                endPlayback(saveCurrentEpisode: saveCurrentEpisode)
            }

            return
        }

        if let episode = episode {
            queue.remove(episode: episode, fireNotification: fireNotification)
        }
    }

    func bulkRemoveQueued(uuids: [String]) {
        queue.bulkDelete(uuids: uuids)
    }

    func switchToPlaying(upNextIndex: Int) {
        if upNextIndex >= queue.upNextCount() { return }

        if let episodeToPlay = queue.episodeAt(index: upNextIndex) {
            switchTo(episodeToPlay: episodeToPlay, moveExistingToUpNext: true, autoPlay: true)
        }
    }

    private func playNextEpisode(autoPlay: Bool) {
        if queue.upNextCount() == 0 { return }

        guard let nextEpisode = queue.episodeAt(index: 0) else { return }

        FileLog.shared.addMessage("Play Next Episode \(nextEpisode.displayableTitle())")

        objc_sync_enter(playerCreateDestroyLock)
        defer { objc_sync_exit(playerCreateDestroyLock) }

        queue.removeTopEpisode(fireNotification: false)
        chapterManager.clearChapterInfo()
        cleanupCurrentPlayer(permanent: !autoPlay)

        // Played and unplayed episodes should always start from 0
        if nextEpisode.played() || nextEpisode.unplayed() {
            nextEpisode.playedUpTo = 0
        }
        DataManager.sharedManager.saveEpisode(playbackError: nil, episode: nextEpisode)

        if autoPlay {
            play()
        } else {
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.upNextQueueChanged)
        }

        sleepOnEpisodeEnd = false
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackTrackChanged)
    }

    private func switchTo(episodeToPlay: BaseEpisode, moveExistingToUpNext: Bool, autoPlay: Bool, completion: (() -> Void)? = nil) {
        cancelUpdateTimer()

        if let previousEpisode = currentEpisode(), !moveExistingToUpNext {
            queue.remove(episode: previousEpisode, fireNotification: false)
        }

        switchingToDifferentUpNextEpisode = true
        load(episode: episodeToPlay, autoPlay: autoPlay, overrideUpNext: false, completion: completion)
        switchingToDifferentUpNextEpisode = false

        NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackTrackChanged)
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.upNextQueueChanged)
    }

    func play(filter: EpisodeFilter) {
        let playlistEpisodes = DataManager.sharedManager.findEpisodesWhere(customWhere: PlaylistHelper.queryFor(filter: filter, episodeUuidToAdd: filter.episodeUuidToAddToQueries(), limit: ServerSettings.autoAddToUpNextLimit()), arguments: nil)
        guard let startingEpisode = playlistEpisodes.first else { return }

        populateFromEpisodes(playlistEpisodes, startingAtEpisode: startingEpisode)
        uuidOfPlayingList = filter.uuid
    }

    func play(episodes: [BaseEpisode], startingAtEpisode: BaseEpisode) {
        populateFromEpisodes(episodes, startingAtEpisode: startingAtEpisode)
    }

    func play(podcast: Podcast, startingAtEpisode: Episode) {
        let orderDirection = (Int(podcast.episodeSortOrder) == PodcastEpisodeSortOrder.newestToOldest.rawValue) ? "DESC" : "ASC"
        let episodes = DataManager.sharedManager.findEpisodesWhere(customWhere: "podcastUuid == ? AND archived = 0 AND (playingStatus == \(PlayingStatus.notPlayed.rawValue) OR playingStatus == \(PlayingStatus.inProgress.rawValue)) ORDER BY publishedDate \(orderDirection), addedDate \(orderDirection)", arguments: [podcast.uuid])

        if episodes.count > 0 {
            populateFromEpisodes(episodes, startingAtEpisode: startingAtEpisode)
        } else {
            load(episode: startingAtEpisode, autoPlay: true, overrideUpNext: true)
        }
    }

    func internalPlayerForVideoPlayback() -> AVPlayer? {
        if let episode = currentEpisode(), player == nil {
            load(episode: episode, autoPlay: false, overrideUpNext: false)
            player?.loadEpisode(episode)
            haveCalledPlayerLoad = true
        }

        if let player = player {
            // in order for things like Picture in Picture to work properly, an audio session needs to be activated. If the UI is asking for the internal AVPlayer, then make sure we do this
            activateAudioSession(completion: nil)
            return player.internalPlayerForVideoPlayback()
        }
        setAudioSessionVideoProperties()

        return nil
    }

    func endPlayback(saveCurrentEpisode: Bool = true) {
        cancelUpdateTimer()
        cancelSleepTimer()
        chapterManager.clearChapterInfo()

        if saveCurrentEpisode {
            recordPlaybackPosition(sendToServerImmediately: false, fireNotifications: true)
        }

        queue.removeAllEpisodes()
        cleanupCurrentPlayer(permanent: true)
        #if os(watchOS)
            WatchNowPlayingHelper.clearNowPlayingInfo()
        #else
            NowPlayingHelper.clearNowPlayingInfo()
        #endif

        NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackEnded)
    }

    private var deactivateTimedActionHelper = TimedActionHelper()
    private func deactiveAudioSession(waitBeforeDeactivating: Bool = true) {
        if !waitBeforeDeactivating {
            performDeactivate(audioSession: AVAudioSession.sharedInstance())
            return
        }

        shouldDeactivateSession.value = true
        // iOS gets cranky if you try to de-activate a session that's playing audio, and calling pause doesn't immediately cause audio to stop playing, so as a workaround wait a bit then do it
        deactivateTimedActionHelper.startTimer(for: 3.seconds) { [weak self] in
            guard let self = self else { return }

            let audioSession = AVAudioSession.sharedInstance()
            if !self.shouldDeactivateSession.value { return }
            self.shouldDeactivateSession.value = false
            self.performDeactivate(audioSession: audioSession)
        }
    }

    private func performDeactivate(audioSession: AVAudioSession) {
        do {
            try audioSession.setActive(false)
            FileLog.shared.addMessage("deactiveAudioSession succeeded")
        } catch {
            FileLog.shared.addMessage("deactiveAudioSession failed")
        }
    }

    func playingEpisodeChangedExternally() {
        FileLog.shared.addMessage("Playing episode changed externally")
        chapterManager.clearChapterInfo()
        cleanupCurrentPlayer(permanent: true)

        // if the episode is downloaded, parse it for chapters so the UI is up to date. If it's not, don't, because this will use data
        // we only do this on iOS, since on watchOS the chapters aren't as prominent and we need to conserve battery life
        #if !os(watchOS)
            if let episode = currentEpisode(), episode.downloaded(pathFinder: DownloadManager.shared) {
                updateChapterInfo()
            }
        #endif
    }

    func connectedToRemotePlayerWithEpisode(_ episode: Episode) {
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackStarted)
    }

    func playingOverAirplay() -> Bool {
        let currentRoute = AVAudioSession.sharedInstance().currentRoute

        if currentRoute.outputs.count == 0 { return false }

        let currentOutput = currentRoute.outputs[0]
        if currentOutput.portType.rawValue == AVAudioSession.Port.airPlay.rawValue {
            return true
        }

        return false
    }

    func effects() -> PlaybackEffects {
        if currentEffects == nil {
            currentEffects = loadEffects()
        }

        return currentEffects!
    }

    func changeEffects(_ effects: PlaybackEffects) {
        guard let episode = currentEpisode() else { return }

        // round it to the nearest 0.1, so we end up with 1.5 not 1.53667346262
        effects.playbackSpeed = round(effects.playbackSpeed * 10.0) / 10.0

        // persist changes
        if effects.isGlobal {
            UserDefaults.standard.set(effects.trimSilence.rawValue, forKey: Constants.UserDefaults.globalRemoveSilence)
            UserDefaults.standard.set(effects.volumeBoost, forKey: Constants.UserDefaults.globalVolumeBoost)
            UserDefaults.standard.set(effects.playbackSpeed, forKey: Constants.UserDefaults.globalPlaybackSpeed)
        } else if let episode = episode as? Episode, let podcast = episode.parentPodcast() {
            podcast.trimSilenceAmount = Int32(effects.trimSilence.rawValue)
            podcast.playbackSpeed = effects.playbackSpeed
            podcast.boostVolume = effects.volumeBoost
            DataManager.sharedManager.save(podcast: podcast)
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.podcastUpdated, object: podcast.uuid)
        }

        currentEffects = effects
        handlePlaybackEffectsChanged(effects: effects)
    }

    func decreasePlaybackSpeed() {
        let playbackEffects = effects()
        if playbackEffects.playbackSpeed < 0.6 { return }

        playbackEffects.playbackSpeed = playbackEffects.playbackSpeed - 0.1
        changeEffects(playbackEffects)
    }

    func toggleDefinedPlaybackSpeed() {
        let playbackEffects = effects()
        playbackEffects.toggleDefinedSpeedInterval()

        changeEffects(playbackEffects)
    }

    func increasePlaybackSpeed() {
        let playbackEffects = effects()
        if playbackEffects.playbackSpeed > 2.9 { return }

        playbackEffects.playbackSpeed = playbackEffects.playbackSpeed + 0.1
        changeEffects(playbackEffects)
    }

    func effectsChangedExternally() {
        let newEffects = loadEffects()
        currentEffects = newEffects
        handlePlaybackEffectsChanged(effects: newEffects)
    }

    private func handlePlaybackEffectsChanged(effects: PlaybackEffects) {
        guard let episode = currentEpisode() else { return }

        if playerSwitchRequired() {
            load(episode: episode, autoPlay: playing(), overrideUpNext: false)
        }

        if let player = player {
            player.effectsDidChange()
        }
        updateAllNowPlayingData()
        checkIfStreamBufferRequired(episode: episode, effects: effects)

        NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackEffectsChanged)
    }

    func silenceRemovalAvailable() -> Bool {
        #if !os(watchOS)
            if let episode = currentEpisode() {
                return !episode.videoPodcast()
            }
        #endif

        return false
    }

    func volumeBoostAvailable() -> Bool {
        #if os(watchOS)
            return false
        #else
            return true
        #endif
    }

    // MARK: - Player Callbacks

    @objc func requiredStartingPosition() -> TimeInterval {
        guard let episode = currentEpisode() else { return 0 }

        if seekingTo >= 0, seekingTo <= duration() {
            let timeToReturn = seekingTo
            seekingTo = PlaybackManager.notSeeking

            return timeToReturn
        }

        if Int(episode.playingStatus) == PlayingStatus.inProgress.rawValue {
            if episode.playedUpTo > 0 {
                return catchUpHelper.adjustStartTimeIfNeeded(for: episode)
            }
        } else {
            DataManager.sharedManager.saveEpisode(playingStatus: PlayingStatus.inProgress, episode: episode, updateSyncFlag: SyncManager.isUserLoggedIn())

            let startTime = startFromTimeForCurrentEpisode()
            if startTime > 0 {
                let seekAheadTime = Double(startTime)
                StatsManager.shared.addAutoSkipTime(seekAheadTime)

                return seekAheadTime
            }
        }

        return 0
    }

    @objc func playerDidFinishPreparing() {
        // to speed things up, we report the player as playing before it actually has, this callback is so it can tell us when it has
        aboutToPlay.value = false

        // make sure we load the saved speed for this track
        if let player = player {
            player.setPlaybackRate(effects().playbackSpeed)
        }

        updateAllNowPlayingData()
    }

    func playbackDidFail(logMessage: String?, userMessage: String?) {
        FileLog.shared.addMessage("playbackDidFail: \(logMessage ?? "No error provided")")

        guard let episode = currentEpisode() else {
            endPlayback()

            return
        }

        // sometimes the end of a file can be corrupt, we handle this here with a few basic checks:
        // - Did we get more than a minute into the show?
        // - Is where we are up to close to the duration?
        // - Is the duration actually reasonable?
        // if either of these is false, flag it as an error, otherwise we got close enough to the end
        if episode.playedUpTo < 1.minutes || episode.duration <= 0 || ((episode.playedUpTo + 3.minutes) < episode.duration) {
            pause()
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackPaused)

            if episode.downloaded(pathFinder: DownloadManager.shared) {
                let message = userMessage ?? L10n.playerErrorCorruptedFile
                DataManager.sharedManager.saveEpisode(playbackError: message, episode: episode)
            } else {
                let message = userMessage ?? L10n.playerErrorInternetConnection
                DataManager.sharedManager.saveEpisode(playbackError: message, episode: episode)
                cleanupCurrentPlayer(permanent: false)
            }

            NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackFailed)

            return
        }

        FileLog.shared.addMessage("Something odd about the end of this episode but we got close enough, marking as finished")
        playerDidFinishPlayingEpisode()
    }

    func playerDidCalculateDuration() {
        guard let episode = currentEpisode(), let playerDuration = player?.duration(), !episode.downloading() else { return }

        let currentDuration = episode.duration

        if currentDuration < 10 || abs(currentDuration - playerDuration) > 10 {
            DataManager.sharedManager.saveEpisode(duration: playerDuration, episode: episode, updateSyncFlag: SyncManager.isUserLoggedIn())
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.episodeDurationChanged, object: episode.uuid)
        }

        fireProgressNotification()
        updateNowPlayingInfo()
    }

    func playerDidChangeNowPlayingInfo() {
        updateNowPlayingInfo()
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.currentlyPlayingEpisodeUpdated)
    }

    func playerDidFinishPlayingEpisode() {
        if sleepOnEpisodeEnd {
            pause()
            cancelSleepTimer()
            return
        }
        // once playback is over iOS can be agressive about killing off our app, so start a short lived background task to let it know we're doing stuff
        startBackgroundTask()
        defer {
            endBackgroundTask()
        }

        cancelUpdateTimer()
        seekingTo = PlaybackManager.notSeeking
        chapterManager.clearChapterInfo()

        // handle the episode that just finished, marking it as played, etc
        if let episode = currentEpisode() {
            FileLog.shared.addMessage("Finished playing \(episode.displayableTitle())")
            episode.playingStatus = PlayingStatus.completed.rawValue
            episode.playedUpTo = episode.duration

            if SyncManager.isUserLoggedIn() {
                let currentUtcTime = TimeFormatter.currentUTCTimeInMillis()
                episode.playingStatusModified = currentUtcTime
                episode.playedUpToModified = currentUtcTime
            }

            if let episode = episode as? Episode {
                episode.lastPlaybackInteractionDate = Date()
                episode.lastPlaybackInteractionSyncStatus = SyncStatus.notSynced.rawValue
            }
            DataManager.sharedManager.save(episode: episode)

            if SyncManager.isUserLoggedIn() {
                FileLog.shared.addMessage("Sending playback completed to API server")
                ApiServerHandler.shared.saveCompleted(episode: episode)
            }

            // if marking an episode as played means the it should be archived, then do that
            if EpisodeManager.shouldArchiveOnCompletion(episode: episode) {
                if let episode = episode as? Episode {
                    EpisodeManager.archiveEpisode(episode: episode, fireNotification: true, removeFromPlayer: false, userInitiated: false)
                } else if let episode = episode as? UserEpisode {
                    if Settings.userEpisodeRemoveFileAfterPlaying() {
                        UserEpisodeManager.deleteFromDevice(userEpisode: episode, removeFromPlaybackQueue: false)
                    }
                    if Settings.userEpisodeRemoveFromCloudAfterPlaying() {
                        UserEpisodeManager.deleteFromCloud(episode: episode, removeFromPlaybackQueue: false)
                    }
                }
            } else {
                EpisodeManager.cleanupUnusedBuffers(episode: episode)
            }
        }

        // check to see if there's another episode we should be moving onto
        if queue.upNextCount() == 0 {
            if let episode = currentEpisode() {
                queue.remove(episode: episode, fireNotification: false)
            }
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackEnded)
            cleanupCurrentPlayer(permanent: true)

            #if os(watchOS)
                WatchNowPlayingHelper.clearNowPlayingInfo()
            #else
                NowPlayingHelper.clearNowPlayingInfo()
            #endif

            cancelSleepTimer()
        } else {
            playNextEpisode(autoPlay: !sleepOnEpisodeEnd)
        }
    }

    func playerDidRequestTermination() {
        guard let currEpisode = currentEpisode() else { return }

        let upTo = currentTime()
        DataManager.sharedManager.saveEpisode(playedUpTo: upTo, episode: currEpisode, updateSyncFlag: SyncManager.isUserLoggedIn())

        cleanupCurrentPlayer(permanent: true)

        NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackPositionSaved, object: currEpisode.uuid)
        updateNowPlayingInfo()
    }

    func bulkAdd(_ episodes: [BaseEpisode], toTop: Bool = false) {
        var episodesToAdd = episodes
        if let currentEpisodeIndex = episodes.firstIndex(where: { $0.uuid == PlaybackManager.shared.currentEpisode()?.uuid }) {
            episodesToAdd.remove(at: currentEpisodeIndex)
        }

        // it's technically possible to try and add just the now playing episode, in which case there's nothing more to do
        if episodesToAdd.count == 0 {
            queue.bulkOperationDidComplete()

            return
        }

        queue.bulkAdd(episodesToAdd, toTop: toTop)

        for episode in episodesToAdd {
            if let episode = episode as? Episode, episode.archived {
                EpisodeManager.unarchiveEpisode(episode: episode, fireNotification: false)
            }

            if episode.played() {
                EpisodeManager.markAsUnplayed(episode: episode, fireNotification: false, userInitiated: false)
            }
        }
        queue.bulkOperationDidComplete()
    }

    // MARK: - Helper Methods

    private func populateFromEpisodes(_ episodes: [BaseEpisode]?, startingAtEpisode: BaseEpisode) {
        if episodes == nil, queue.upNextCount() > 0 {
            // the user has chosen to play a single episode, and they have an up next list, so add this episode into up next and push the rest down
            switchTo(episodeToPlay: startingAtEpisode, moveExistingToUpNext: true, autoPlay: true)
        } else {
            // there's a new list of episodes to play, so clear what's currently playing and play that
            load(episode: startingAtEpisode, autoPlay: true, overrideUpNext: true)
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackTrackChanged)

            var foundEpisode = false
            var addedEpisodes = 0
            for episode in episodes! {
                if !foundEpisode {
                    if episode.uuid == startingAtEpisode.uuid {
                        foundEpisode = true
                    }

                    continue
                }

                queue.add(episode: episode, fireNotification: false, partOfBulkAdd: true)
                addedEpisodes += 1
                // honor the queue auto add limit
                if addedEpisodes >= ServerSettings.autoAddToUpNextLimit() {
                    break
                }
            }
            queue.bulkOperationDidComplete()
        }
    }

    private func playerSwitchRequired() -> Bool {
        guard player != nil else { return true }

        return false
    }

    private func setupPlayer() {
        guard let currEpisode = currentEpisode() else { return }

        // check for rogue settings
        if currEpisode.videoPodcast() {
            let currEffects = effects()
            currEffects.trimSilence = .off
        }

        FileLog.shared.addMessage("Using DefaultPlayer")
        player = DefaultPlayer()
    }

    private func cleanupCurrentPlayer(permanent: Bool) {
        objc_sync_enter(playerCreateDestroyLock)
        defer { objc_sync_exit(playerCreateDestroyLock) }

        haveCalledPlayerLoad = false
        seekingTo = PlaybackManager.notSeeking
        FileLog.shared.addMessage("cleanupCurrentPlayer permanent? \(permanent)")
        if let player = player {
            player.endPlayback(permanent: permanent)
        }

        if permanent { aboutToPlay.value = false }
        currentEffects = nil

        // DefaultPlayer and EffectsPlayer both have issues if you discard them immediately after stopping them. DefaultPlayer will crash while trying to render more audio and EffectsPlayer has internal issues as well.
        // This fix isn't ideal, but removing it before fixing these two issues will cause more crashing
        if let player = player as? AnyHashable {
            playerCleanupQueue.sync {
                playersToCleanUp.append(player)
            }
            playerCleanupQueue.asyncAfter(deadline: .now() + 5.seconds) {
                let index = self.playersToCleanUp.firstIndex(where: { listPlayer -> Bool in
                    listPlayer == player
                })
                if let index = index {
                    self.playersToCleanUp.remove(at: index)
                }

                if !self.playing() {
                    self.deactiveAudioSession(waitBeforeDeactivating: false)
                }
            }
        }

        player = nil
    }

    func activateAudioSession(completion: ((Bool) -> Void)?) {
        shouldDeactivateSession.value = false
        do {
            try setAudioSessionProperties()
            #if os(watchOS)
                AVAudioSession.sharedInstance().activate(options: []) { activated, _ in
                    completion?(activated)
                }
            #else
                try AVAudioSession.sharedInstance().setActive(true)
                FileLog.shared.addMessage("activating audio session succeeded")
                completion?(true)
            #endif
        } catch {
            FileLog.shared.addMessage("activating audio session failed \(error.localizedDescription)")
            completion?(false)
        }
    }

    private func setAudioSessionProperties() throws {
        let audioSession = AVAudioSession.sharedInstance()
        #if os(watchOS)
            try audioSession.setCategory(.playback, mode: .default, policy: .longFormAudio)
        #else
            try audioSession.setCategory(.playback, mode: .spokenAudio, policy: .longFormAudio)
        #endif
    }

    private func setAudioSessionVideoProperties() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setMode(AVAudioSession.Mode.moviePlayback)
        } catch {}
    }

    private func loadEffects() -> PlaybackEffects {
        guard let episode = queue.currentEpisode() as? Episode, let podcast = episode.parentPodcast() else {
            return PlaybackEffects.globalEffects()
        }

        return PlaybackEffects.effectsFor(podcast: podcast)
    }

    func queuePersistLocalCopyAsReplace() {
        queue.persistLocalCopyAsReplace()
    }

    func queueRefreshList(checkForAutoDownload: Bool) {
        queue.refreshList(checkForAutoDownload: checkForAutoDownload)
    }

    func allEpisodesInQueue(includeNowPlaying: Bool) -> [BaseEpisode] {
        queue.allEpisodes(includeNowPlaying: includeNowPlaying)
    }

    func upNextQueueChanged() {
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.upNextQueueChanged)
    }

    func upNextQueueCount() -> Int {
        queue.upNextCount()
    }

    func removeLastEpisodeFromUpNext() {
        guard let lastEpisode = queue.allEpisodes().last else { return }

        queue.remove(uuid: lastEpisode.uuid, fireNotification: true)
    }

    // MARK: - Playback Position

    private func recordPlaybackPosition(sendToServerImmediately: Bool, fireNotifications: Bool) {
        guard let currEpisode = currentEpisode() else { return }

        let upTo = currentTime()
        if upTo <= 0 { return }

        let isUserLoggedIn = SyncManager.isUserLoggedIn()
        DataManager.sharedManager.saveEpisode(playedUpTo: upTo, episode: currEpisode, updateSyncFlag: isUserLoggedIn)
        DataManager.sharedManager.updateEpisodePlaybackInteractionDate(episode: currEpisode)
        FileLog.shared.addMessage("saving played up to \(upTo) for episode \(currEpisode.displayableTitle())")
        if sendToServerImmediately, isUserLoggedIn {
            ApiServerHandler.saveUpTo(time: upTo, duration: duration(), episode: currEpisode)
        }

        if fireNotifications {
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackPositionSaved, object: currEpisode.uuid)
            updateNowPlayingInfo()
        }

        StatsManager.shared.persistTimes()
    }

    private func startUpdateTimer() {
        cancelUpdateTimer()

        // schedule the timer on a thread that has a run loop, the main thread being a good option
        if Thread.isMainThread {
            updateTimer = Timer.scheduledTimer(timeInterval: updateTimerInterval, target: self, selector: #selector(progressTimerFired), userInfo: nil, repeats: true)
        } else {
            DispatchQueue.main.sync { [weak self] in
                guard let strongSelf = self else { return }

                strongSelf.updateTimer = Timer.scheduledTimer(timeInterval: strongSelf.updateTimerInterval, target: strongSelf, selector: #selector(progressTimerFired), userInfo: nil, repeats: true)
            }
        }
    }

    private func cancelUpdateTimer() {
        if Thread.isMainThread {
            updateTimer?.invalidate()
        } else {
            DispatchQueue.main.sync { [weak self] in
                self?.updateTimer?.invalidate()
            }
        }
        updateTimer = nil
    }

    @objc private func progressTimerFired() {
        guard let player = player, let episode = currentEpisode() else { return }

        StatsManager.shared.addTotalListeningTime(updateTimerInterval)
        if player.playbackRate() > 1 {
            StatsManager.shared.addTimeSavedVariableSpeed((updateTimerInterval * player.playbackRate()) - updateTimerInterval)
        }

        // check for outro skipping
        let skipLast = skipLastTimeForCurrentEpisode()
        if skipLast > 0 {
            let episodeDuration = duration()
            let timeRemaining = episodeDuration - currentTime()
            if episodeDuration > 0, episodeDuration > skipLast, timeRemaining < skipLast {
                if sleepOnEpisodeEnd {
                    pause()
                    cancelSleepTimer()
                } else {
                    FileLog.shared.addMessage("Skipping last \(timeRemaining) seconds of episode because podcast has skip last of \(skipLast) set.")
                    StatsManager.shared.addAutoSkipTime(timeRemaining)
                    EpisodeManager.markAsPlayed(episode: episode, fireNotification: true)
                }
                return
            }
        }

        checkForChapterChange()
        fireProgressNotification()

        if updateCount > updatesPerSave {
            recordPlaybackPosition(sendToServerImmediately: playing(), fireNotifications: true)
            updateCount = 0
        } else {
            let upTo = currentTime()
            if upTo > 0 {
                episode.playedUpTo = upTo
            }
            updateCount += 1
        }

        // here (as above) we're assuming that in general the timer fires around once a second. Might have to investigate this though as it might not always be the case
        if sleepTimeRemaining >= 0 {
            sleepTimeRemaining = sleepTimeRemaining - updateTimerInterval

            if sleepTimeRemaining < 0 {
                pause()
            }
        }

        if player.buffering() == false {
            updateChapterInfo()
        }
    }

    private func fireProgressNotification() {
        if isSeeking() { return } // don't fire these while the app is seeking

        if Thread.isMainThread {
            if isBackgrounded() { return }

            NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackProgress)
        } else {
            DispatchQueue.main.sync {
                if isBackgrounded() { return }

                NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackProgress)
            }
        }
    }

    private func fireChapterChangeNotification() {
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.podcastChapterChanged)
    }

    private func isBackgrounded() -> Bool {
        #if os(watchOS)
            return false
        #else
            return UIApplication.shared.applicationState == .background
        #endif
    }

    // MARK: - Now Playing Info

    @objc private func updateNowPlayingInfo() {
        let connectedToExternalDevice = false

        // When Google Casting in the background, control over the casting device is not available, so remove the controls
        guard let episode = currentEpisode(), !connectedToExternalDevice else {
            #if os(watchOS)
                WatchNowPlayingHelper.clearNowPlayingInfo()
            #else
                NowPlayingHelper.clearNowPlayingInfo()
            #endif

            return
        }
        #if os(watchOS)
            WatchNowPlayingHelper.updateNowPlayingInfo(for: episode, duration: duration(), upTo: currentTime(), playbackRate: player?.playbackRate())
        #else
            NowPlayingHelper.updateNowPlayingInfo(for: episode, currentChapter: currentChapter(), duration: duration(), upTo: currentTime(), playbackRate: player?.playbackRate())
        #endif
    }

    private func updateChapterInfo() {
        guard let episode = currentEpisode(), episode.mayContainChapters(), !chapterManager.haveTriedToParseChaptersFor(episodeUuid: episode.uuid) else { return }

        chapterManager.parseChapters(episode: episode, duration: duration())
    }

    private func updateAllNowPlayingData() {
        guard let episode = currentEpisode() else {
            #if os(watchOS)
                WatchNowPlayingHelper.clearNowPlayingInfo()
            #else
                NowPlayingHelper.clearNowPlayingInfo()
            #endif
            return
        }

        #if os(watchOS)
            WatchNowPlayingHelper.setAllNowPlayingInfo(for: episode, duration: duration(), upTo: currentTime(), playbackRate: player?.playbackRate())
        #else
            NowPlayingHelper.setAllNowPlayingInfo(for: episode, currentChapter: currentChapter(), duration: duration(), upTo: currentTime(), playbackRate: player?.playbackRate())
        #endif
    }

    // MARK: - Sleep Timer

    func cancelSleepTimer() {
        sleepTimeRemaining = -1
        sleepOnEpisodeEnd = false
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.sleepTimerChanged)
    }

    func sleepTimerActive() -> Bool {
        sleepTimeRemaining >= 0 || sleepOnEpisodeEnd
    }

    func setSleepTimerInterval(_ stopIn: TimeInterval) {
        sleepTimeRemaining = stopIn
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.sleepTimerChanged)
    }

    // MARK: - Remote Control support

    private var lastSeekTime = Date()
    private func setupRemoteControlSupport() {
        let commandCenter = MPRemoteCommandCenter.shared()

        commandCenter.togglePlayPauseCommand.addTarget { [weak self] _ -> MPRemoteCommandHandlerStatus in
            guard let strongSelf = self, let _ = strongSelf.currentEpisode() else { return .noActionableNowPlayingItem }

            FileLog.shared.addMessage("Remote control: togglePlayPauseCommand")
            strongSelf.playPause()

            return .success
        }

        commandCenter.pauseCommand.addTarget { [weak self] _ -> MPRemoteCommandHandlerStatus in
            guard let strongSelf = self, let _ = strongSelf.currentEpisode() else { return .noActionableNowPlayingItem }

            FileLog.shared.addMessage("Remote control: pauseCommand")
            strongSelf.pause()

            return .success
        }

        commandCenter.playCommand.addTarget { [weak self] _ -> MPRemoteCommandHandlerStatus in
            guard let strongSelf = self, let _ = strongSelf.currentEpisode() else { return .noActionableNowPlayingItem }

            if Settings.legacyBluetoothModeEnabled() {
                FileLog.shared.addMessage("Remote control: playCommand, treating as play (Legacy BT Mode is on)")
                if !strongSelf.playing() { strongSelf.play() }
            } else if let lastPlayTime = UserDefaults.standard.object(forKey: Constants.UserDefaults.lastPlayEvent) as? Date, fabs(lastPlayTime.timeIntervalSinceNow) < 10.seconds {
                // iOS will sometimes issue two remotePlay commands, so if it's been less than 10 seconds since the last one, just play don't try to playPause
                FileLog.shared.addMessage("Remote control: playCommand, treating as play")
                if !strongSelf.playing() { strongSelf.play() }
            } else {
                if strongSelf.playingOverAirplay() {
                    // during handoff iOS will call us to play even if we already are, so honour that here
                    FileLog.shared.addMessage("Remote control: playCommand, treating as play because playing over AirPlay")
                    if !strongSelf.playing() { strongSelf.play() }
                } else {
                    // we hook play up to play/pause because that's how some headphones/car stereos do it instead of sending distinct play/pause events
                    FileLog.shared.addMessage("Remote control: playCommand, treating as playPause")
                    strongSelf.playPause()
                }
            }
            UserDefaults.standard.set(Date(), forKey: Constants.UserDefaults.lastPlayEvent)

            return .success
        }

        commandCenter.stopCommand.addTarget { [weak self] _ -> MPRemoteCommandHandlerStatus in
            guard let strongSelf = self, let _ = strongSelf.currentEpisode() else { return .noActionableNowPlayingItem }

            FileLog.shared.addMessage("Remote control: stopCommand")
            strongSelf.pause()

            return .success
        }

        commandCenter.previousTrackCommand.addTarget { [weak self] event -> MPRemoteCommandHandlerStatus in
            guard let strongSelf = self, let _ = strongSelf.currentEpisode() else { return .noActionableNowPlayingItem }

            FileLog.shared.addMessage("Remote control: previousTrackCommand")

            // you can ask Siri to say 'rewind 2 minutes' and it will set the skip interval to a custom number, here we honour that number
            if let skipEvent = event as? MPSkipIntervalCommandEvent, skipEvent.interval > 0 {
                strongSelf.skipBack(amount: skipEvent.interval)
            } else {
                if let previousChapter = strongSelf.chapterManager.previousChapter(), Settings.remoteSkipShouldSkipChapters() {
                    FileLog.shared.addMessage("Skipping to previous chapter because Remote Skip Chapters is turned on")
                    strongSelf.seekTo(time: ceil(previousChapter.startTime.seconds))
                } else {
                    if fabs(strongSelf.lastSeekTime.timeIntervalSinceNow) > Constants.Limits.minTimeBetweenRemoteSkips {
                        strongSelf.lastSeekTime = Date()
                        strongSelf.skipBack()
                    } else {
                        FileLog.shared.addMessage("Remote control: previousTrackCommand ignored, too soon since previous command")
                    }
                }
            }

            return .success
        }

        commandCenter.nextTrackCommand.addTarget { [weak self] event -> MPRemoteCommandHandlerStatus in
            guard let strongSelf = self, let _ = strongSelf.currentEpisode() else { return .noActionableNowPlayingItem }

            FileLog.shared.addMessage("Remote control: nextTrackCommand")

            // you can ask Siri to say 'skip forward 2 minutes' and it will set the skip interval to a custom number, here we honour that number
            if let skipEvent = event as? MPSkipIntervalCommandEvent, skipEvent.interval > 0 {
                strongSelf.skipForward(amount: skipEvent.interval)
            } else {
                if let nextChapter = strongSelf.chapterManager.nextChapter(), Settings.remoteSkipShouldSkipChapters() {
                    FileLog.shared.addMessage("Skipping to next chapter because Remote Skip Chapters is turned on")
                    strongSelf.seekTo(time: ceil(nextChapter.startTime.seconds))
                } else {
                    if fabs(strongSelf.lastSeekTime.timeIntervalSinceNow) > Constants.Limits.minTimeBetweenRemoteSkips {
                        strongSelf.lastSeekTime = Date()
                        strongSelf.skipForward()
                    } else {
                        FileLog.shared.addMessage("Remote control: nextTrackCommand ignored, too soon since previous command")
                    }
                }
            }

            return .success
        }

        commandCenter.changePlaybackPositionCommand.addTarget { [weak self] event -> MPRemoteCommandHandlerStatus in
            guard let strongSelf = self, let _ = strongSelf.currentEpisode() else { return .noActionableNowPlayingItem }

            if let seekEvent = event as? MPChangePlaybackPositionCommandEvent {
                if Settings.legacyBluetoothModeEnabled(), seekEvent.positionTime < 1 {
                    FileLog.shared.addMessage("Remote control: ignoring changePlaybackPositionCommand, it's to 0 and legacy bluetooth mode is on")
                } else {
                    FileLog.shared.addMessage("Remote control: changePlaybackPositionCommand")
                    strongSelf.seekTo(time: seekEvent.positionTime)
                }

                return .success
            }

            FileLog.shared.addMessage("Remote control: changePlaybackPositionCommand failed")

            return .commandFailed
        }

        commandCenter.changePlaybackRateCommand.supportedPlaybackRates = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0]
        commandCenter.changePlaybackRateCommand.addTarget { [weak self] event -> MPRemoteCommandHandlerStatus in
            guard let strongSelf = self, let _ = strongSelf.currentEpisode() else { return .noActionableNowPlayingItem }

            if let rateEvent = event as? MPChangePlaybackRateCommandEvent {
                FileLog.shared.addMessage("Remote control: changePlaybackRateCommand")
                let currentEffects = strongSelf.effects()
                currentEffects.playbackSpeed = Double(rateEvent.playbackRate)
                strongSelf.changeEffects(currentEffects)

                return .success
            }

            FileLog.shared.addMessage("Remote control: changePlaybackRateCommand failed")
            return .commandFailed
        }

        updateCommandCenterSkipTimes(addTarget: true)

        updateExtraActions()
    }

    @objc private func updateExtraActions() {
        let actionsEnabled = Settings.extraMediaSessionActionsEnabled()

        let markPlayedCommand = MPRemoteCommandCenter.shared().dislikeCommand
        let starCommand = MPRemoteCommandCenter.shared().likeCommand

        if actionsEnabled {
            #if !os(watchOS)
                markPlayedCommand.setTitle(title: L10n.markPlayedShort)
            #endif
            markPlayedCommand.removeTarget(self)
            markPlayedCommand.addTarget { [weak self] _ -> MPRemoteCommandHandlerStatus in
                guard let strongSelf = self, let episode = strongSelf.currentEpisode() else { return .noActionableNowPlayingItem }

                EpisodeManager.markAsPlayed(episode: episode, fireNotification: true)
                return .success
            }
            markPlayedCommand.isEnabled = true

            #if !os(watchOS)
                starCommand.setTitle(title: L10n.starEpisodeShort)
            #endif
            starCommand.removeTarget(self)
            starCommand.addTarget { [weak self] _ -> MPRemoteCommandHandlerStatus in
                guard let strongSelf = self, let episode = strongSelf.currentEpisode() as? Episode else { return .noActionableNowPlayingItem }

                EpisodeManager.setStarred(true, episode: episode, updateSyncStatus: SyncManager.isUserLoggedIn())
                return .success
            }
            starCommand.isEnabled = true
        } else {
            markPlayedCommand.removeTarget(self)
            markPlayedCommand.isEnabled = false

            starCommand.removeTarget(self)
            starCommand.isEnabled = false
        }
    }

    // MARK: - Skip Time Changes

    @objc private func handleSkipTimesChanged() {
        updateCommandCenterSkipTimes(addTarget: false)
    }

    private func updateCommandCenterSkipTimes(addTarget: Bool) {
        let commandCenter = MPRemoteCommandCenter.shared()

        let skipBackAmount = TimeInterval(ServerSettings.skipBackTime())
        if addTarget {
            setInterval(commandCenter.skipBackwardCommand, interval: skipBackAmount) { event -> MPRemoteCommandHandlerStatus in
                // if the user has remote chapter skipping on, try to honour that setting if there's no interval that comes through, or the interval matches the default one
                if Settings.remoteSkipShouldSkipChapters(), let previousChapter = self.chapterManager.previousChapter() {
                    let interval = (event as? MPSkipIntervalCommandEvent)?.interval ?? TimeInterval(ServerSettings.skipBackTime())
                    if Int(interval) == ServerSettings.skipBackTime() {
                        FileLog.shared.addMessage("Skipping to previous chapter because Remote Skip Chapters is turned on")
                        self.seekTo(time: ceil(previousChapter.startTime.seconds))

                        return .success
                    }
                }

                if let skipEvent = event as? MPSkipIntervalCommandEvent, skipEvent.interval > 0 {
                    self.skipBack(amount: skipEvent.interval)
                } else {
                    self.skipBack()
                }

                return .success
            }
        } else {
            setInterval(commandCenter.skipBackwardCommand, interval: skipBackAmount, handler: nil)
        }

        let skipFwdAmount = TimeInterval(ServerSettings.skipForwardTime())
        if addTarget {
            setInterval(commandCenter.skipForwardCommand, interval: skipFwdAmount) { event -> MPRemoteCommandHandlerStatus in
                // if the user has remote chapter skipping on, try to honour that setting if there's no interval that comes through, or the interval matches the default one
                if Settings.remoteSkipShouldSkipChapters(), let nextChapter = self.chapterManager.nextChapter() {
                    let interval = (event as? MPSkipIntervalCommandEvent)?.interval ?? TimeInterval(ServerSettings.skipForwardTime())
                    if Int(interval) == ServerSettings.skipForwardTime() {
                        FileLog.shared.addMessage("Skipping to next chapter because Remote Skip Chapters is turned on")
                        self.seekTo(time: ceil(nextChapter.startTime.seconds))

                        return .success
                    }
                }

                if let skipEvent = event as? MPSkipIntervalCommandEvent, skipEvent.interval > 0 {
                    self.skipForward(amount: skipEvent.interval)
                } else {
                    self.skipForward()
                }

                return .success
            }
        } else {
            setInterval(commandCenter.skipForwardCommand, interval: skipFwdAmount, handler: nil)
        }
    }

    private func setInterval(_ command: MPSkipIntervalCommand, interval: TimeInterval, handler: ((MPRemoteCommandEvent) -> MPRemoteCommandHandlerStatus)?) {
        var intervalAmount = interval
        if intervalAmount > 99 { intervalAmount = 99 }
        command.isEnabled = true
        command.preferredIntervals = [NSNumber(value: intervalAmount)]

        if let handler = handler {
            command.addTarget(handler: handler)
        }
    }

    // MARK: - AVAudioSession Notifications

    @objc private func handleRouteChanged(_ notification: Notification) {
        guard let userInfo = notification.userInfo, let changeReason = userInfo[AVAudioSessionRouteChangeReasonKey] as? NSNumber else { return }

        let reason = changeReason.uintValue
        if let currEpisode = currentEpisode(), playingOverAirplay() && playerSwitchRequired() {
            load(episode: currEpisode, autoPlay: true, overrideUpNext: false)
        } else if reason == AVAudioSession.RouteChangeReason.oldDeviceUnavailable.rawValue {
            player?.routeDidChange(shouldPause: true)
        } else if reason == AVAudioSession.RouteChangeReason.newDeviceAvailable.rawValue || reason == AVAudioSession.RouteChangeReason.override.rawValue {
            player?.routeDidChange(shouldPause: false)
        }
    }

    @objc private func handleAudioInterruption(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }

        let interruptionType = userInfo[AVAudioSessionInterruptionTypeKey] as! NSNumber
        if interruptionType.uintValue == AVAudioSession.InterruptionType.ended.rawValue {
            interruptInProgress = false
            let interruptionOption = userInfo[AVAudioSessionInterruptionOptionKey] as! NSNumber
            FileLog.shared.addMessage("PlaybackManager handleAudioInterrupt ended, should attempt to restart audio = \(interruptionOption) )")
            if interruptionOption.uintValue == AVAudioSession.InterruptionOptions.shouldResume.rawValue, wasPlayingBeforeInterruption {
                play()
                wasPlayingBeforeInterruption = false
            }
        } else if interruptionType.uintValue == AVAudioSession.InterruptionType.began.rawValue {
            interruptInProgress = true
            FileLog.shared.addMessage("PlaybackManager handleAudioInterrupt began")
            if let player = player {
                wasPlayingBeforeInterruption = player.shouldBePlaying()
                player.interruptionDidStart()
            }

            if let episode = currentEpisode() {
                catchUpHelper.playbackDidPause(of: episode)
            }
            NotificationCenter.postOnMainThread(notification: Constants.Notifications.playbackPaused)
        }
    }

    @objc private func handleSystemAudioReset(_ notification: Notification) {
        if currentEpisode() != nil {
            cleanupCurrentPlayer(permanent: false)
        }
    }

    // MARK: - Background Handling

    private func startBackgroundTask() {
        #if !os(watchOS)
            if backgroundTask != UIBackgroundTaskIdentifier.invalid { return } // already started

            backgroundTask = UIApplication.shared.beginBackgroundTask(expirationHandler: { [weak self] in
                guard let strongSelf = self else { return }

                strongSelf.endBackgroundTask()
            })
        #endif
    }

    private func endBackgroundTask() {
        #if !os(watchOS)
            if backgroundTask == .invalid { return } // already cancelled

            UIApplication.shared.endBackgroundTask(backgroundTask)
            backgroundTask = UIBackgroundTaskIdentifier.invalid
        #endif
    }

    // MARK: - Starred changed externally

    func nowPlayingStarredChanged() {
        queue.nowPlayingEpisodeChanged()
    }

    // MARK: - Downloading a streamed episode check

    @objc private func handleEpisodeDidDownload(_ notification: Notification) {
        guard let playingEpisode = currentEpisode(), let uuid = notification.object as? String else { return }

        if uuid != playingEpisode.uuid { return } // download isn't the episode we're playing

        // the episode we have won't be marked as downloaded, so grab a fresh copy from the database
        if let refreshedEpisode = DataManager.sharedManager.findBaseEpisode(uuid: uuid) {
            // the current episode we were playing has downloaded, switch to playing the downloaded version
            let currentlyPlaying = playing()
            recordPlaybackPosition(sendToServerImmediately: false, fireNotifications: true)

            load(episode: refreshedEpisode, autoPlay: currentlyPlaying, overrideUpNext: false, saveCurrentEpisode: false)
            if refreshedEpisode.videoPodcast() {
                NotificationCenter.postOnMainThread(notification: Constants.Notifications.videoPlaybackEngineSwitched)
            }
        }
    }

    @objc private func handleEpisodeDidUpdate(_ notification: Notification) {
        guard let playingEpisode = currentEpisode(), let uuid = notification.object as? String, uuid == playingEpisode.uuid else { return }

        // update the cached copy of the now playing episode so we have the latest version of it
        queue.nowPlayingEpisodeChanged()
    }

    // MARK: - Interruptions

    func interruptionInProgress() -> Bool {
        interruptInProgress
    }

    // MARK: - Private helpers

    private func checkIfStreamBufferRequired(episode: BaseEpisode, effects: PlaybackEffects) {
        if effects.trimSilence.isEnabled(), !episode.downloaded(pathFinder: DownloadManager.shared) {
            // the user is streaming and has turned on remove silence, kick off a download so we can fulfill that request
            DownloadManager.shared.addToQueue(episodeUuid: episode.uuid, fireNotification: false, autoDownloadStatus: .playerDownloadedForStreaming)
        }
    }

    private func startFromTimeForCurrentEpisode() -> TimeInterval {
        guard let episode = currentEpisode() as? Episode, let parentPodcast = episode.parentPodcast() else { return 0 }

        return TimeInterval(parentPodcast.startFrom)
    }

    private func skipLastTimeForCurrentEpisode() -> TimeInterval {
        guard let episode = currentEpisode() as? Episode, let parentPodcast = episode.parentPodcast() else { return 0 }

        return TimeInterval(parentPodcast.skipLast)
    }

    // MARK: - Keep Screen on

    func updateIdleTimer() {
        #if !os(watchOS)
            DispatchQueue.main.async {
                if self.playing() {
                    let keepScreenOn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.keepScreenOnWhilePlaying)
                    UIApplication.shared.isIdleTimerDisabled = keepScreenOn
                } else {
                    UIApplication.shared.isIdleTimerDisabled = false
                }
            }
        #endif
    }

    // MARK: - Analytics

    private let commandCenterSource = "now_playing_widget"
}
