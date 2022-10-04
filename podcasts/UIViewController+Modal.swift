import Foundation

extension UIViewController {
    func configureBottomSheetModal() {
        guard let sheet = sheetPresentationController else { return }
        
        sheet.detents = [.medium()]
        sheet.largestUndimmedDetentIdentifier = .medium
        sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
    }
}
