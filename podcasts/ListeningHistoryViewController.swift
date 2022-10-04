import DifferenceKit
import PocketCastsDataModel
import PocketCastsServer
import UIKit

class ListeningHistoryViewController: PCViewController {
    var episodes = [ArraySection<String, ListEpisode>]()
    private let operationQueue = OperationQueue()
    var cellHeights: [IndexPath: CGFloat] = [:]

    @IBOutlet var listeningHistoryTable: UITableView! {
        didSet {
            registerCells()
            listeningHistoryTable.updateContentInset()
            listeningHistoryTable.estimatedRowHeight = 80
            listeningHistoryTable.rowHeight = UITableView.automaticDimension
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        operationQueue.maxConcurrentOperationCount = 1
        title = L10n.listeningHistory
        refreshEpisodes(animated: false)

        setupNavBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        addCustomObserver(Constants.Notifications.episodeDownloaded, selector: #selector(refreshEpisodesFromNotification))
        addCustomObserver(Constants.Notifications.playbackTrackChanged, selector: #selector(refreshEpisodesFromNotification))
        addCustomObserver(Constants.Notifications.playbackEnded, selector: #selector(refreshEpisodesFromNotification))
        addCustomObserver(Constants.Notifications.playbackFailed, selector: #selector(refreshEpisodesFromNotification))
        addCustomObserver(Constants.Notifications.upNextEpisodeRemoved, selector: #selector(upNextChanged))
        addCustomObserver(Constants.Notifications.upNextEpisodeAdded, selector: #selector(upNextChanged))
        addCustomObserver(Constants.Notifications.upNextQueueChanged, selector: #selector(upNextChanged))
        addCustomObserver(Constants.Notifications.episodeArchiveStatusChanged, selector: #selector(refreshEpisodesFromNotification))
        addCustomObserver(Constants.Notifications.episodeStarredChanged, selector: #selector(refreshEpisodesFromNotification))
        addCustomObserver(Constants.Notifications.episodePlayStatusChanged, selector: #selector(refreshEpisodesFromNotification))
        addCustomObserver(Constants.Notifications.episodeDownloadStatusChanged, selector: #selector(refreshEpisodesFromNotification))
        addCustomObserver(Constants.Notifications.manyEpisodesChanged, selector: #selector(refreshEpisodesFromNotification))
    }

    @objc private func refreshEpisodesFromNotification() {
        refreshEpisodes(animated: true)
    }

    @objc private func upNextChanged() {
        listeningHistoryTable.reloadData()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        removeAllCustomObservers()
    }

    override func handleThemeChanged() {
        listeningHistoryTable.reloadData()
    }

    func refreshEpisodes(animated: Bool) {
        operationQueue.addOperation {
            let query = "lastPlaybackInteractionDate IS NOT NULL AND lastPlaybackInteractionDate > 0 ORDER BY lastPlaybackInteractionDate DESC LIMIT 1000"

            let oldData = self.episodes
            let newData = EpisodeTableHelper.loadSectionedEpisodes(tintColor: AppTheme.appTintColor(), query: query, arguments: nil, episodeShortKey: { episode -> String in
                episode.shortLastPlaybackInteractionDate()
            })

            DispatchQueue.main.sync { [weak self] in
                guard let strongSelf = self else { return }

                strongSelf.listeningHistoryTable.isHidden = (newData.count == 0)
                if animated {
                    let changeSet = StagedChangeset(source: oldData, target: newData)
                    strongSelf.listeningHistoryTable.reload(using: changeSet, with: .none, setData: { data in
                        strongSelf.episodes = data
                    })
                } else {
                    strongSelf.episodes = newData
                    strongSelf.listeningHistoryTable.reloadData()
                }
            }
        }
    }

    @objc func clearTapped() {
        let optionPicker = OptionsPicker(title: "")
        let clearAllAction = OptionAction(label: L10n.historyClearAll, icon: nil, action: {
            DataManager.sharedManager.clearAllEpisodePlayInteractions()
            if SyncManager.isUserLoggedIn() { ServerSettings.setLastClearHistoryDate(Date()) }
            self.refreshEpisodes(animated: true)

        })
        optionPicker.addDescriptiveActions(title: L10n.historyClearAllDetails, message: L10n.historyClearAllDetailsMsg, icon: "option-cleanup", actions: [clearAllAction])
        optionPicker.show(statusBarStyle: preferredStatusBarStyle)
    }

    func setupNavBar() {
        super.customRightBtn = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(menuTapped))
        super.customRightBtn?.accessibilityLabel = L10n.accessibilityMoreActions

        navigationItem.leftBarButtonItem = nil
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc private func menuTapped(_ sender: UIBarButtonItem) {
        let optionsPicker = OptionsPicker(title: nil)

        let clearAction = OptionAction(label: L10n.historyClearAllDetails, icon: "option-cleanup") { [weak self] in
            self?.clearTapped()
        }
        optionsPicker.addAction(action: clearAction)

        optionsPicker.show(statusBarStyle: preferredStatusBarStyle)
    }
}
