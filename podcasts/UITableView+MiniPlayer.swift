import Foundation

extension UITableView {
    func applyInsetForMiniPlayer(additionalBottomInset: CGFloat = 0) {
        let existingInset = contentInset
        contentInset = UIEdgeInsets(top: existingInset.top, left: existingInset.left, bottom: existingInset.bottom + Constants.Values.miniPlayerOffset + additionalBottomInset, right: existingInset.right)
    }

    func updateContentInset() {
        let miniPlayerOffset: CGFloat = PlaybackManager.shared.currentEpisode() == nil ? 0 : Constants.Values.miniPlayerOffset
        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: miniPlayerOffset, right: 0)
    }
}
