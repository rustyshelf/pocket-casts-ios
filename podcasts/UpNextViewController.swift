import PocketCastsDataModel
import PocketCastsUtils
import UIKit

class UpNextViewController: UIViewController, UIGestureRecognizerDelegate {
    static let playerCell = "PlayerCell"
    static let noUpNextCell = "NothingUpNextCell"
    static let nowPlayingCell = "UpNextNowPlayingCell"
    static let upNextSection = 1
    static let upNextRowHeight: CGFloat = 72
    static let noUpNextRowHeight: CGFloat = 180
    static let nowPlayingRowHeight: CGFloat = 72
    static let rearrangeWidth: CGFloat = 60

    enum sections: Int { case nowPlayingSection = 0, upNextSection }

    var themeOverride: Theme.ThemeType {
        if Theme.isDarkTheme() { return Theme.sharedTheme.activeTheme }

        return .dark
    }

    var changedViaSwipeToRemove = false

    let remainingLabel = ThemeableLabel()
    let clearQueueButton = UIButton(frame: CGRect(x: 0, y: 0, width: 93, height: 16))

    @IBOutlet var upNextTable: ThemeableTable! {
        didSet {
            upNextTable.themeOverride = themeOverride
            upNextTable.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: UpNextViewController.playerCell)
            upNextTable.register(UINib(nibName: "NothingUpNextCell", bundle: nil), forCellReuseIdentifier: UpNextViewController.noUpNextCell)
            upNextTable.register(UINib(nibName: "UpNextNowPlayingCell", bundle: nil), forCellReuseIdentifier: UpNextViewController.nowPlayingCell)
            upNextTable.backgroundView = nil
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.upNext

        (view as? ThemeableView)?.style = .primaryUi04
        (view as? ThemeableView)?.themeOverride = themeOverride

        updateNavBarButtons()

        NotificationCenter.default.addObserver(self, selector: #selector(upNextChanged), name: Constants.Notifications.playbackTrackChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(upNextChanged), name: Constants.Notifications.playbackEnded, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(upNextChanged), name: Constants.Notifications.upNextQueueChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(upNextChanged), name: Constants.Notifications.upNextEpisodeAdded, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(upNextChanged), name: Constants.Notifications.upNextEpisodeRemoved, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTimeRemainingLabel), name: Constants.Notifications.playbackProgress, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)

        remainingLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        remainingLabel.adjustsFontSizeToFitWidth = true
        remainingLabel.minimumScaleFactor = 0.8
        remainingLabel.numberOfLines = 2
        remainingLabel.style = .playerContrast02
        remainingLabel.themeOverride = themeOverride

        clearQueueButton.setTitle(L10n.queueClearQueue, for: .normal)
        clearQueueButton.setTitleColor(AppTheme.colorForStyle(.playerContrast01, themeOverride: themeOverride), for: .normal)
        clearQueueButton.setTitleColor(AppTheme.colorForStyle(.playerContrast05, themeOverride: themeOverride), for: .disabled)
        clearQueueButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        clearQueueButton.addTarget(self, action: #selector(clearQueueTapped), for: .touchUpInside)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // fix issues with the now playing cell not animating by reloading it on appear
        upNextTable.reloadData()
    }

    @objc func clearQueueTapped() {
        let queueCount = PlaybackManager.shared.queue.upNextCount()

        if queueCount <= Constants.Limits.upNextClearWithoutWarning {
            performClearAll()
        } else {
            let clearOptions = OptionsPicker(title: nil, themeOverride: .dark)
            let actionLabel = L10n.queueClearEpisodeQueuePlural(queueCount.localized())
            let clearAllAction = OptionAction(label: actionLabel, icon: nil, action: { [weak self] in
                self?.performClearAll()
            })
            clearAllAction.destructive = true
            clearOptions.addDescriptiveActions(title: L10n.clearUpNext, message: L10n.clearUpNextMessage, icon: "option-clear", actions: [clearAllAction])

            clearOptions.show(statusBarStyle: preferredStatusBarStyle)
        }
    }

    private func performClearAll() {
        PlaybackManager.shared.queue.clearUpNextList()
        upNextTable.reloadData()
    }

    var userEpisodeDetailVC: UserEpisodeDetailViewController?

    func showEpisodeDetailViewController(for episode: BaseEpisode?) {
        if let episode = episode as? Episode, let parentPodcast = episode.parentPodcast() {
            let episodeController = EpisodeDetailViewController(episode: episode, podcast: parentPodcast)
            episodeController.modalPresentationStyle = .formSheet
            episodeController.themeOverride = themeOverride
            present(episodeController, animated: true, completion: nil)
        } else if let userEpisode = episode as? UserEpisode {
            if let fullEpisode = DataManager.sharedManager.findUserEpisode(uuid: userEpisode.uuid) {
                userEpisodeDetailVC = UserEpisodeDetailViewController(episode: fullEpisode)
                userEpisodeDetailVC?.delegate = self
                userEpisodeDetailVC?.themeOverride = themeOverride
                userEpisodeDetailVC?.animateIn()
            }
        }
    }

    @objc func updateTimeRemainingLabel() {
        var totalDuration = PlaybackManager.shared.queue.upNextTotalDuration(includePlayingEpisode: false)
        if let episode = PlaybackManager.shared.currentEpisode() {
            totalDuration += episode.duration.seconds - PlaybackManager.shared.currentTime()
        }
        remainingLabel.text = L10n.queueTotalTimeRemaining(TimeFormatter.shared.multipleUnitFormattedShortTime(time: totalDuration))
    }

    // MARK: - Nav bar actions

    @objc func doneTapped() {
        dismiss(animated: true, completion: nil)
    }

    func updateNavBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: L10n.done, style: .plain, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: upNextTable.isEditing ? L10n.done : "Reorder", style: .plain, target: self, action: #selector(toggleEdit))
    }
    
    @objc private func toggleEdit() {
        upNextTable.isEditing = !upNextTable.isEditing
        updateNavBarButtons()
    }

    // MARK: - Orientation

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
}
