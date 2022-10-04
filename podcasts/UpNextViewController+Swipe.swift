import Foundation
import PocketCastsDataModel
import PocketCastsUtils

extension UpNextViewController {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let moveToTopAction = TableSwipeAction(indexPath: indexPath, title: nil, removesFromList: false, backgroundColor: ThemeColor.support04(), icon: UIImage(named: "upnext-movetotop"), tableView: tableView) { [weak self] path in
            guard let self = self, let episode = PlaybackManager.shared.queue.episodeAt(index: path.row) else { return false }

            PlaybackManager.shared.queue.move(episode: episode, to: 0, fireNotification: false)
            self.moveRow(at: indexPath, to: IndexPath(row: 0, section: indexPath.section), in: tableView)
            
            return true
        }

        let moveToBottomAction = TableSwipeAction(indexPath: indexPath, title: nil, removesFromList: false, backgroundColor: ThemeColor.support03(), icon: UIImage(named: "upnext-movetobottom"), tableView: tableView) { [weak self] path in
            guard let self = self, let episode = PlaybackManager.shared.queue.episodeAt(index: indexPath.row) else { return false }

            let queueCount = PlaybackManager.shared.queue.upNextCount()
            PlaybackManager.shared.queue.move(episode: episode, to: queueCount - 1, fireNotification: false)
            self.moveRow(at: indexPath, to: IndexPath(row: queueCount - 1, section: indexPath.section), in: tableView)
            
            return true
        }

        let actions = TableSwipeActions()
        actions.addAction(moveToTopAction)
        actions.addAction(moveToBottomAction)

        return actions.swipeActions()
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = TableSwipeAction(indexPath: indexPath, title: nil, removesFromList: true, backgroundColor: ThemeColor.support05(for: themeOverride), icon: UIImage(named: "episode-removenext"), tableView: tableView) { [weak self] path in
            guard let self = self, let episode = PlaybackManager.shared.queue.episodeAt(index: path.row) else { return false }

            self.changedViaSwipeToRemove = true
            PlaybackManager.shared.removeIfPlayingOrQueued(episode: episode, fireNotification: true, userInitiated: true)
            let remainingEpisodes = PlaybackManager.shared.queue.upNextCount()
            if remainingEpisodes > 0 {
                do {
                    try SJCommonUtils.catchException {
                        tableView.deleteRows(at: [indexPath], with: .automatic)
                    }
                } catch {
                    FileLog.shared.addMessage("Caught Objective-C exception while trying to remove an Up Next row by swiping, reloading table instead")
                    tableView.reloadData()
                }
            } else {
                tableView.reloadData() // if they delete the very last episode, reload the table to get the empty up next cell
            }
            
            return true
        }

        let actions = TableSwipeActions()
        actions.addAction(deleteAction)

        return actions.swipeActions()
    }

    private func moveRow(at: IndexPath, to: IndexPath, in tableView: UITableView) {
        do {
            try SJCommonUtils.catchException {
                tableView.moveRow(at: at, to: to)
            }
        } catch {
            FileLog.shared.addMessage("Caught Objective-C exception while trying to move an Up Next row, reloading table instead")
            tableView.reloadData()
        }
    }
}
