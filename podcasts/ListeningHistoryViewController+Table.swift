import PocketCastsDataModel
import PocketCastsUtils
import UIKit

extension ListeningHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    private static let episodeCellId = "EpisodeCellID"

    func registerCells() {
        listeningHistoryTable.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: ListeningHistoryViewController.episodeCellId)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        episodes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes[section].elements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListeningHistoryViewController.episodeCellId, for: indexPath) as! EpisodeCell

        if let episode = episodes[safe: indexPath.section]?.elements[safe: indexPath.row]?.episode {
            cell.populateFrom(episode: episode, tintColor: nil)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let episode = episodes[safe: indexPath.section]?.elements[safe: indexPath.row]?.episode else { return }

        tableView.deselectRow(at: indexPath, animated: true)

        if episode.downloadFailed() {
            let optionsPicker = OptionsPicker(title: nil)
            let retryAction = OptionAction(label: L10n.retry, icon: nil, action: {
                NetworkUtils.shared.downloadEpisodeRequested(autoDownloadStatus: .notSpecified, { later in
                    if later {
                        DownloadManager.shared.queueForLaterDownload(episodeUuid: episode.uuid, fireNotification: true, autoDownloadStatus: .notSpecified)
                    } else {
                        DownloadManager.shared.addToQueue(episodeUuid: episode.uuid)
                    }
                }, disallowed: nil)
            })
            optionsPicker.addDescriptiveActions(title: L10n.downloadFailed, message: episode.readableErrorMessage(), icon: "option-alert", actions: [retryAction])
            optionsPicker.show(statusBarStyle: preferredStatusBarStyle)
        } else if let parentPodcast = episode.parentPodcast() {
            let episodeController = EpisodeDetailViewController(episodeUuid: episode.uuid, podcast: parentPodcast)
            episodeController.modalPresentationStyle = .formSheet
            present(episodeController, animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = DateHeadingView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 45))
        sectionHeader.title = titleTextForSection(section)

        return sectionHeader
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeights[indexPath] = cell.frame.size.height
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeights[indexPath] ?? 80
    }

    private func titleTextForSection(_ section: Int) -> String {
        if section >= episodes.count { return "" } // we don't have that many sections

        return episodes[section].model
    }
}
