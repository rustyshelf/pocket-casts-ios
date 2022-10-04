import PocketCastsDataModel
import UIKit

extension PodcastViewController: UITableViewDataSource, UITableViewDelegate {
    private static let episodeCellId = "EpisodeCell"
    private static let headerCellId = "HeaderCell"
    private static let limitCellId = "LimitCell"
    private static let noSearchResultsCell = "NoSearchResults"
    private static let allArchivedCellId = "AllArchivedCell"
    private static let groupHeadingCellId = "GroupHeading"

    func registerCells() {
        episodesTable.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: PodcastViewController.episodeCellId)
        episodesTable.register(UINib(nibName: "PodcastHeadingTableCell", bundle: nil), forCellReuseIdentifier: PodcastViewController.headerCellId)
        episodesTable.register(UINib(nibName: "EpisodeLimitCell", bundle: nil), forCellReuseIdentifier: PodcastViewController.limitCellId)
        episodesTable.register(UINib(nibName: "AllArchivedCell", bundle: nil), forCellReuseIdentifier: PodcastViewController.allArchivedCellId)
        episodesTable.register(UINib(nibName: "HeadingCell", bundle: nil), forCellReuseIdentifier: PodcastViewController.groupHeadingCellId)
        episodesTable.register(UINib(nibName: "NoSearchResultsCell", bundle: nil), forCellReuseIdentifier: PodcastViewController.noSearchResultsCell)
    }

    // MARK: - Table Data

    func numberOfSections(in tableView: UITableView) -> Int {
        loadingPodcastInfo ? 0 : 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if loadingPodcastInfo { return 0 }

        return episodeInfo[safe: section]?.elements.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == PodcastViewController.headerSection {
            let cell = tableView.dequeueReusableCell(withIdentifier: PodcastViewController.headerCellId, for: indexPath) as! PodcastHeadingTableCell
            cell.populateFrom(tintColor: podcast?.iconTintColor(), delegate: self)
            cell.buttonsEnabled = true
            return cell
        }

        let itemAtRow = episodeInfo[indexPath.section].elements[indexPath.row]
        if let listEpisode = itemAtRow as? ListEpisode {
            let cell = tableView.dequeueReusableCell(withIdentifier: PodcastViewController.episodeCellId, for: indexPath) as! EpisodeCell
            cell.hidesArtwork = true
            cell.populateFrom(episode: listEpisode.episode, tintColor: podcast?.iconTintColor(), podcastUuid: podcast?.uuid, listUuid: listUuid)

            return cell
        } else if let limitPlaceholder = itemAtRow as? EpisodeLimitPlaceholder {
            let cell = tableView.dequeueReusableCell(withIdentifier: PodcastViewController.limitCellId, for: indexPath) as! EpisodeLimitCell
            cell.limitMessage.text = limitPlaceholder.message
            return cell
        } else if itemAtRow is NoSearchResultsPlaceholder {
            let cell = tableView.dequeueReusableCell(withIdentifier: PodcastViewController.noSearchResultsCell, for: indexPath) as! NoSearchResultsCell
            return cell
        } else if let archivedPlaceholder = itemAtRow as? AllArchivedPlaceholder {
            let cell = tableView.dequeueReusableCell(withIdentifier: PodcastViewController.allArchivedCellId, for: indexPath) as! AllArchivedCell
            cell.episodesArchivedLabel.text = archivedPlaceholder.message
            return cell
        } else if let heading = itemAtRow as? ListHeader {
            let cell = tableView.dequeueReusableCell(withIdentifier: PodcastViewController.groupHeadingCellId, for: indexPath) as! HeadingCell
            cell.heading.text = heading.headerTitle
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PodcastViewController.limitCellId, for: indexPath) as! EpisodeLimitCell
            return cell
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeights[indexPath] = cell.frame.size.height
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeights[indexPath] ?? 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.section == PodcastViewController.headerSection {
            if let cell = tableView.cellForRow(at: indexPath) as? PodcastHeadingTableCell {
                cell.toggleExpanded(delegate: self)
            }
        } else if indexPath.section == PodcastViewController.allEpisodesSection {
            guard let podcast = podcast, let episode = episodeAtIndexPath(indexPath) else { return }

            let episodeController = EpisodeDetailViewController(episode: episode, podcast: podcast)
            episodeController.modalPresentationStyle = .formSheet
            present(episodeController, animated: true, completion: nil)
        }
    }

    // MARK: - Table Config

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        PodcastViewController.allEpisodesSection == section ? UITableView.automaticDimension : CGFloat.leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        PodcastViewController.allEpisodesSection == section ? 100 : CGFloat.leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        CGFloat.leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        PodcastViewController.allEpisodesSection == section ? searchController?.view : nil
    }

    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let castView = view as? UITableViewHeaderFooterView {
            castView.backgroundView?.backgroundColor = UIColor.clear
            castView.contentView.backgroundColor = UIColor.clear
        }
    }

    // MARK: - Swipe Actions

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        indexPath.section == PodcastViewController.allEpisodesSection && episodeAtIndexPath(indexPath) != nil
    }

    func episodeAtIndexPath(_ indexPath: IndexPath) -> Episode? {
        guard let listEpisode = episodeInfo[indexPath.section].elements[indexPath.row] as? ListEpisode else { return nil }

        return listEpisode.episode
    }
}
