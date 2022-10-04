import DifferenceKit
import PocketCastsDataModel
import PocketCastsServer
import UIKit

class StarredViewController: PCViewController {
    @IBOutlet var starredTable: UITableView! {
        didSet {
            starredTable.applyInsetForMiniPlayer()
            registerCells()
            starredTable.estimatedRowHeight = 80
            starredTable.rowHeight = UITableView.automaticDimension
            starredTable.allowsMultipleSelectionDuringEditing = true
        }
    }

    @IBOutlet var noEpisodesIcon: UIImageView! {
        didSet {
            noEpisodesIcon.tintColor = ThemeColor.primaryIcon02()
        }
    }

    @IBOutlet var noEpisodesTitle: ThemeableLabel! {
        didSet {
            noEpisodesTitle.text = L10n.profileStarredNoEpisodesTitle
        }
    }

    @IBOutlet var noEpisodesDescription: ThemeableLabel! {
        didSet {
            noEpisodesDescription.style = .primaryText02
            noEpisodesDescription.text = L10n.profileStarredNoEpisodesDesc
        }
    }

    @IBOutlet var loadingIndicator: UIActivityIndicatorView!

    var episodes = [ListEpisode]()
    private let refreshQueue = OperationQueue()
    var cellHeights: [IndexPath: CGFloat] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshQueue.maxConcurrentOperationCount = 1
        title = L10n.statusStarred
        setupNavBar()
        refreshEpisodesFromServer(animated: false)
        addEventObservers()
    }

    func refreshEpisodesFromServer(animated: Bool) {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        refreshQueue.addOperation {
            ApiServerHandler.shared.retrieveStarred { episodes in
                guard let episodes = episodes else {
                    DispatchQueue.main.sync {
                        self.loadingIndicator.stopAnimating()
                    }

                    return
                }

                let oldData = self.episodes
                var newData = [ListEpisode]()
                for episode in episodes {
                    newData.append(ListEpisode(episode: episode, tintColor: AppTheme.appTintColor(), isInUpNext: PlaybackManager.shared.inUpNext(episode: episode)))
                }

                DispatchQueue.main.sync { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.loadingIndicator.stopAnimating()
                    strongSelf.starredTable.isHidden = (newData.count == 0)
                    if animated {
                        let changeSet = StagedChangeset(source: oldData, target: newData)
                        strongSelf.starredTable.reload(using: changeSet, with: .none, setData: { data in
                            strongSelf.episodes = data
                        })
                    } else {
                        strongSelf.episodes = newData
                        strongSelf.starredTable.reloadData()
                    }
                }
            }
        }
    }

    func refreshEpisodesFromDatabase(animated: Bool) {
        refreshQueue.addOperation {
            let query = "keepEpisode = 1 ORDER BY starredModified DESC LIMIT 1000"
            let oldData = self.episodes
            let newData = EpisodeTableHelper.loadEpisodes(tintColor: AppTheme.appTintColor(), query: query, arguments: nil)

            DispatchQueue.main.sync { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.starredTable.isHidden = (newData.count == 0)
                if animated {
                    let changeSet = StagedChangeset(source: oldData, target: newData)
                    strongSelf.starredTable.reload(using: changeSet, with: .none, setData: { data in
                        strongSelf.episodes = data
                    })
                } else {
                    strongSelf.episodes = newData
                    strongSelf.starredTable.reloadData()
                }
            }
        }
    }

    private func addEventObservers() {
        addCustomObserver(Constants.Notifications.episodeStarredChanged, selector: #selector(refreshEpisodesFromNotification(notification:)))
        addCustomObserver(Constants.Notifications.episodeDownloaded, selector: #selector(refreshEpisodesFromNotification(notification:)))
        addCustomObserver(Constants.Notifications.episodeDownloadStatusChanged, selector: #selector(refreshEpisodesFromNotification(notification:)))
        addCustomObserver(Constants.Notifications.episodeArchiveStatusChanged, selector: #selector(refreshEpisodesFromNotification(notification:)))
        addCustomObserver(Constants.Notifications.episodePlayStatusChanged, selector: #selector(refreshEpisodesFromNotification(notification:)))
        addCustomObserver(Constants.Notifications.manyEpisodesChanged, selector: #selector(refreshEpisodesFromNotification(notification:)))
        addCustomObserver(Constants.Notifications.upNextEpisodeRemoved, selector: #selector(refreshEpisodesFromNotification(notification:)))
        addCustomObserver(Constants.Notifications.upNextEpisodeAdded, selector: #selector(refreshEpisodesFromNotification(notification:)))
        addCustomObserver(Constants.Notifications.upNextQueueChanged, selector: #selector(refreshEpisodesFromNotification(notification:)))
    }

    @objc private func refreshEpisodesFromNotification(notification: Notification) {
        refreshEpisodesFromDatabase(animated: true)
    }

    deinit {
        removeAllCustomObservers()
    }

    func setupNavBar() {
        navigationItem.leftBarButtonItem = nil
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
