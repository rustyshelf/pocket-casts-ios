import BackgroundTasks
import Foundation
import PocketCastsDataModel
import PocketCastsServer
import PocketCastsUtils

class AppDelegate: UIResponder, UIApplicationDelegate {
    private static let initialRefreshDelay = 2.seconds
    private static let minTimeBetweenRefreshes = 5.minutes

    private let shortcutManager = ShortcutManager()
    private let badgeHelper = BadgeHelper()

    @objc var backgroundSessionCompletionHandler: (() -> Void)?

    var window: UIWindow?
    var progressDialog: ShiftyLoadingAlert?
    var modalController: UINavigationController?

    lazy var lenticularFilter: LenticularFilter = .init()

    private var backgroundSignOutListener: BackgroundSignOutListener?

    // MARK: - App Lifecycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FileLog.shared.setup()

        setupSecrets()

        let defaults = UserDefaults.standard

        // check to see that this app has a unique ID, if not create one
        let uniqueId = defaults.string(forKey: Constants.UserDefaults.appId)
        if uniqueId?.count ?? 0 < 1 {
            let uuid = UUID().uuidString
            defaults.set(uuid, forKey: Constants.UserDefaults.appId)
            defaults.synchronize()
        }

        setupRoutes()

        ServerConfig.shared.syncDelegate = ServerSyncManager.shared
        ServerConfig.shared.playbackDelegate = PlaybackManager.shared
        checkDefaults()

        DispatchQueue.global().async { [weak self] in
            self?.postLaunchSetup()
            self?.checkIfRestoreCleanupRequired()
            ImageManager.sharedManager.updatePodcastImagesIfRequired()
            WidgetHelper.shared.cleanupAppGroupImages()
        }

        badgeHelper.setup()
        shortcutManager.listenForShortcutChanges()

        setupBackgroundRefresh()

        NotificationCenter.default.addObserver(self, selector: #selector(handleThemeChanged), name: Constants.Notifications.themeChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideOverlays), name: Constants.Notifications.openingNonOverlayableWindow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showOverlays), name: Constants.Notifications.closedNonOverlayableWindow, object: nil)

        setupSignOutListener()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        handleEnterBackground()
    }

    func handleEnterBackground() {
        scheduleNextBackgroundRefresh()

        UserDefaults.standard.set(Date(), forKey: Constants.UserDefaults.lastAppCloseDate)
        badgeHelper.updateBadge()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        handleBecomeActive()
    }

