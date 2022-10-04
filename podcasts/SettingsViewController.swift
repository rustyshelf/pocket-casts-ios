import PocketCastsServer
import SwiftUI
import UIKit

class SettingsViewController: PCViewController, UITableViewDataSource, UITableViewDelegate {
    private enum TableRow: String {
        case general, appearance, storageAndDataUse, autoArchive, autoDownload, autoAddToUpNext, customFiles, help, opml, about, pocketCastsPlus

        var display: (text: String, image: UIImage?) {
            switch self {
            case .general:
                return (L10n.settingsGeneral, UIImage(named: "profile-settings"))
            case .appearance:
                return (L10n.settingsAppearance, UIImage(named: "settings_appearance"))
            case .storageAndDataUse:
                return (L10n.settingsStorage, UIImage(named: "settings_storage"))
            case .autoArchive:
                return (L10n.settingsAutoArchive, UIImage(named: "settings_archive"))
            case .autoAddToUpNext:
                return (L10n.settingsAutoAdd, UIImage(named: "playlast"))
            case .autoDownload:
                return (L10n.settingsAutoDownload, UIImage(named: "settings_autodownload"))
            case .help:
                return (L10n.settingsHelp, UIImage(named: "settings_help"))
            case .opml:
                return (L10n.settingsOpml, UIImage(named: "settings_importexport"))
            case .about:
                return (L10n.settingsAbout, UIImage(named: "settings_about"))
            case .customFiles:
                return (L10n.files, UIImage(named: "profile_files"))
            case .pocketCastsPlus:
                return (L10n.pocketCastsPlus, UIImage(named: "plusGold24"))
            }
        }
    }

    private var tableData: [[TableRow]] = []

    private let settingsCellId = "SettingsCell"

    @IBOutlet var settingsTable: UITableView! {
        didSet {
            settingsTable.register(UINib(nibName: "TopLevelSettingsCell", bundle: nil), forCellReuseIdentifier: settingsCellId)
            settingsTable.applyInsetForMiniPlayer()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.settings
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        reloadTable()
    }

    // MARK: - UITableView Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        tableData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: settingsCellId, for: indexPath) as! TopLevelSettingsCell
        cell.plusIndicator.isHidden = true

        let tableRow = tableData[indexPath.section][indexPath.row]
        cell.settingsLabel.text = tableRow.display.text
        cell.settingsLabel.accessibilityIdentifier = tableRow.rawValue
        cell.settingsImage.image = tableRow.display.image

        switch tableRow {
        case .appearance, .customFiles:
            cell.plusIndicator.isHidden = SubscriptionHelper.hasActiveSubscription()
        default:
            break
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let tableRow = tableData[indexPath.section][indexPath.row]
        switch tableRow {
        case .general:
            navigationController?.pushViewController(GeneralSettingsViewController(), animated: true)
        case .appearance:
            navigationController?.pushViewController(AppearanceViewController(), animated: true)
        case .storageAndDataUse:
            navigationController?.pushViewController(StorageAndDataUseViewController(), animated: true)
        case .autoAddToUpNext:
            navigationController?.pushViewController(AutoAddToUpNextViewController(), animated: true)
        case .autoArchive:
            navigationController?.pushViewController(AutoArchiveViewController(), animated: true)
        case .autoDownload:
            navigationController?.pushViewController(DownloadSettingsViewController(), animated: true)
        case .help:
            if let url = URL(string: ServerConstants.Urls.support) {
                UIApplication.shared.open(url)
            }
        case .opml:
            navigationController?.pushViewController(ImportExportViewController(), animated: true)
        case .about:
            let aboutView = AboutView(dismissAction: { [weak self] in
                self?.navigationController?.dismiss(animated: true, completion: nil)
            }).environmentObject(Theme.sharedTheme)
            let hostingController = PCHostingController(rootView: aboutView)

            navigationController?.present(hostingController, animated: true, completion: nil)
        case .customFiles:
            navigationController?.pushViewController(UploadedSettingsViewController(), animated: true)
        case .pocketCastsPlus:
            navigationController?.pushViewController(PlusDetailsViewController(), animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        1
    }

    private func reloadTable() {
        tableData = [[.general, .appearance], [.autoArchive, .autoDownload, .autoAddToUpNext], [.storageAndDataUse, .customFiles], [.help, .opml], [.about]]

        if !SubscriptionHelper.hasActiveSubscription() {
            tableData.insert([.pocketCastsPlus], at: 0)
        }

        settingsTable.reloadData()
    }
}
