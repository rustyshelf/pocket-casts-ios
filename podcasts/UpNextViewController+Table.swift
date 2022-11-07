import PocketCastsDataModel
import PocketCastsUtils

extension UpNextViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - TableView DataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        tableData().count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = tableData()[section]
        switch section {
        case .nowPlayingSection:
            return 1
        case .upNextSection:
            return max(1, PlaybackManager.shared.queue.upNextCount())
        }
    }

    // MARK: - Section Headers

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard tableData()[section] == .upNextSection, tableData().count > 1 else { return nil }
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 48))

        updateTimeRemainingLabel()
        headerView.addSubview(remainingLabel)
        remainingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            remainingLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            remainingLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        headerView.addSubview(clearQueueButton)
        clearQueueButton.translatesAutoresizingMaskIntoConstraints = false
        clearQueueButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        NSLayoutConstraint.activate([
            clearQueueButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            clearQueueButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            clearQueueButton.leadingAnchor.constraint(greaterThanOrEqualTo: remainingLabel.trailingAnchor, constant: 10)
        ])

        clearQueueButton.isEnabled = PlaybackManager.shared.queue.upNextCount() > 0
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = tableData()[section]
        switch section {
        case .nowPlayingSection:
            return 16
        case .upNextSection:
            return 48
        }
    }

    // MARK: - Cell Population

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = tableData()[indexPath.section]
        if section == .nowPlayingSection {
            let nowPlayingCell = tableView.dequeueReusableCell(withIdentifier: UpNextViewController.nowPlayingCell, for: indexPath) as! UpNextNowPlayingCell
            nowPlayingCell.themeOverride = themeOverride
            if let episode = PlaybackManager.shared.currentEpisode() {
                nowPlayingCell.populateFrom(episode: episode)
            }
            return nowPlayingCell
        }

        if PlaybackManager.shared.queue.upNextCount() == 0 {
            let nothingCell = tableView.dequeueReusableCell(withIdentifier: UpNextViewController.noUpNextCell, for: indexPath) as! NothingUpNextCell
            nothingCell.themeOverride = themeOverride
            return nothingCell
        }

        let playerCell = tableView.dequeueReusableCell(withIdentifier: UpNextViewController.playerCell, for: indexPath) as! PlayerCell
        playerCell.themeOverride = themeOverride

        if let episode = PlaybackManager.shared.queue.episodeAt(index: indexPath.row) {
            playerCell.populateFrom(episode: episode)
        }
        return playerCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = tableData()[indexPath.section]

        if section == .nowPlayingSection {
            dismiss(animated: true, completion: {
                if let miniPlayer = UIApplication.shared.appDelegate()?.miniPlayer(), miniPlayer.playerOpenState == .closed {
                    UIApplication.shared.appDelegate()?.miniPlayer()?.openFullScreenPlayer()
                }
            })

            return
        }

        guard let episode = PlaybackManager.shared.queue.episodeAt(index: indexPath.row) else { return }

        showEpisodeDetailViewController(for: episode)
    }

    // MARK: - Rearrange

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        let section = tableData()[indexPath.section]
        if section == .nowPlayingSection {
            return false
        } else if section == .upNextSection, PlaybackManager.shared.queue.upNextCount() == 0 {
            return false
        }
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath == destinationIndexPath { return }

        let playQueue = PlaybackManager.shared.queue

        playQueue.moveEpisode(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        let toSection = tableData()[proposedDestinationIndexPath.section]

        if toSection == .upNextSection { return proposedDestinationIndexPath }

        return IndexPath(row: 0, section: sourceIndexPath.section)
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }

    // MARK: - Swipe Actions

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        tableData()[indexPath.section] == .upNextSection
    }

    // MARK: - Cell Heights

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rowHeightAt(indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        rowHeightAt(indexPath: indexPath)
    }

    func rowHeightAt(indexPath: IndexPath) -> CGFloat {
        let section = tableData()[indexPath.section]
        if section == .nowPlayingSection { return UpNextViewController.nowPlayingRowHeight }

        return PlaybackManager.shared.queue.upNextCount() > 0 ? UpNextViewController.upNextRowHeight : UpNextViewController.noUpNextRowHeight
    }

    // MARK: - Helper Functions

    func tableData() -> [sections] {
        var sections: [sections] = [.upNextSection]

        if let _ = PlaybackManager.shared.currentEpisode() {
            sections.insert(.nowPlayingSection, at: 0)
        }
        return sections
    }

    @objc func reloadTable() {
        upNextTable.reloadData()
    }

    @objc func upNextChanged() {
        if changedViaSwipeToRemove { return }

        // this method is sometimes called during a re-arrange animation. For whatever weird reason doing this as part of that operation causes the table to flash.
        // This is only when the Lottie animation in the the now playing cell is running, so before removing this call, test that case
        DispatchQueue.main.async {
            self.upNextTable.reloadData()
        }
    }

    @objc func appDidBecomeActive() {
        // there's a weird issue with the drag handle tints dissapearing on the app coming back from being backgrounded, so reload the table in that case
        upNextTable.reloadData()
    }
}
