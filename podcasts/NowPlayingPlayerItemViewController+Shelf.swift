import AVKit
import Foundation
import PocketCastsDataModel

protocol NowPlayingActionsDelegate: AnyObject {
    func starEpisodeTapped()
    func effectsTapped()
    func sleepTimerTapped()
    func routePickerTapped()
    func shareTapped()
    func goToTapped()
    func markPlayedTapped()
    func archiveTapped()

    func sharedRoutePicker(largeSize: Bool) -> PCRoutePickerView
}

extension NowPlayingPlayerItemViewController: NowPlayingActionsDelegate {
    @objc func reloadShelfActions() {
        guard let playingEpisode = PlaybackManager.shared.currentEpisode() else { return }

        let actions = Settings.playerActions()

        // don't reload the actions unless we need to
        if !lastShelfLoadState.updateRequired(shelfActions: actions, episodeUuid: playingEpisode.uuid, effectsOn: PlaybackManager.shared.effects().effectsEnabled(), sleepTimerOn: PlaybackManager.shared.sleepTimerActive()) { return }

        // load the first 4 actions into the player, followed by an overflow icon
        playerControlsStackView.removeAllSubviews()
        for action in actions {
            if !action.canBePerformedOn(episode: playingEpisode) { continue }

            if !loadActionIntoShelf(action, playingEpisode: playingEpisode) { break }
        }
    }

