import UIKit

public class SubscriptionHelper: NSObject {
    public class func hasActiveSubscription() -> Bool {
        return true
    }

    public class func hasRenewingSubscription() -> Bool {
        return false
    }

    public class func subscriptionGiftDays() -> Int {
        return 4000
    }

    public class func subscriptionPlatform() -> SubscriptionPlatform {
        return .iOS
    }

    public class func subscriptionRenewalDate() -> Date? {
        return Date.init(timeIntervalSinceNow: 3650.days)
    }

    public class func timeToSubscriptionExpiry() -> TimeInterval? {
        return 3650.days
    }

    public class func hasLifetimeGift() -> Bool {
        return true
    }

    public class func subscriptionFrequencyValue() -> SubscriptionFrequency {
        let intValue = UserDefaults.standard.integer(forKey: ServerConstants.UserDefaults.subscriptionFrequency)

        return SubscriptionFrequency(rawValue: intValue) ?? .none
    }

    // MARK: - Set Subscription status

    public class func setSubscriptionPaid(_ value: Int) {
        UserDefaults.standard.set(value, forKey: ServerConstants.UserDefaults.subscriptionPaid)
    }

    public class func setSubscriptionPlatform(_ value: Int) {
        UserDefaults.standard.set(value, forKey: ServerConstants.UserDefaults.subscriptionPlatform)
    }

    public class func setSubscriptionAutoRenewing(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: ServerConstants.UserDefaults.subscriptionAutoRenewing)
    }

    public class func setSubscriptionExpiryDate(_ value: TimeInterval) {
        UserDefaults.standard.set(value, forKey: ServerConstants.UserDefaults.subscriptionExpiryDate)
    }

    public class func setSubscriptionGiftDays(_ value: Int) {
        UserDefaults.standard.set(value, forKey: ServerConstants.UserDefaults.subscriptionGiftDays)
    }

    public class func setSubscriptionFrequency(_ value: Int) {
        UserDefaults.standard.set(value, forKey: ServerConstants.UserDefaults.subscriptionFrequency)
    }

    public class func setSubscriptionGiftAcknowledgement(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: ServerConstants.UserDefaults.subscriptionGiftAcknowledgement)
        UserDefaults.standard.set(true, forKey: ServerConstants.UserDefaults.subscriptionGiftAcknowledgementNeedsSyncKey)
    }

    public class func subscriptionGiftAcknowledgement() -> Bool {
        UserDefaults.standard.bool(forKey: ServerConstants.UserDefaults.subscriptionGiftAcknowledgement)
    }

    public class func subscriptionGiftAcknowledgementNeedsSyncing() -> Bool {
        UserDefaults.standard.bool(forKey: ServerConstants.UserDefaults.subscriptionGiftAcknowledgementNeedsSyncKey)
    }

    public class func subscriptionGiftAcknowledgementSynced() {
        UserDefaults.standard.set(false, forKey: ServerConstants.UserDefaults.subscriptionGiftAcknowledgementNeedsSyncKey)
    }

    public class func setSubscriptionType(_ value: Int) {
        UserDefaults.standard.set(value, forKey: ServerConstants.UserDefaults.subscriptionType)
    }

    public class func subscriptionType() -> SubscriptionType {
        SubscriptionType.plus
    }

    public class func setSubscriptionPodcasts(_ value: [PodcastSubscription]) {
        do {
            let data = try PropertyListEncoder().encode(value)
            UserDefaults.standard.set(data, forKey: ServerConstants.UserDefaults.subscriptionPodcasts)
        } catch {
            print("failed to encode subscription podcasts")
        }
    }

    public class func subscriptionPodcasts() -> [PodcastSubscription]? {
        guard let data = UserDefaults.standard.data(forKey: ServerConstants.UserDefaults.subscriptionPodcasts), let subscriptions = try? PropertyListDecoder().decode([PodcastSubscription].self, from: data) else {
            return nil
        }
        return subscriptions
    }

    public class func subscriptionForPodcast(uuid: String) -> PodcastSubscription? {
        guard let allSubscriptions = subscriptionPodcasts() else { return nil }

        return allSubscriptions.first { podcastSubscription -> Bool in
            podcastSubscription.uuid == uuid
        }
    }

    public class func numActiveSubscriptionBundles() -> Int {
        guard let bundles = subscriptionBundles() else {
            return 0
        }
        return bundles.count
    }

    public class func subscriptionBundles() -> [BundleSubscription]? {
        guard let subscriptions = subscriptionPodcasts() else { return nil }
        var bundles = [BundleSubscription]()

        for subscription in subscriptions {
            if let existingIndex = bundles.firstIndex(where: { $0.bundleUuid == subscription.bundleUuid }) {
                var existingBundle = bundles[existingIndex]
                bundles.remove(at: existingIndex)
                existingBundle.podcasts.append(subscription)
                bundles.insert(existingBundle, at: existingIndex)
            } else {
                let newBundle = BundleSubscription(bundleUuid: subscription.bundleUuid, podcasts: [subscription])
                bundles.append(newBundle)
            }
        }
        return bundles
    }

    public class func bundleSubscriptionForPodcast(podcastUuid: String) -> BundleSubscription? {
        guard let bundles = subscriptionBundles() else {
            return nil
        }
        for bundle in bundles {
            if bundle.podcasts.first(where: { $0.uuid == podcastUuid }) != nil {
                return bundle
            }
        }
        return nil
    }
}
