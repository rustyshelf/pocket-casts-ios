import Foundation

extension PodcastViewController: SwipeHandler {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == PodcastViewController.allEpisodesSection, let episode = episodeAtIndexPath(indexPath) else { return nil }
        
        let actions = SwipeActionsHelper.createRightActionsForEpisode(episode, tableView: tableView, indexPath: indexPath, swipeHandler: self)
        return actions.swipeActions()
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.section == PodcastViewController.allEpisodesSection, let episode = episodeAtIndexPath(indexPath) else { return nil }
        
        let actions = SwipeActionsHelper.createLeftActionsForEpisode(episode, tableView: tableView, indexPath: indexPath, swipeHandler: self)
        return actions.swipeActions()
    }

    // MARK: - SwipeActionsHandler

    func archivingRemovesFromList() -> Bool {
        !(podcast?.showArchived ?? false)
    }

    func actionPerformed(willBeRemoved: Bool) {
        guard let podcast = podcast else { return }

        loadLocalEpisodes(podcast: podcast, animated: true)
    }

    func deleteRequested(uuid: String) {} // we don't support this one
}
