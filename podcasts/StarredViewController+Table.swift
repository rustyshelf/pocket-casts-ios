import Foundation

extension StarredViewController: UITableViewDataSource, UITableViewDelegate {
    private static let episodeCellId = "EpisodeCellID"

    func registerCells() {
        starredTable.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: StarredViewController.episodeCellId)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StarredViewController.episodeCellId, for: indexPath) as! EpisodeCell
        guard let episode = episodes[safe: indexPath.row]?.episode else { return cell }

        cell.populateFrom(episode: episode, tintColor: nil)

        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeights[indexPath] = cell.frame.size.height
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let episode = episodes[safe: indexPath.row]?.episode, let parentPodcast = episode.parentPodcast() else { return }

        tableView.deselectRow(at: indexPath, animated: true)

        let episodeController = EpisodeDetailViewController(episodeUuid: episode.uuid, podcast: parentPodcast)
        episodeController.modalPresentationStyle = .formSheet
        present(episodeController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeights[indexPath] ?? 80
    }
}
