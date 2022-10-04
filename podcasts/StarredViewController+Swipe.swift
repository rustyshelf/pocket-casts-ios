import Foundation

extension StarredViewController: SwipeHandler {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let episode = episodes[safe: indexPath.row]?.episode else { return nil }
        
        let actions = SwipeActionsHelper.createLeftActionsForEpisode(episode, tableView: tableView, indexPath: indexPath, swipeHandler: self)
        return actions.swipeActions()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let episode = episodes[safe: indexPath.row]?.episode else { return nil }
        
        let actions = SwipeActionsHelper.createRightActionsForEpisode(episode, tableView: tableView, indexPath: indexPath, swipeHandler: self)
        return actions.swipeActions()
    }

    // MARK: - Swipe Handler

    func archivingRemovesFromList() -> Bool {
        false
    }

    func actionPerformed(willBeRemoved: Bool) {
        refreshEpisodesFromDatabase(animated: true)
    }

    func deleteRequested(uuid: String) {} // we don't support this one
}