    private func loadActionIntoShelf(_ action: PlayerAction, playingEpisode: BaseEpisode) -> Bool {
        let currentActionCount = playerControlsStackView.arrangedSubviews.count

        if Constants.Limits.maxShelfActions == currentActionCount {
            // add the overflow action
            let overflowButton = UIButton(frame: CGRect.zero)
            overflowButton.isPointerInteractionEnabled = true
            overflowButton.setImage(UIImage(named: "more"), for: .normal)
            overflowButton.imageView?.tintColor = ThemeColor.playerContrast02()
            overflowButton.addTarget(self, action: #selector(overflowTapped), for: .touchUpInside)
            overflowButton.accessibilityLabel = L10n.accessibilityMoreActions
            addToShelf(on: overflowButton)

            return false
        }

        switch action {
        case .effects:
            let effects = PlaybackManager.shared.effects()

            let effectsBtn = EffectsButton(frame: CGRect.zero)
            effectsBtn.isPointerInteractionEnabled = true
            effectsBtn.effectsOn = effects.effectsEnabled()
            effectsBtn.tintColor = effectsBtn.effectsOn ? PlayerColorHelper.playerHighlightColor01(for: .dark) : ThemeColor.playerContrast02()
            effectsBtn.addTarget(self, action: #selector(effectsBtnTapped(_:)), for: .touchUpInside)

            addToShelf(on: effectsBtn)
        case .sleepTimer:
            let sleepBtn = SleepTimerButton(frame: CGRect.zero)
            sleepBtn.isPointerInteractionEnabled = true
            let sleepTimerActive = PlaybackManager.shared.sleepTimerActive()
            sleepBtn.tintColor = sleepTimerActive ? PlayerColorHelper.playerHighlightColor01(for: .dark) : ThemeColor.playerContrast02()
            sleepBtn.sleepTimerOn = sleepTimerActive
            sleepBtn.addTarget(self, action: #selector(sleepBtnTapped(_:)), for: .touchUpInside)
            sleepBtn.accessibilityLabel = sleepTimerActive ? L10n.playerAccessibilitySleepTimerOn : L10n.playerActionTitleSleepTimer
            addToShelf(on: sleepBtn)
            sleepBtn.setupAnimation()
        case .routePicker:
            let picker = sharedRoutePicker(largeSize: true)
            playerControlsStackView.addArrangedSubview(picker)
            addToShelf(on: picker)
        case .shareEpisode:
            if playingEpisode is Episode {
                let shareBtn = UIButton(frame: CGRect.zero)
                shareBtn.isPointerInteractionEnabled = true
                shareBtn.setImage(UIImage(named: action.largeIconName(episode: nil)), for: .normal)
                shareBtn.imageView?.tintColor = ThemeColor.playerContrast02()
                shareBtn.addTarget(self, action: #selector(shareTapped(_:)), for: .touchUpInside)
                shareBtn.accessibilityLabel = L10n.share

                addToShelf(on: shareBtn)
            }
        case .goToPodcast:
            let gotoPodcastBtn = UIButton(frame: CGRect.zero)
            gotoPodcastBtn.isPointerInteractionEnabled = true
            gotoPodcastBtn.imageView?.tintColor = ThemeColor.playerContrast02()
            gotoPodcastBtn.setImage(UIImage(named: action.largeIconName(episode: nil)), for: .normal)
            gotoPodcastBtn.addTarget(self, action: #selector(goToTapped(_:)), for: .touchUpInside)
            gotoPodcastBtn.accessibilityLabel = L10n.goToPodcast

            addToShelf(on: gotoPodcastBtn)
        case .starEpisode:
            if playingEpisode is Episode {
                let starBtn = UIButton(frame: CGRect.zero)
                starBtn.isPointerInteractionEnabled = true
                let starImage = UIImage(named: action.largeIconName(episode: playingEpisode))
                starBtn.setImage(starImage, for: .normal)
                starBtn.accessibilityLabel = PlayerAction.starEpisode.title(episode: playingEpisode)
                starBtn.addTarget(self, action: #selector(starTapped(_:)), for: .touchUpInside)
                starBtn.imageView?.tintColor = playingEpisode.keepEpisode ? PlayerColorHelper.playerHighlightColor01(for: .dark) : ThemeColor.playerContrast02()

                addToShelf(on: starBtn)
            }
        case .markPlayed:
            let markPlayedBtn = UIButton(frame: CGRect.zero)
            markPlayedBtn.isPointerInteractionEnabled = true
            markPlayedBtn.imageView?.tintColor = ThemeColor.playerContrast02()
            markPlayedBtn.setImage(UIImage(named: action.largeIconName(episode: nil)), for: .normal)
            markPlayedBtn.addTarget(self, action: #selector(markPlayedTapped(_:)), for: .touchUpInside)
            markPlayedBtn.accessibilityLabel = L10n.markPlayed

            addToShelf(on: markPlayedBtn)
        case .archive:
            let archiveButton = UIButton(frame: CGRect.zero)
            archiveButton.isPointerInteractionEnabled = true
            archiveButton.imageView?.tintColor = ThemeColor.playerContrast02()
            archiveButton.setImage(UIImage(named: action.largeIconName(episode: playingEpisode)), for: .normal)
            archiveButton.addTarget(self, action: #selector(archiveTapped(_:)), for: .touchUpInside)
            archiveButton.accessibilityLabel = L10n.archive

            addToShelf(on: archiveButton)
        }

        return true
    }

    // MARK: - NowPlayingActionsDelegate

    func starEpisodeTapped() {
        performStarAction()
    }

    func effectsTapped() {
        showEffectsPanel()
    }

    func sleepTimerTapped() {
        showSleepPanel()
    }

    func routePickerTapped() {
        // not super happy with this solution but there doesn't appear to be a public API to pop this dialog up...
        if let routePickerButton = routePicker.subviews.first(where: { $0 is UIButton }) as? UIButton {
            routePickerButton.sendActions(for: .touchUpInside)
        }
    }

    func shareTapped() {
        shareEpisode(sender: playerControlsStackView)
    }

    func goToTapped() {
        if PlaybackManager.shared.currentEpisode() is Episode {
            goToPodcast()
        } else if PlaybackManager.shared.currentEpisode() is UserEpisode {
            goToFiles()
        }
    }

    func markPlayedTapped() {
        markPlayed()
    }

    func archiveTapped() {
        if PlaybackManager.shared.currentEpisode() is UserEpisode {
            delete()
        } else {
            archive()
        }
    }

    func sharedRoutePicker(largeSize: Bool) -> PCRoutePickerView {
        routePicker.removeFromSuperview()
        routePicker.setupColors()

        if largeSize {
            routePicker.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1)
        } else {
            routePicker.layer.transform = CATransform3DIdentity
        }

        return routePicker
    }

    // MARK: - Player Actions

    @objc private func overflowTapped() {
        let shelfController = ShelfActionsViewController()
        shelfController.playerActionsDelegate = self
        shelfController.configureBottomSheetModal()

        present(shelfController, animated: true, completion: nil)
    }

    @objc private func sleepBtnTapped(_ sender: UIButton) {
        showSleepPanel()
    }

    @objc private func effectsBtnTapped(_ sender: UIButton) {
        showEffectsPanel()
    }

    @objc private func starTapped(_ sender: UIButton) {
        performStarAction(starBtn: sender)
    }

    @objc private func goToTapped(_ sender: UIButton) {
        goToTapped()
    }

    @objc private func markPlayedTapped(_ sender: UIButton) {
        markPlayed()
    }

    @objc private func archiveTapped(_ sender: UIButton) {
        archiveTapped()
    }

    @objc private func shareTapped(_ sender: UIButton) {
        shareEpisode(sender: sender)
    }

    // MARK: - Sleep Timer

    @objc func sleepTimerUpdated() {
        reloadShelfActions()
    }

    // MARK: - Actions Implementation

    private func goToFiles() {
        NavigationManager.sharedManager.navigateTo(NavigationManager.filesPageKey, data: nil)
    }

    private func goToPodcast() {
        guard let episode = PlaybackManager.shared.currentEpisode() as? Episode else { return }

        NavigationManager.sharedManager.navigateTo(NavigationManager.podcastPageKey, data: [NavigationManager.podcastKey: episode.podcastUuid])
    }

    private func markPlayed() {
        guard let episode = PlaybackManager.shared.currentEpisode() else { return }

        let optionsPicker = OptionsPicker(title: nil, themeOverride: .dark)

        let markPlayedAction = OptionAction(label: L10n.markPlayedShort, icon: nil) {
            EpisodeManager.markAsPlayed(episode: episode, fireNotification: true)
        }
        markPlayedAction.destructive = true
        optionsPicker.addDescriptiveActions(title: L10n.playerMarkAsPlayedConfirmation, message: nil, icon: "shelf_played", actions: [markPlayedAction])
        optionsPicker.show(statusBarStyle: preferredStatusBarStyle)
    }

    private func delete() {
        guard let episode = PlaybackManager.shared.currentEpisode() as? UserEpisode else { return }

        UserEpisodeManager.presentDeleteOptions(episode: episode, preferredStatusBarStyle: preferredStatusBarStyle, themeOverride: .dark)
    }

    private func archive() {
        guard let episode = PlaybackManager.shared.currentEpisode() as? Episode else { return }

        let optionsPicker = OptionsPicker(title: nil, themeOverride: .dark)

        let archiveAction = OptionAction(label: L10n.archive, icon: nil) {
            EpisodeManager.archiveEpisode(episode: episode, fireNotification: true)
        }
        archiveAction.destructive = true
        optionsPicker.addDescriptiveActions(title: L10n.playerArchivedConfirmation, message: nil, icon: "shelf_archive", actions: [archiveAction])
        optionsPicker.show(statusBarStyle: preferredStatusBarStyle)
    }

    private func showSleepPanel() {
        let sleepController = SleepTimerViewController()
        sleepController.configureBottomSheetModal()
        present(sleepController, animated: true, completion: nil)
    }

    private func showEffectsPanel() {
        let effectsController = EffectsViewController()
        effectsController.configureBottomSheetModal()
        present(effectsController, animated: true, completion: nil)
    }

    private func performStarAction(starBtn: UIButton? = nil) {
        guard let episode = PlaybackManager.shared.currentEpisode() as? Episode else { return }

        EpisodeManager.setStarred(!episode.keepEpisode, episode: episode, updateSyncStatus: true)

        if let starBtn = starBtn {
            let starImage = episode.keepEpisode ? UIImage(named: "player_star_filled") : UIImage(named: "player_star_empty")

            UIView.transition(with: starBtn, duration: Constants.Animation.defaultAnimationTime, options: .transitionCrossDissolve, animations: {
                starBtn.setImage(starImage, for: .normal)
                starBtn.imageView?.tintColor = episode.keepEpisode ? PlayerColorHelper.playerHighlightColor01(for: .dark) : ThemeColor.playerContrast02()
            }, completion: nil)
        }
    }

    private func shareEpisode(sender: UIView) {
        guard let episode = PlaybackManager.shared.currentEpisode() as? Episode else { return }

        let shareOptions = OptionsPicker(title: L10n.playerShareHeader, themeOverride: .dark)

        let sharePodcastAction = OptionAction(label: L10n.podcastSingular, icon: "chapter-link") {
            self.sharePodcast(source: sender, podcast: episode.parentPodcast())
        }
        shareOptions.addAction(action: sharePodcastAction)

        let shareLinkAction = OptionAction(label: L10n.episode, icon: "chapter-link") {
            self.shareEpisode(source: sender, episode: episode, fromTime: 0)
        }
        shareOptions.addAction(action: shareLinkAction)

        let sharePositionAction = OptionAction(label: L10n.shareCurrentPosition, icon: "chapter-link") {
            self.shareEpisode(source: sender, episode: episode, fromTime: PlaybackManager.shared.currentTime())
        }
        shareOptions.addAction(action: sharePositionAction)

        shareOptions.show(statusBarStyle: preferredStatusBarStyle)
    }

    private func shareEpisode(source: UIView, episode: Episode, fromTime: TimeInterval) {
        guard let buttonSuperview = source.superview else { return }

        let sourceRect = buttonSuperview.convert(source.frame, to: view)
        SharingHelper.shared.shareLinkTo(episode: episode, shareTime: fromTime, fromController: self, sourceRect: sourceRect, sourceView: view)
    }

    private func sharePodcast(source: UIView, podcast: Podcast?) {
        guard let buttonSuperview = source.superview, let podcast = podcast else { return }

        let sourceRect = buttonSuperview.convert(source.frame, to: view)
        SharingHelper.shared.shareLinkTo(podcast: podcast, fromController: self, sourceRect: sourceRect, sourceView: view)
    }

    // MARK: - Private Helpers

    private func addToShelf(on view: UIView) {
        playerControlsStackView.addArrangedSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 32),
            view.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