    func handleBecomeActive() {
        setupSignOutListener()

        // give the network a few seconds to come up before refreshing, also only refresh if the last refresh was more than 5 minutes ago
        let lastUpdateTime = ServerSettings.lastRefreshEndTime()
        if DateUtil.hasEnoughTimePassed(since: lastUpdateTime, time: AppDelegate.minTimeBetweenRefreshes) {
            Timer.scheduledTimer(withTimeInterval: AppDelegate.initialRefreshDelay, repeats: false, block: { _ in
                RefreshManager.shared.refreshPodcasts()
            })
        } else {
            PodcastManager.shared.checkForPendingAndAutoDownloads()
            UserEpisodeManager.checkForPendingUploads()
        }
        PlaybackManager.shared.updateIdleTimer()
    }

    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        backgroundSessionCompletionHandler = completionHandler
    }

    // This method will be invoked even if the application was launched or resumed because of the remote notification. The respective delegate methods will be invoked first. Note that this behavior is in contrast to application:didReceiveRemoteNotification:, which is not called in those cases, and which will not be invoked if this method is implemented.
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        RefreshManager.shared.refreshPodcasts(completion: { refreshFetchResult in
            completionHandler(self.convertRefreshResult(result: refreshFetchResult))
        })
        badgeHelper.updateBadge()
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.reduce("") { $0 + String(format: "%02X", $1) }

        PodcastManager.shared.didReceiveToken(token)
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        ServerSettings.removePushToken()
    }

    func application(_ application: UIApplication, didChangeStatusBarFrame oldStatusBarFrame: CGRect) {
        NotificationCenter.postOnMainThread(notification: Constants.Notifications.statusBarHeightChanged)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        RefreshManager.shared.cancelAllRefreshes()

        badgeHelper.teardown()
        shortcutManager.stopListeningForShortcutChanges()

        UIApplication.shared.endReceivingRemoteControlEvents()
    }

    @objc func miniPlayer() -> MiniPlayerViewController? {
        NavigationManager.sharedManager.miniPlayer
    }

    func openEpisode(_ episodeUuid: String, from podcast: Podcast) {
        DispatchQueue.main.async {
            self.hideProgressDialog()

            guard let episode = DataManager.sharedManager.findEpisode(uuid: episodeUuid) else {
                // for some reason we can't find this episode, so open the podcast instead
                FileLog.shared.addMessage("Unable to find episode with uuid \(episodeUuid), opening podcast `\(podcast.title ?? "")` instead")
                NavigationManager.sharedManager.navigateTo(NavigationManager.podcastPageKey, data: [NavigationManager.podcastKey: podcast])

                return
            }

            NavigationManager.sharedManager.navigateTo(NavigationManager.episodePageKey, data: [NavigationManager.episodeUuidKey: episode.uuid])
        }
    }

    func hideProgressDialog() {
        if Thread.current.isMainThread {
            progressDialog?.hideAlert(false)
            progressDialog = nil
        } else {
            DispatchQueue.main.async {
                self.progressDialog?.hideAlert(false)
                self.progressDialog = nil
            }
        }
    }

    func openPlayerWhenReadyFromExternalEvent() {
        guard miniPlayer()?.playerOpenState != .open, miniPlayer()?.playerOpenState != .animating else { return }

        // when opening from an external event, we need to give the app time to set itself up and launch. As dodgy as this is, it means waiting a bit before launching the player
        SwiftUtils.performAfterDelayOnMainThread(1.0, closure: {
            guard let miniPlayer = self.miniPlayer(), miniPlayer.playerOpenState != .animating, miniPlayer.playerOpenState != .open else { return }

            miniPlayer.openFullScreenPlayer()
        })
    }

    // MARK: - Event Handling

    private var overlayShouldBeHidden = false
    @objc private func hideOverlays() {
        overlayShouldBeHidden = true
        if lenticularFilter.isShowing() {
            lenticularFilter.hide()
        }
    }

    @objc private func showOverlays() {
        overlayShouldBeHidden = false
        if Theme.sharedTheme.activeTheme == .radioactive {
            lenticularFilter.show()
        }
    }

    @objc private func handleThemeChanged() {
        if Theme.sharedTheme.activeTheme == .radioactive, !overlayShouldBeHidden {
            lenticularFilter.show()
        } else {
            lenticularFilter.hide()
        }
    }

    private func setupBackgroundRefresh() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: Constants.Values.refreshTaskId, using: nil) { task in
            FileLog.shared.addMessage("Background refresh called")
            self.handleAppRefresh(task: task)
        }
    }

    private func scheduleNextBackgroundRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: Constants.Values.refreshTaskId)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 30.minutes)

        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            FileLog.shared.addMessage("Could not schedule app refresh: \(error.localizedDescription)")
        }
    }

    private func handleAppRefresh(task: BGTask) {
        scheduleNextBackgroundRefresh()

        task.expirationHandler = {
            FileLog.shared.addMessage("Background refresh timed out")
        }

        RefreshManager.shared.refreshPodcasts(completion: { refreshFetchResult in
            task.setTaskCompleted(success: refreshFetchResult != .failed)
        })
        badgeHelper.updateBadge()
    }

    private func postLaunchSetup() {
        if !UserDefaults.standard.bool(forKey: "CreatedDefPlaylistsV2") {
            PlaylistManager.createDefaultFilters()
            UserDefaults.standard.set(true, forKey: "CreatedDefPlaylistsV2")
        }
        DownloadManager.shared.clearStuckDownloads()
    }

    private func checkIfRestoreCleanupRequired() {
        let dataManager = DataManager.sharedManager

        // find the oldest episode in our database listed as being downloaded
        let query = "episodeStatus = \(DownloadStatus.downloaded.rawValue) ORDER BY publishedDate ASC, addedDate ASC LIMIT 1"
        guard let oldestEpisode = dataManager.findEpisodeWhere(customWhere: query, arguments: nil), !oldestEpisode.downloaded(pathFinder: DownloadManager.shared) else { return }

        // if we get here then we have at least one episode that is listed as downloaded that's actually not, so we need to go through and check them all
        FileLog.shared.addMessage("Detected restore cleanup required")
        let allQuery = "episodeStatus = \(DownloadStatus.downloaded.rawValue)"
        let downloadedEpisodes = dataManager.findEpisodesWhere(customWhere: allQuery, arguments: nil)
        for episode in downloadedEpisodes {
            if !episode.downloaded(pathFinder: DownloadManager.shared) {
                // episode is listed as downloaded, but the file isn't there, fix this
                dataManager.saveEpisode(downloadStatus: .notDownloaded, episode: episode)
                dataManager.saveFrameCount(episode: episode, frameCount: 0)
            }
        }

        NotificationCenter.postOnMainThread(notification: Constants.Notifications.manyEpisodesChanged)
    }

    private func convertRefreshResult(result: RefreshFetchResult) -> UIBackgroundFetchResult {
        switch result {
        case .failed:
            return UIBackgroundFetchResult.failed
        case .newData:
            return UIBackgroundFetchResult.newData
        case .noData:
            return UIBackgroundFetchResult.noData
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let role = connectingSceneSession.role

        if role == UISceneSession.Role.carTemplateApplication {
            return UISceneConfiguration(name: "Pocket Casts Car", sessionRole: UISceneSession.Role.carTemplateApplication)
        }

        return UISceneConfiguration(name: "Default Configuration", sessionRole: role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: Secrets

    private func setupSecrets() {
        ServerCredentials.sharing = ApiCredentials.sharingServerSecret
    }

    private func setupSignOutListener() {
        guard backgroundSignOutListener == nil, let rootController = SceneHelper.rootViewController() else {
            return
        }

        backgroundSignOutListener = BackgroundSignOutListener(presentingViewController: rootController)
    }
}
