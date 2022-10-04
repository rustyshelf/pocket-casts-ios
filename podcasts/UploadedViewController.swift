import PocketCastsDataModel
import PocketCastsServer
import UIKit

class UploadedViewController: PCViewController, UserEpisodeDetailProtocol {
    @IBOutlet var uploadsTable: ThemeableTable! {
        didSet {
            uploadsTable.updateContentInset()
            uploadsTable.allowsMultipleSelectionDuringEditing = true
        }
    }

    @IBOutlet var noEpisodesScrollView: UIScrollView! {
        didSet {
            noEpisodesScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Constants.Values.miniPlayerOffset, right: 0)
        }
    }

    @IBOutlet var noFilesImage: ThemeableImageView! {
        didSet {
            noFilesImage.imageNameFunc = AppTheme.noFilesImageName
        }
    }

    @IBOutlet var noEpisodeTitleLabel: ThemeableLabel! {
        didSet {
            noEpisodeTitleLabel.style = .primaryText01
            noEpisodeTitleLabel.text = L10n.fileUploadNoFilesTitle
        }
    }

    @IBOutlet var noEpisodeDetailLabel: ThemeableLabel! {
        didSet {
            noEpisodeDetailLabel.style = .primaryText02
            noEpisodeDetailLabel.text = L10n.fileUploadNoFilesDescription
        }
    }

    @IBOutlet var howToBtn: ThemeableUIButton! {
        didSet {
            howToBtn.setTitle(L10n.fileUploadNoFilesHelper, for: .normal)
        }
    }

    var uploadedEpisodes = [UserEpisode]()
    let headerView = UploadedStorageHeaderView()

    private var tableRefreshControl: UploadedRefreshControl?
    private var noEpisodeRefreshControl: UploadedRefreshControl?
    var userEpisodeDetailVC: UserEpisodeDetailViewController?

    // MARK: - View Methods

    override func viewDidLoad() {
        setupNavBar()
        super.viewDidLoad()

        registerCells()
        title = L10n.files

        if let navController = navigationController, SubscriptionHelper.hasActiveSubscription() {
            tableRefreshControl = UploadedRefreshControl(scrollView: uploadsTable, navBar: navController.navigationBar)
            noEpisodeRefreshControl = UploadedRefreshControl(scrollView: noEpisodesScrollView, navBar: navController.navigationBar)
        }

        noEpisodesScrollView.alwaysBounceVertical = true

        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        headerView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        headerView.controllerForPresenting = self
        uploadsTable.tableHeaderView = headerView
        updateHeaderView()

        reloadLocalFiles()
    }

    var fileURL: URL?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        tableRefreshControl?.parentViewControllerDidAppear()
        noEpisodeRefreshControl?.parentViewControllerDidAppear()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.shadowImage = nil

        reloadAllFiles()
        addUIObservers()
        updateContentOffsets()

        if let fileURL = fileURL {
            let addCustomVC = AddCustomViewController(fileUrl: fileURL)

            present(SJUIUtils.popupNavController(for: addCustomVC), animated: true, completion: nil)
            self.fileURL = nil
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeAllCustomObservers()
        tableRefreshControl?.parentViewControllerDidDisappear()
        noEpisodeRefreshControl?.parentViewControllerDidDisappear()
    }

    // MARK: - App Backgrounding

    override func handleAppWillBecomeActive() {
        reloadAllFiles()
        addUIObservers()
        updateContentOffsets()
    }

    override func handleAppDidEnterBackground() {
        // we don't need to keep our UI up to date while backgrounded, so remove all the notification observers we have
        removeAllCustomObservers()
    }

    private func addUIObservers() {
        // TODO: a table diff might be more efficient here (and have nicer animations)

        addCustomObserver(ServerNotifications.userEpisodesRefreshed, selector: #selector(handleReloadFromNotification))
        addCustomObserver(ServerNotifications.userEpisodesRefreshFailed, selector: #selector(handleReloadFromNotification))
        addCustomObserver(Constants.Notifications.upNextEpisodeAdded, selector: #selector(handleReloadFromNotification))
        addCustomObserver(Constants.Notifications.upNextQueueChanged, selector: #selector(handleReloadFromNotification))
        addCustomObserver(Constants.Notifications.upNextEpisodeRemoved, selector: #selector(handleReloadFromNotification))
        addCustomObserver(Constants.Notifications.userEpisodeDeleted, selector: #selector(handleReloadFromNotification))
        addCustomObserver(Constants.Notifications.playbackFailed, selector: #selector(handleReloadFromNotification))
        addCustomObserver(Constants.Notifications.episodePlayStatusChanged, selector: #selector(handleReloadFromNotification))
        addCustomObserver(Constants.Notifications.episodeDownloadStatusChanged, selector: #selector(handleReloadFromNotification))
        addCustomObserver(Constants.Notifications.manyEpisodesChanged, selector: #selector(handleReloadFromNotification))
        addCustomObserver(ServerNotifications.userEpisodeUploadStatusChanged, selector: #selector(uploadCompletedRefresh(notification:)))
        addCustomObserver(Constants.Notifications.miniPlayerDidDisappear, selector: #selector(updateContentOffsets))
        addCustomObserver(Constants.Notifications.miniPlayerDidAppear, selector: #selector(updateContentOffsets))
    }

    func setupNavBar() {
        super.customRightBtn = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(menuTapped))
        super.customRightBtn?.accessibilityLabel = L10n.accessibilitySortAndOptions

        navigationItem.leftBarButtonItem = nil
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc private func menuTapped(_ sender: UIBarButtonItem) {
        let optionsPicker = OptionsPicker(title: nil)

        let currentSort = UploadedSort(rawValue: Settings.userEpisodeSortBy())
        let sortAction = OptionAction(label: L10n.sortBy, secondaryLabel: currentSort?.description ?? "", icon: "podcastlist_sort") {
            self.showSortByPicker()
        }
        optionsPicker.addAction(action: sortAction)

        let settingsAction = OptionAction(label: L10n.settingsFiles, icon: "podcast-settings") { [weak self] in
            self?.navigationController?.pushViewController(UploadedSettingsViewController(), animated: true)
        }
        optionsPicker.addAction(action: settingsAction)

        optionsPicker.show(statusBarStyle: preferredStatusBarStyle)
    }

    @objc private func handleReloadFromNotification() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            self.reloadLocalFiles()
        }
    }

    func reloadLocalFiles() {
        let sortBy = UploadedSort(rawValue: Settings.userEpisodeSortBy()) ?? UploadedSort.newestToOldest

        if SubscriptionHelper.hasActiveSubscription() {
            uploadedEpisodes = DataManager.sharedManager.allUserEpisodes(sortedBy: sortBy)
        } else {
            uploadedEpisodes = DataManager.sharedManager.allUserEpisodesDownloaded(sortedBy: sortBy)
        }
        uploadsTable.isHidden = (uploadedEpisodes.count == 0)

        uploadsTable.reloadData()
        updateHeaderView()
    }

    private func reloadAllFiles() {
        if SubscriptionHelper.hasActiveSubscription() {
            UserEpisodeManager.updateUserEpisodes()
        } else {
            reloadLocalFiles()
        }
    }

    @IBAction func howToTapped(_ sender: Any) {
        let howToController = HowToUploadViewController()
        let navController = SJUIUtils.navController(for: howToController)
        present(navController, animated: true, completion: nil)
    }

    func showSortByPicker() {
        let optionsPicker = OptionsPicker(title: L10n.sortBy.localizedUppercase)
        optionsPicker.addAction(action: createSortAction(sort: .newestToOldest))
        optionsPicker.addAction(action: createSortAction(sort: .oldestToNewest))
        optionsPicker.addAction(action: createSortAction(sort: .titleAtoZ))

        optionsPicker.show(statusBarStyle: AppTheme.defaultStatusBarStyle())
    }

    private func createSortAction(sort: UploadedSort) -> OptionAction {
        let action = OptionAction(label: sort.description, selected: sort.rawValue == Settings.userEpisodeSortBy()) {
            Settings.setUserEpisodeSortBy(sort.rawValue)

            self.reloadLocalFiles()
        }

        return action
    }

    @objc func updateHeaderView() {
        headerView.update()
    }

    @objc func uploadCompletedRefresh(notification: Notification) {
        guard let episodeUuid = notification.object as? String, let episode = DataManager.sharedManager.findUserEpisode(uuid: episodeUuid), episode.uploaded() else {
            return
        }
        UserEpisodeManager.updateUserEpisodes()
    }

    // NARK :- UserEpisodeDetailViewControllerDelegate
    func showEdit(userEpisode: UserEpisode) {
        let editVC = AddCustomViewController(episode: userEpisode)
        navigationController?.pushViewController(editVC, animated: true)
    }

    func showDeleteConfirmation(userEpisode: UserEpisode) {
        UserEpisodeManager.presentDeleteOptions(episode: userEpisode, preferredStatusBarStyle: preferredStatusBarStyle, themeOverride: nil) { deletedLocal, deletedRemote in
            if deletedRemote {
                self.removeFromUploadTable(userEpisode: userEpisode)
            }
            if deletedLocal {
                self.reloadLocalFiles()
            }
        }

        dismiss(animated: true, completion: nil)
    }

    func showUpgradeRequired() {
        NavigationManager.sharedManager.showUpsellView(from: self, source: .files)
    }

    func userEpisodeDetailClosed() {
        userEpisodeDetailVC = nil
    }

    func closeAllChildrenViewControllers() {
        if let openAddFilesVC = presentedViewController?.children.first as? AddCustomViewController {
            openAddFilesVC.cancelTapped()
        }
        if let openUserEpiosdeDetails = userEpisodeDetailVC {
            openUserEpiosdeDetails.animateOut()
        }
    }

    private func removeFromUploadTable(userEpisode: UserEpisode) {
        guard let index = uploadedEpisodes.firstIndex(where: { $0.uuid == userEpisode.uuid }) else { return }
        uploadedEpisodes.remove(at: index)
        uploadsTable.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }

    // MARK: - UIScrollView

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let selectedRefreshControl: UploadedRefreshControl?
        if scrollView == noEpisodesScrollView {
            selectedRefreshControl = noEpisodeRefreshControl
        } else {
            selectedRefreshControl = tableRefreshControl
        }

        selectedRefreshControl?.scrollViewDidScroll(scrollView)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let selectedRefreshControl: UploadedRefreshControl?
        if scrollView == noEpisodesScrollView {
            selectedRefreshControl = noEpisodeRefreshControl
        } else {
            selectedRefreshControl = tableRefreshControl
        }

        selectedRefreshControl?.scrollViewDidEndDragging(scrollView)
    }

    override func handleThemeChanged() {
        uploadsTable.reloadData()
    }

    @objc private func updateContentOffsets() {
        uploadsTable.updateContentInset()
    }
}
