import PocketCastsDataModel
import UIKit

class FolderGridCell: UICollectionViewCell {
    @IBOutlet var folderPreview: FolderPreviewView!

    @IBOutlet var unplayedSashView: UnplayedSashOverlayView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func populateFrom(folder: Folder, badgeType: BadgeType, libraryType: LibraryType) {
        folderPreview.populateFrom(folder: folder)

        unplayedSashView.populateFrom(folder: folder, badgeType: badgeType, libraryType: libraryType)
    }
}
