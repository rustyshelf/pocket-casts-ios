import PocketCastsDataModel
import UIKit

extension UploadedViewController: UITableViewDataSource, UITableViewDelegate {
    func registerCells() {
        uploadsTable.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: "EpisodeCell")
    }

    // MARK: TableView Datasource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        uploadedEpisodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeCell
        cell.hidesArtwork = false
        let episode: BaseEpisode = uploadedEpisodes[indexPath.row] as BaseEpisode
        cell.populateFrom(episode: episode, tintColor: ThemeColor.primaryIcon01(), podcastUuid: episode.parentIdentifier())

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let episode = uploadedEpisodes[indexPath.row]
        userEpisodeDetailVC = UserEpisodeDetailViewController(episodeUuid: episode.uuid)
        userEpisodeDetailVC?.delegate = self
        userEpisodeDetailVC?.animateIn()
    }
}
