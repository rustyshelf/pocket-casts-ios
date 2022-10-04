import UIKit

extension PlaylistViewController: UITableViewDelegate, UITableViewDataSource {
    private static let cellIdentifier = "EpisodeCell"

    func registerCells() {
        tableView.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: PlaylistViewController.cellIdentifier)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistViewController.cellIdentifier, for: indexPath) as! EpisodeCell

        if let listEpisode = episodes[safe: indexPath.row] {
            cell.populateFrom(episode: listEpisode.episode, tintColor: filter.playlistColor(), filterUuid: filter.uuid)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeights[indexPath] = cell.frame.size.height
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeights[indexPath] ?? 80
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedEpisode = episodes[safe: indexPath.row]?.episode, let parentPodcast = selectedEpisode.parentPodcast() else { return }

        tableView.deselectRow(at: indexPath, animated: true)

        let episodeController = EpisodeDetailViewController(episode: selectedEpisode, podcast: parentPodcast)
        episodeController.modalPresentationStyle = .formSheet
        present(episodeController, animated: true, completion: nil)
    }
}
