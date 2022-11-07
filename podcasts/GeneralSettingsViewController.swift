import PocketCastsDataModel
import PocketCastsServer
import UIKit

class GeneralSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let timeStepperCellId = "TimeStepperCell"
    private let switchCellId = "SwitchCell"
    private let disclosureCellId = "DisclosureCell"

    let debounce = Debounce(delay: Constants.defaultDebounceTime)

    private enum TableRow { case skipForward, skipBack, intelligentPlaybackResumption, defaultAddToUpNextSwipe, defaultGrouping, openLinksInBrowser, publishChapterTitles }
    private let tableData: [[TableRow]] = [[.defaultGrouping, .defaultAddToUpNextSwipe, .openLinksInBrowser], [.skipForward, .skipBack, .intelligentPlaybackResumption], [.publishChapterTitles]]

    @IBOutlet var settingsTable: UITableView! {
        didSet {
            settingsTable.register(UINib(nibName: "TimeStepperCell", bundle: nil), forCellReuseIdentifier: timeStepperCellId)
            settingsTable.register(UINib(nibName: "SwitchCell", bundle: nil), forCellReuseIdentifier: switchCellId)
            settingsTable.register(UINib(nibName: "DisclosureCell", bundle: nil), forCellReuseIdentifier: disclosureCellId)
            settingsTable.applyInsetForMiniPlayer()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = L10n.settingsGeneral
    }

    // MARK: - UITableView Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        tableData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableData[indexPath.section][indexPath.row]
        switch row {
        case .skipForward:
            let cell = tableView.dequeueReusableCell(withIdentifier: timeStepperCellId, for: indexPath) as! TimeStepperCell
            cell.cellLabel.text = L10n.skipForward
            let jumpFwdAmount = ServerSettings.skipForwardTime()
            cell.cellSecondaryLabel.text = L10n.timeShorthand(jumpFwdAmount)
            cell.timeStepper.currentValue = TimeInterval(jumpFwdAmount)
            cell.timeStepper.tintColor = ThemeColor.primaryInteractive01()
            cell.timeStepper.bigIncrements = 5.seconds
            cell.timeStepper.smallIncrements = 5.seconds
            cell.timeStepper.minimumValue = 0
            cell.timeStepper.maximumValue = 40.minutes

            cell.onValueChanged = { value in
                let newValue = Int(value)
                ServerSettings.setSkipForwardTime(newValue)
                cell.cellSecondaryLabel.text = L10n.timeShorthand(newValue)

                NotificationCenter.postOnMainThread(notification: Constants.Notifications.skipTimesChanged)
            }

            return cell
        case .skipBack:
            let cell = tableView.dequeueReusableCell(withIdentifier: timeStepperCellId, for: indexPath) as! TimeStepperCell
            cell.cellLabel.text = L10n.skipBack
            let skipBackAmount = ServerSettings.skipBackTime()
            cell.cellSecondaryLabel.text = L10n.timeShorthand(skipBackAmount)
            cell.timeStepper.currentValue = TimeInterval(skipBackAmount)
            cell.timeStepper.tintColor = ThemeColor.primaryInteractive01()
            cell.timeStepper.bigIncrements = 5.seconds
            cell.timeStepper.smallIncrements = 5.seconds
            cell.timeStepper.minimumValue = 0
            cell.timeStepper.maximumValue = 40.minutes

            cell.onValueChanged = { value in
                let newValue = Int(value)
                ServerSettings.setSkipBackTime(newValue)
                cell.cellSecondaryLabel.text = L10n.timeShorthand(newValue)

                NotificationCenter.postOnMainThread(notification: Constants.Notifications.skipTimesChanged)
            }

            return cell
        case .openLinksInBrowser:
            let cell = tableView.dequeueReusableCell(withIdentifier: switchCellId, for: indexPath) as! SwitchCell

            cell.cellLabel.text = L10n.settingsGeneralOpenInBrowser
            cell.cellSwitch.isOn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.openLinksInExternalBrowser)

            cell.cellSwitch.removeTarget(self, action: nil, for: UIControl.Event.valueChanged)
            cell.cellSwitch.addTarget(self, action: #selector(openLinksInBrowserToggled(_:)), for: UIControl.Event.valueChanged)

            return cell

        case .intelligentPlaybackResumption:
            let cell = tableView.dequeueReusableCell(withIdentifier: switchCellId, for: indexPath) as! SwitchCell

            cell.cellLabel.text = L10n.settingsGeneralSmartPlayback
            cell.cellSwitch.isOn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.intelligentPlaybackResumption)

            cell.cellSwitch.removeTarget(self, action: nil, for: UIControl.Event.valueChanged)
            cell.cellSwitch.addTarget(self, action: #selector(intelligentPlaybackResumptionToggled(_:)), for: UIControl.Event.valueChanged)

            return cell
        case .defaultAddToUpNextSwipe:
            let cell = tableView.dequeueReusableCell(withIdentifier: disclosureCellId, for: indexPath) as! DisclosureCell
            cell.cellLabel.text = L10n.settingsGeneralUpNextSwipe
            cell.cellSecondaryLabel.text = Settings.primaryUpNextSwipeAction() == .playNext ? L10n.playNext : L10n.playLast

            return cell
        case .defaultGrouping:
            let cell = tableView.dequeueReusableCell(withIdentifier: disclosureCellId, for: indexPath) as! DisclosureCell
            cell.cellLabel.text = L10n.settingsGeneralEpisodeGroups

            // this label is quite wide at smaller than 370pt it won't fit, so don't show the value until they tap it
            if tableView.bounds.width > 370 {
                let grouping = Settings.defaultPodcastGrouping()
                cell.cellSecondaryLabel.text = grouping.description
            } else {
                cell.cellSecondaryLabel.text = nil
            }

            return cell
        case .publishChapterTitles:
            let cell = tableView.dequeueReusableCell(withIdentifier: switchCellId, for: indexPath) as! SwitchCell

            cell.cellLabel.text = L10n.settingsGeneralPublishChapterTitles
            cell.cellSwitch.isOn = Settings.publishChapterTitlesEnabled()

            cell.cellSwitch.removeTarget(self, action: nil, for: UIControl.Event.valueChanged)
            cell.cellSwitch.addTarget(self, action: #selector(publishChapterTitlesToggled(_:)), for: UIControl.Event.valueChanged)

            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let row = tableData[indexPath.section][indexPath.row]
        if row == .defaultGrouping {
            let currentGrouping = Settings.defaultPodcastGrouping()

            let options = OptionsPicker(title: L10n.settingsGeneralEpisodeGroups)
            let noneAction = OptionAction(label: L10n.none, selected: currentGrouping == .none) { [weak self] in
                Settings.setDefaultPodcastGrouping(.none)

                tableView.reloadData()
                self?.promptToApplyGroupingToAll(grouping: Settings.defaultPodcastGrouping())
            }
            options.addAction(action: noneAction)

            let downloadedAction = OptionAction(label: L10n.statusDownloaded, selected: currentGrouping == .downloaded) { [weak self] in
                Settings.setDefaultPodcastGrouping(.downloaded)

                tableView.reloadData()
                self?.promptToApplyGroupingToAll(grouping: Settings.defaultPodcastGrouping())
            }
            options.addAction(action: downloadedAction)

            let unplayedAction = OptionAction(label: L10n.statusUnplayed, selected: currentGrouping == .unplayed) { [weak self] in
                Settings.setDefaultPodcastGrouping(.unplayed)

                tableView.reloadData()
                self?.promptToApplyGroupingToAll(grouping: Settings.defaultPodcastGrouping())
            }
            options.addAction(action: unplayedAction)

            let seasonAction = OptionAction(label: L10n.season, selected: currentGrouping == .season) { [weak self] in
                Settings.setDefaultPodcastGrouping(.season)

                tableView.reloadData()
                self?.promptToApplyGroupingToAll(grouping: Settings.defaultPodcastGrouping())
            }
            options.addAction(action: seasonAction)

            let starredAction = OptionAction(label: L10n.statusStarred, selected: currentGrouping == .starred) { [weak self] in
                Settings.setDefaultPodcastGrouping(.starred)

                tableView.reloadData()
                self?.promptToApplyGroupingToAll(grouping: Settings.defaultPodcastGrouping())
            }
            options.addAction(action: starredAction)

            options.show(statusBarStyle: preferredStatusBarStyle)
        } else if row == .defaultAddToUpNextSwipe {
            let currentAction = Settings.primaryUpNextSwipeAction()

            let options = OptionsPicker(title: L10n.settingsGeneralUpNextSwipe)
            let playNextAction = OptionAction(label: L10n.playNext, selected: currentAction == .playNext) {
                Settings.setPrimaryUpNextSwipeAction(.playNext)
                tableView.reloadData()
            }
            options.addAction(action: playNextAction)

            let playLastAction = OptionAction(label: L10n.playLast, selected: currentAction == .playLast) {
                Settings.setPrimaryUpNextSwipeAction(.playLast)
                tableView.reloadData()
            }
            options.addAction(action: playLastAction)
            options.show(statusBarStyle: preferredStatusBarStyle)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerFrame = CGRect(x: 0, y: 0, width: 0, height: Constants.Values.tableSectionHeaderHeight)
        if section == 0 {
            return SettingsTableHeader(frame: headerFrame, title: L10n.settingsGeneralDefaultsHeader)
        } else if section == 1 {
            return SettingsTableHeader(frame: headerFrame, title: L10n.settingsGeneralPlayerHeader)
        }

        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.Values.tableSectionHeaderHeight
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 1 {
            return L10n.settingsGeneralSmartPlaybackSubtitle
        } else if section == 2 {
            return L10n.settingsGeneralPublishChapterTitlesSubtitle
        }

        return nil
    }

    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        ThemeableTable.setHeaderFooterTextColor(on: view)
    }

    private func promptToApplyGroupingToAll(grouping: PodcastGrouping) {
        let groupingPrompt = OptionsPicker(title: nil)

        let applyToAllAction = OptionAction(label: L10n.settingsGeneralApplyAllConf, icon: nil) {
            DataManager.sharedManager.updateAllPodcastGrouping(to: grouping)
        }
        let noAction = OptionAction(label: L10n.settingsGeneralNoThanks, icon: nil) {
            // no need to do anything
        }
        noAction.outline = true

        let groupingMessage = grouping == .none ? L10n.settingsGeneralRemoveGroupsApplyAll : L10n.settingsGeneralSelectedGroupApplyAll(grouping.description.localizedLowercase)
        groupingPrompt.addDescriptiveActions(title: L10n.settingsGeneralApplyAllTitle, message: groupingMessage, icon: "option-podcasts", actions: [applyToAllAction, noAction])

        groupingPrompt.show(statusBarStyle: preferredStatusBarStyle)
    }

    private func promptToApplyShowArchiveToAll(_ showArchived: Bool) {
        let groupingPrompt = OptionsPicker(title: nil)

        let applyToAllAction = OptionAction(label: L10n.settingsGeneralApplyAllConf, icon: nil) {
            DataManager.sharedManager.updateAllShowArchived(to: showArchived)
        }
        let noAction = OptionAction(label: L10n.settingsGeneralNoThanks, icon: nil) {
            // no need to do anything
        }
        noAction.outline = true

        let groupingMessage = L10n.settingsGeneralArchivedEpisodesPromptFormat((showArchived ? L10n.settingsGeneralShow : L10n.settingsGeneralHide).localizedLowercase)
        groupingPrompt.addDescriptiveActions(title: L10n.settingsGeneralApplyAllTitle, message: groupingMessage, icon: "option-podcasts", actions: [applyToAllAction, noAction])

        groupingPrompt.show(statusBarStyle: preferredStatusBarStyle)
    }

    @objc private func openLinksInBrowserToggled(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: Constants.UserDefaults.openLinksInExternalBrowser)
    }

    @objc private func intelligentPlaybackResumptionToggled(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: Constants.UserDefaults.intelligentPlaybackResumption)
    }

    @objc private func publishChapterTitlesToggled(_ sender: UISwitch) {
        Settings.setPublishChapterTitlesEnabled(sender.isOn)

        PlaybackManager.shared.playerDidChangeNowPlayingInfo()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        AppTheme.defaultStatusBarStyle()
    }
}
