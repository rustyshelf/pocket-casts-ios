import Agrume
import AVKit
import SafariServices
import UIKit

class NowPlayingPlayerItemViewController: PlayerItemViewController {
    var showingCustomImage = false
    var lastChapterIndexRendered = -1

    var videoViewController: VideoViewController?

    @IBOutlet var skipBackBtn: SkipButton! {
        didSet {
            skipBackBtn.skipBack = true
        }
    }

    @IBOutlet var skipFwdBtn: SkipButton! {
        didSet {
            skipFwdBtn.skipBack = false
            skipFwdBtn.longPressed = { [weak self] in
                self?.skipForwardLongPressed()
            }
        }
    }

    @IBOutlet var playPauseBtn: PlayPauseButton!

    @IBOutlet var episodeImage: UIImageView! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            tapGesture.numberOfTapsRequired = 1
            tapGesture.numberOfTouchesRequired = 1
            episodeImage.addGestureRecognizer(tapGesture)
        }
    }

    @IBOutlet var episodeName: ThemeableLabel! {
        didSet {
            episodeName.style = .playerContrast01
        }
    }

    @IBOutlet var podcastName: ThemeableLabel! {
        didSet {
            podcastName.style = .playerContrast02
        }
    }

    @IBOutlet var chapterName: ThemeableLabel! {
        didSet {
            chapterName.style = .playerContrast01

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(chapterNameTapped))
            chapterName.addGestureRecognizer(tapGesture)
        }
    }

    @IBOutlet var floatingVideoView: FloatingVideoView! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(videoTapped))
            tapGesture.numberOfTapsRequired = 1
            tapGesture.numberOfTouchesRequired = 1
            floatingVideoView.addGestureRecognizer(tapGesture)
        }
    }

    // MARK: - Chapters

    @IBOutlet var chapterSkipBackBtn: UIButton! {
        didSet {
            chapterSkipBackBtn.tintColor = ThemeColor.playerContrast01()
        }
    }

    @IBOutlet var chapterSkipFwdBtn: UIButton! {
        didSet {
            chapterSkipFwdBtn.tintColor = ThemeColor.playerContrast01()
        }
    }

    @IBOutlet var chapterCounter: ThemeableLabel! {
        didSet {
            chapterCounter.style = .playerContrast02
        }
    }

    @IBOutlet var chapterTimeLeftLabel: UILabel! {
        didSet {
            chapterTimeLeftLabel.font = chapterTimeLeftLabel.font.monospaced()
        }
    }

    @IBOutlet var chapterProgress: ProgressCircleView! {
        didSet {
            chapterProgress.lineWidth = 2
            chapterProgress.lineColor = ThemeColor.playerContrast03()
        }
    }

    @IBOutlet var chapterLink: UIView! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(chapterLinkTapped))
            chapterLink.addGestureRecognizer(tapGesture)
        }
    }

    @IBOutlet var chapterInfoView: UIView!
    @IBOutlet var episodeInfoView: UIView!

    @IBOutlet var shelfBg: ThemeableView! {
        didSet {
            shelfBg.style = .playerContrast06
        }
    }

    // MARK: - Time Slider

    @IBOutlet var timeSlider: TimeSlider! {
        didSet {
            timeSlider.delegate = self
        }
    }

    @IBOutlet var playerControlsStackView: UIStackView!

    @IBOutlet var timeSliderHolderView: UIView!

    @IBOutlet var timeElapsed: ThemeableLabel! {
        didSet {
            timeElapsed.style = .playerContrast02
            timeElapsed.font = UIFont.monospacedDigitSystemFont(ofSize: 12, weight: UIFont.Weight.medium)
        }
    }

    @IBOutlet var timeRemaining: ThemeableLabel! {
        didSet {
            timeRemaining.style = .playerContrast02
            timeRemaining.font = UIFont.monospacedDigitSystemFont(ofSize: 12, weight: UIFont.Weight.medium)
        }
    }

    @IBOutlet var playPauseHeightConstraint: NSLayoutConstraint!

    let routePicker = PCRoutePickerView(frame: CGRect.zero)

    private lazy var upNextController = UpNextViewController()

    lazy var upNextViewController: UIViewController = {
        let controller = SJUIUtils.navController(for: upNextController, navStyle: .secondaryUi01, titleStyle: .playerContrast01, iconStyle: .playerContrast01, themeOverride: .dark)
        controller.modalPresentationStyle = .pageSheet

        return controller
    }()

    var lastShelfLoadState = ShelfLoadState()

    override func viewDidLoad() {
        super.viewDidLoad()

        let upNextPan = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerHandler(_:)))
        upNextPan.delegate = self
        view.addGestureRecognizer(upNextPan)
    }

    private var lastBoundsAdjustedFor = CGRect.zero

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // there's some expensive operations below, so only do them if the bounds has actually changed
        if lastBoundsAdjustedFor == view.bounds { return }
        lastBoundsAdjustedFor = view.bounds

        let screenHeight = view.bounds.height
        let spacing: CGFloat = screenHeight > 600 ? 30 : 20
        if playerControlsStackView.spacing != spacing { playerControlsStackView.spacing = spacing }

        let height: CGFloat = screenHeight > 710 ? 100 : 80
        if playPauseHeightConstraint.constant != height { playPauseHeightConstraint.constant = height }
    }

    override func willBeAddedToPlayer() {
        update()
        addObservers()
    }

    override func willBeRemovedFromPlayer() {
        removeAllCustomObservers()
    }

    override func themeDidChange() {
        lastShelfLoadState = ShelfLoadState()
        update()
    }

    // MARK: - Interface Actions

    @IBAction func skipBackTapped(_ sender: Any) {
        HapticsHelper.triggerSkipBackHaptic()
        PlaybackManager.shared.skipBack()
    }

    @IBAction func playPauseTapped(_ sender: Any) {
        HapticsHelper.triggerPlayPauseHaptic()
        PlaybackManager.shared.playPause()
    }

    @IBAction func skipFwdTapped(_ sender: Any) {
        HapticsHelper.triggerSkipForwardHaptic()
        PlaybackManager.shared.skipForward()
    }

    @IBAction func chapterSkipBackTapped(_ sender: Any) {
        PlaybackManager.shared.skipToPreviousChapter()
    }

    @IBAction func chapterSkipForwardTapped(_ sender: Any) {
        PlaybackManager.shared.skipToNextChapter()
    }

    @objc private func chapterLinkTapped() {
        guard let chapter = PlaybackManager.shared.currentChapter(), let urlString = chapter.url, let url = URL(string: urlString) else { return }

        if UserDefaults.standard.bool(forKey: Constants.UserDefaults.openLinksInExternalBrowser) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }

    @objc private func imageTapped() {
        guard let artwork = episodeImage.image else { return }

        let agrume = Agrume(image: artwork, background: .blurred(.regular))
        agrume.show(from: self)
    }

    @objc private func videoTapped() {
        guard let episode = PlaybackManager.shared.currentEpisode() else { return }

        if episode.videoPodcast() {
            let videoController = VideoViewController()
            videoViewController = videoController
            videoViewController?.modalTransitionStyle = .crossDissolve
            videoViewController?.modalPresentationStyle = .fullScreen
            videoViewController?.willAttachPlayer = { [weak self] in
                self?.floatingVideoView.player = nil
            }
            videoViewController?.willDeattachPlayer = { [weak self] in
                self?.floatingVideoView.player = PlaybackManager.shared.internalPlayerForVideoPlayback()
            }

            present(videoController, animated: true, completion: nil)
        }
    }

    @objc private func chapterNameTapped() {
        containerDelegate?.scrollToCurrentChapter()
    }

    private func skipForwardLongPressed() {
        guard let episode = PlaybackManager.shared.currentEpisode() else { return }

        let options = OptionsPicker(title: nil, themeOverride: .dark)

        let markPlayedOption = OptionAction(label: L10n.markPlayedShort, icon: nil) {
            EpisodeManager.markAsPlayed(episode: episode, fireNotification: true)
        }
        options.addAction(action: markPlayedOption)

        if PlaybackManager.shared.queue.upNextCount() > 0 {
            let skipToNextAction = OptionAction(label: L10n.nextEpisode, icon: nil) {
                let currentlyPlayingEpisode = PlaybackManager.shared.currentEpisode()
                PlaybackManager.shared.removeIfPlayingOrQueued(episode: currentlyPlayingEpisode, fireNotification: true, userInitiated: true)
            }
            options.addAction(action: skipToNextAction)
        }

        options.show(statusBarStyle: preferredStatusBarStyle)
    }
}
