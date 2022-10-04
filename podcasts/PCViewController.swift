import UIKit

class PCViewController: SimpleNotificationsViewController {
    var customRightBtn: UIBarButtonItem? {
        didSet {
            refreshRightButtons()
        }
    }

    private var navIconsColor: UIColor?
    private var navTitleColor: UIColor?
    private var navBgColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "nav-back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav-back")

        navigationItem.backButtonDisplayMode = .minimal

        if let _ = customRightBtn {
            refreshRightButtons()
        }
        setupNavBar(animated: false)

        NotificationCenter.default.addObserver(self, selector: #selector(themeDidChange), name: Constants.Notifications.themeChanged, object: nil)
    }

    deinit {
        navigationController?.delegate = nil
        NotificationCenter.default.removeObserver(self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let title = title, title.count > 0 {
            setupNavBar(animated: animated)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refreshRightButtons()

        NotificationCenter.default.addObserver(self, selector: #selector(appWasBackgrounded), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillBecomeActive), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if customRightBtn != nil {
            navigationItem.rightBarButtonItems = nil
            navigationItem.rightBarButtonItem = nil
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        navigationController?.delegate = nil

        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @objc func refreshRightButtons() {
        navigationItem.rightBarButtonItems = nil
        navigationItem.rightBarButtonItem = customRightBtn
    }

    func changeNavTint(titleColor: UIColor?, iconsColor: UIColor?, backgroundColor: UIColor? = nil) {
        navTitleColor = titleColor
        navIconsColor = iconsColor
        navBgColor = backgroundColor

        setupNavBar(animated: false)
    }

    func createStandardCloseButton(imageName: String) -> UIButton {
        let closeButton = UIButton(type: .custom)
        closeButton.setTitle("", for: .normal)
        let image = UIImage(named: imageName)
        closeButton.setImage(image, for: .normal)
        closeButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        closeButton.bounds = CGRect(x: 0, y: 0, width: 44, height: 44)
        closeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 22)

        return closeButton
    }

    @objc private func themeDidChange() {
        setupNavBar(animated: false)
        handleThemeChanged()
    }

    private func setupNavBar(animated: Bool) {
        guard let navController = navigationController else { return }

        let navigationBar = navController.navigationBar
        let titleColor = navTitleColor ?? AppTheme.navBarTitleColor()
        let iconsColor = navIconsColor ?? AppTheme.navBarIconsColor()
        let backgroundColor = navBgColor ?? ThemeColor.secondaryUi01()

        navigationBar.backIndicatorImage = UIImage(named: "nav-back")?.tintedImage(iconsColor)
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav-back")?.tintedImage(iconsColor)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
        appearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 31, weight: .bold)
        ]
        appearance.shadowColor = nil

        if animated {
            UIView.animate(withDuration: Constants.Animation.defaultAnimationTime, animations: {
                navigationBar.standardAppearance = appearance
                navigationBar.scrollEdgeAppearance = appearance
                navigationBar.tintColor = iconsColor
            })
        } else {
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.tintColor = iconsColor
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        AppTheme.defaultStatusBarStyle()
    }

    override var prefersHomeIndicatorAutoHidden: Bool {
        appDelegate()?.miniPlayer()?.playerOpenState == .open
    }

    @objc private func appWasBackgrounded() {
        handleAppDidEnterBackground()
    }

    @objc private func appWillBecomeActive() {
        handleAppWillBecomeActive()
    }

    func handleAppDidEnterBackground() {}
    func handleAppWillBecomeActive() {}
    func handleThemeChanged() {}
}
