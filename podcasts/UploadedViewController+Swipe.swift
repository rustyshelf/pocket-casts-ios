import Foundation
import PocketCastsDataModel

extension UploadedViewController: SwipeHandler {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let episode = uploadedEpisodes[safe: indexPath.row] else { return nil }
        
        let actions = SwipeActionsHelper.createLeftActionsForEpisode(episode, tableView: tableView, indexPath: indexPath, swipeHandler: self)
        return actions.swipeActions()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let episode = uploadedEpisodes[safe: indexPath.row] else { return nil }
        
        let actions = SwipeActionsHelper.createRightActionsForEpisode(episode, tableView: tableView, indexPath: indexPath, swipeHandler: self)
        return actions.swipeActions()
    }

    // MARK: - SwipeActionsHandler

    func actionPerformed(willBeRemoved: Bool) {
        reloadLocalFiles()
    }

    func deleteRequested(uuid: String) {
        if let episode = DataManager.sharedManager.findUserEpisode(uuid: uuid) {
            showDeleteConfirmation(userEpisode: episode)
        }
    }

    func archivingRemovesFromList() -> Bool {
        true
    }
}
