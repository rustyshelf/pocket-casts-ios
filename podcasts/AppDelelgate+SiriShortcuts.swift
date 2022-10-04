import Foundation
import JLRoutes
import PocketCastsDataModel
import PocketCastsUtils

extension AppDelegate {
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        handleContinue(userActivity)

        return true
    }

    func handleContinue(_ userActivity: NSUserActivity) {
        if userActivity.activityType == "net.rustyshelf.podcasts" {
            let info = userActivity.userInfo
            if let urlString = info?["url"] as? String, let url = URL(string: urlString) {
                JLRoutes.routeURL(url)
            }
        } else if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            guard let incomingURL = userActivity.webpageURL, let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true), let path = components.path, let controller = SceneHelper.rootViewController(), path != "/get" else { return }

            FileLog.shared.addMessage("Opening universal link, path: \(path)")
            openSharePath("social/share/show\(path)", controller: controller, onErrorOpen: incomingURL)
        }
    }

    /// This method is called when a user activity is continued via the restoration handler
    /// in `UIApplicationDelegate application(_:continue:restorationHandler:)`
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        super.restoreUserActivityState(activity)
    }
}
