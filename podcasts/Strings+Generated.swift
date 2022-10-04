// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Button that takes you to other Automattic apps, eg: our Automattic family of apps
  internal static var aboutA8cFamily: String { return L10n.tr("Localizable", "about_a8c_family", fallback: "Automattic Family") }
  /// Button that takes the user to the Acknowledgements screen
  internal static var aboutAcknowledgements: String { return L10n.tr("Localizable", "about_acknowledgements", fallback: "Acknowledgements") }
  /// Secondary text on our come with with us call out
  internal static var aboutJoinFromAnywhere: String { return L10n.tr("Localizable", "about_join_from_anywhere", fallback: "Join From Anywhere") }
  /// Button that takes the user to legal and more screen
  internal static var aboutLegalAndMore: String { return L10n.tr("Localizable", "about_legal_and_more", fallback: "Legal and More") }
  /// Button that takes the user to privacy policy screen
  internal static var aboutPrivacyPolicy: String { return L10n.tr("Localizable", "about_privacy_policy", fallback: "Privacy Policy") }
  /// About page text to ask the user to rate our app in the App Store
  internal static var aboutRateUs: String { return L10n.tr("Localizable", "about_rate_us", fallback: "Rate Us") }
  /// About page text to ask the user to share a link to our app with friends
  internal static var aboutShareFriends: String { return L10n.tr("Localizable", "about_share_friends", fallback: "Share With Friends") }
  /// Button that takes the user to terms of service screen
  internal static var aboutTermsOfService: String { return L10n.tr("Localizable", "about_terms_of_service", fallback: "Terms of service") }
  /// Button that takes people to our website
  internal static var aboutWebsite: String { return L10n.tr("Localizable", "about_website", fallback: "Website") }
  /// Main callout to come get a job with Automattic
  internal static var aboutWorkWithUs: String { return L10n.tr("Localizable", "about_work_with_us", fallback: "Work With Us") }
  /// A common string used throughout the app. An accessibility label to direct the user to turn off the multi-select mode.
  internal static var accessibilityCancelMultiselect: String { return L10n.tr("Localizable", "accessibility_cancel_multiselect", fallback: "Cancel multiselect") }
  /// A common string used throughout the app. Accessibility hint to inform that the control closes the current dialog window.
  internal static var accessibilityCloseDialog: String { return L10n.tr("Localizable", "accessibility_close_dialog", fallback: "Close dialog") }
  /// A common string used throughout the app. Accessibility hint to inform the user that this control will deselect the episode.
  internal static var accessibilityDeselectEpisode: String { return L10n.tr("Localizable", "accessibility_deselect_episode", fallback: "Deselect Episode") }
  /// A common string used throughout the app. Accessibility hint to inform that the control is disabled.
  internal static var accessibilityDisabled: String { return L10n.tr("Localizable", "accessibility_disabled", fallback: "Disabled") }
  /// A common string used throughout the app. Accessibility hint to inform that the control dismisses the current window.
  internal static var accessibilityDismiss: String { return L10n.tr("Localizable", "accessibility_dismiss", fallback: "Dismiss") }
  /// An accessibility label to direct the user tap to get access to filter details.
  internal static var accessibilityHideFilterDetails: String { return L10n.tr("Localizable", "accessibility_hide_filter_details", fallback: "Tap to hide filter details") }
  /// Accessibility hint to inform the user how to star (favorite) for an episode.
  internal static var accessibilityHintStar: String { return L10n.tr("Localizable", "accessibility_hint_star", fallback: "Double tap to star episode") }
  /// Accessibility hint to inform the user how to un-star (remove favorite) for an episode.
  internal static var accessibilityHintUnstar: String { return L10n.tr("Localizable", "accessibility_hint_unstar", fallback: "Double tap to remove star from episode") }
  /// A common string used throughout the app. Accessibility hint to inform that the control opens a menu for more options.
  internal static var accessibilityMoreActions: String { return L10n.tr("Localizable", "accessibility_more_actions", fallback: "More actions") }
  /// A common string used throughout the app. An accessibility label to inform the user the completed percentage of a given task. '%1$@' is a placeholder for the localized spelled out number for Voice Over
  internal static func accessibilityPercentCompleteFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "accessibility_percent_complete_format", String(describing: p1), fallback: "%1$@ percent completed")
  }
  /// Accessibility text listing the current value for the playback speed. '%1$@' is a placeholder for the playback speed.
  internal static func accessibilityPlayerEffectsPlaybackSpeed(_ p1: Any) -> String {
    return L10n.tr("Localizable", "accessibility_player_effects_playback_speed", String(describing: p1), fallback: "Playback speed %1$@ times")
  }
  /// Accessibility hint to inform the user which filter color flag is being used. '%1$@' is a placeholder for the filter color number.
  internal static func accessibilityPlaylistColor(_ p1: Any) -> String {
    return L10n.tr("Localizable", "accessibility_playlist_color", String(describing: p1), fallback: "Playlist color %1$@")
  }
  /// A common string used throughout the app. An accessibility label to inform the user that the selected item is locked behind Pocket Casts Plus subscription.
  internal static var accessibilityPlusOnly: String { return L10n.tr("Localizable", "accessibility_plus_only", fallback: "Locked, Plus Feature") }
  /// Accessibility label fir the profile settings icon in the app. 'Pocket Casts' is treated as a proper noun and hasn't been localized in other places of the app.
  internal static var accessibilityProfileSettings: String { return L10n.tr("Localizable", "accessibility_profile_settings", fallback: "Pocket Casts Settings") }
  /// A common string used throughout the app. Accessibility hint to inform the user that this control will select the episode.
  internal static var accessibilitySelectEpisode: String { return L10n.tr("Localizable", "accessibility_select_episode", fallback: "Select Episode") }
  /// An accessibility label to direct the user tap to get access to filter details.
  internal static var accessibilityShowFilterDetails: String { return L10n.tr("Localizable", "accessibility_show_filter_details", fallback: "Tap to show filter details") }
  /// An accessibility hint to prompt the user to tap to open their account details or sign in.
  internal static var accessibilitySignIn: String { return L10n.tr("Localizable", "accessibility_sign_in", fallback: "Tap to view or setup account") }
  /// A common string used throughout the app. An accessibility label to direct the user to sort and option menus.
  internal static var accessibilitySortAndOptions: String { return L10n.tr("Localizable", "accessibility_sort_and_options", fallback: "Sort and Options") }
  /// Prompt to allow the user to update the email associated to their account.
  internal static var accountChangeEmail: String { return L10n.tr("Localizable", "account_change_email", fallback: "Change Email") }
  /// Nudge to inform the user that they are nearly done with the account set up steps.
  internal static var accountCompletionNudge: String { return L10n.tr("Localizable", "account_completion_nudge", fallback: "Almost There!") }
  /// Message portion of the nudge to inform the user that they are nearly done with the account set up steps.
  internal static var accountCompletionNudgeMsg: String { return L10n.tr("Localizable", "account_completion_nudge_msg", fallback: "Finalize your payment to finish upgrading your account.") }
  /// Title informing the user that their account has been successfully created
  internal static var accountCreated: String { return L10n.tr("Localizable", "account_created", fallback: "Account Created") }
  /// Title for the final screen in the account creation flow.
  internal static var accountCreationComplete: String { return L10n.tr("Localizable", "account_creation_complete", fallback: "Complete Account") }
  /// Prompt to allow the user to delete their account.
  internal static var accountDeleteAccount: String { return L10n.tr("Localizable", "account_delete_account", fallback: "Delete Account") }
  /// Confirmation option for deleting the user account.
  internal static var accountDeleteAccountConf: String { return L10n.tr("Localizable", "account_delete_account_conf", fallback: "Yes, Delete It") }
  /// Error title for when the delete account process has failed.
  internal static var accountDeleteAccountError: String { return L10n.tr("Localizable", "account_delete_account_error", fallback: "Delete Account Failed") }
  /// Error message for when the delete account process has failed.
  internal static var accountDeleteAccountErrorMsg: String { return L10n.tr("Localizable", "account_delete_account_error_msg", fallback: "Unable to delete account.") }
  /// The final alert message for the confirmation dialog asking the user to confirm they want to delete their account.
  internal static var accountDeleteAccountFinalAlertMsg: String { return L10n.tr("Localizable", "account_delete_account_final_alert_msg", fallback: "Last chance, you definitely want to delete your account? You will lose all your subscriptions and play history permanently!") }
  /// The first message for the confirmation dialog asking the user to confirm they want to delete their account.
  internal static var accountDeleteAccountFirstAlertMsg: String { return L10n.tr("Localizable", "account_delete_account_first_alert_msg", fallback: "Are you sure you want to delete your account, there's no way to undo this!") }
  /// Title for the confirmation dialog asking the user to confirm they want to delete their account.
  internal static var accountDeleteAccountTitle: String { return L10n.tr("Localizable", "account_delete_account_title", fallback: "Delete Account?") }
  /// Informs the user that their purchase will be automatically renewed monthly
  internal static var accountPaymentRenewsMonthly: String { return L10n.tr("Localizable", "account_payment_renews_monthly", fallback: "Renews automatically monthly") }
  /// Informs the user that their purchase will be automatically renewed yearly
  internal static var accountPaymentRenewsYearly: String { return L10n.tr("Localizable", "account_payment_renews_yearly", fallback: "Renews automatically yearly") }
  /// Allows the user to ope a screen to review the Privacy Policy
  internal static var accountPrivacyPolicy: String { return L10n.tr("Localizable", "account_privacy_policy", fallback: "Privacy Policy") }
  /// Error message for when the account registration request has failed.
  internal static var accountRegistrationFailed: String { return L10n.tr("Localizable", "account_registration_failed", fallback: "Registration failed, please try again later") }
  /// Prompt to allow the user to choose their account time when setting up their account.
  internal static var accountSelectType: String { return L10n.tr("Localizable", "account_select_type", fallback: "Select Account Type") }
  /// Prompt to allow the user to sign out of their account.
  internal static var accountSignOut: String { return L10n.tr("Localizable", "account_sign_out", fallback: "Sign Out") }
  /// Confirmation dialog informing the user that signing out will remove the given number of supported podcasts. '%1$@' is a placeholder for the number of supported podcasts.
  internal static func accountSignOutSupporterPrompt(_ p1: Any) -> String {
    return L10n.tr("Localizable", "account_sign_out_supporter_prompt", String(describing: p1), fallback: "Signing out will remove %1$@ supported podcasts from this device. Are you sure?")
  }
  /// Subtitle to the Confirmation dialog informing the user that signing out will remove the given number of supported podcasts.
  internal static var accountSignOutSupporterSubtitle: String { return L10n.tr("Localizable", "account_sign_out_supporter_subtitle", fallback: "You can sign in again to regain access.") }
  /// Message/Body of an alert that explains that the user should tap a button and sign in again
  internal static var accountSignedOutAlertMessage: String { return L10n.tr("Localizable", "account_signed_out_alert_message", fallback: "Turns out, if you type Google into Google, you can break the internet. 🫢 \n\nTap the button below to sign into your Pocket Casts account again.") }
  /// Title of an alert that informs the user that they have been signed out of their account
  internal static var accountSignedOutAlertTitle: String { return L10n.tr("Localizable", "account_signed_out_alert_title", fallback: "You've been signed out.") }
  /// Title for the account screen for the user's Pocket Casts Account. 'Pocket Casts' refers to the app name and is treated as a proper noun so it shouldn't be localized.
  internal static var accountTitle: String { return L10n.tr("Localizable", "account_title", fallback: "Pocket Casts Account") }
  /// Title informing the user that their account has been successfully upgraded to Pocket Casts Plus
  internal static var accountUpgraded: String { return L10n.tr("Localizable", "account_upgraded", fallback: "Account Upgraded") }
  /// Welcome message presented after a user has signed up for Pocket Casts
  internal static var accountWelcome: String { return L10n.tr("Localizable", "account_welcome", fallback: "Welcome to Pocket Casts!") }
  /// Welcome message presented after a user has signed up for Pocket Casts Plus
  internal static var accountWelcomePlus: String { return L10n.tr("Localizable", "account_welcome_plus", fallback: "Welcome to Pocket Casts Plus!") }
  /// A common string used throughout the app. Title for the prompt to add an episode to the up next queue.
  internal static var addToUpNext: String { return L10n.tr("Localizable", "add_to_up_next", fallback: "Add to Up Next") }
  /// A common string used throughout the app. Option that determines the behavior of the app after playing an item.
  internal static var afterPlaying: String { return L10n.tr("Localizable", "after_playing", fallback: "After Playing") }
  /// A common string used throughout the app. References to Badge settings for the app.
  internal static var appBadge: String { return L10n.tr("Localizable", "app_badge", fallback: "App Badge") }
  /// The name for the Classic App Icon
  internal static var appIconClassic: String { return L10n.tr("Localizable", "app_icon_classic", fallback: "Classic") }
  /// The name for the Dark App Icon
  internal static var appIconDark: String { return L10n.tr("Localizable", "app_icon_dark", fallback: "Dark") }
  /// The name for the Default App Icon
  internal static var appIconDefault: String { return L10n.tr("Localizable", "app_icon_default", fallback: "Default") }
  /// The name for the Electric Blue App Icon
  internal static var appIconElectricBlue: String { return L10n.tr("Localizable", "app_icon_electric_blue", fallback: "Electric Blue") }
  /// The name for the Electric Pink App Icon
  internal static var appIconElectricPink: String { return L10n.tr("Localizable", "app_icon_electric_pink", fallback: "Electric Pink") }
  /// The name for the Indigo App Icon
  internal static var appIconIndigo: String { return L10n.tr("Localizable", "app_icon_indigo", fallback: "Indigo") }
  /// The name for the Pocket Casts Plus App Icon
  internal static var appIconPlus: String { return L10n.tr("Localizable", "app_icon_plus", fallback: "Plus") }
  /// The name for the Pocket Cats App Icon. The name for this one is meant to be a play on the App name Pocket Casts and the icon includes a cat image.
  internal static var appIconPocketCats: String { return L10n.tr("Localizable", "app_icon_pocket_cats", fallback: "Pocket Cats") }
  /// The name for the Radioactivity App Icon
  internal static var appIconRadioactivity: String { return L10n.tr("Localizable", "app_icon_radioactivity", fallback: "Radioactivity") }
  /// The name for the Red Velvet App Icon
  internal static var appIconRedVelvet: String { return L10n.tr("Localizable", "app_icon_red_velvet", fallback: "Red Velvet") }
  /// The name for the Rosé App Icon
  internal static var appIconRose: String { return L10n.tr("Localizable", "app_icon_rose", fallback: "Rosé") }
  /// The name for the Round Dark App Icon
  internal static var appIconRoundDark: String { return L10n.tr("Localizable", "app_icon_round_dark", fallback: "Round Dark") }
  /// The name for the Round Light App Icon
  internal static var appIconRoundLight: String { return L10n.tr("Localizable", "app_icon_round_light", fallback: "Round Light") }
  /// Text sent when sharing a link to our app with other people
  internal static var appShareText: String { return L10n.tr("Localizable", "app_share_text", fallback: "Hey! Here is a link to download the Pocket Casts app. I'm really enjoying it and thought you might too.") }
  /// App version label in the about controller. `%1$@` is a placeholder for the version number and %2$@ is a placeholder for the build number
  internal static func appVersion(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "app_version", String(describing: p1), String(describing: p2), fallback: "Version %1$@ (%2$@)")
  }
  /// Section header for the appearance settings related to app icons.
  internal static var appearanceAppIconHeader: String { return L10n.tr("Localizable", "appearance_app_icon_header", fallback: "App Icon") }
  /// Section header for the appearance settings related to artwork.
  internal static var appearanceArtworkHeader: String { return L10n.tr("Localizable", "appearance_artwork_header", fallback: "Podcast Artwork") }
  /// Label for letting the user choose a theme for iOS dark mode.
  internal static var appearanceDarkTheme: String { return L10n.tr("Localizable", "appearance_dark_theme", fallback: "Dark Theme") }
  /// Prompt to toggle on the use of artwork that's embedded in the episode download files.
  internal static var appearanceEmbeddedArtwork: String { return L10n.tr("Localizable", "appearance_embedded_artwork", fallback: "Use Embedded Artwork") }
  /// Subtitle explaining embedded artwork in the episode download files.
  internal static var appearanceEmbeddedArtworkSubtitle: String { return L10n.tr("Localizable", "appearance_embedded_artwork_subtitle", fallback: "Shows artwork from the downloaded file (if it exists) in the player instead of using the show's artwork.") }
  /// Label for letting the user choose a theme for iOS light mode.
  internal static var appearanceLightTheme: String { return L10n.tr("Localizable", "appearance_light_theme", fallback: "Light Theme") }
  /// Prompt to toggle whether the theme will match the device theme or not.
  internal static var appearanceMatchDeviceTheme: String { return L10n.tr("Localizable", "appearance_match_device_theme", fallback: "Use iOS Light/Dark Mode") }
  /// Prompt to refresh the artwork for all podcasts.
  internal static var appearanceRefreshAllArtwork: String { return L10n.tr("Localizable", "appearance_refresh_all_artwork", fallback: "Refresh All Podcast Artwork") }
  /// Confirmation message used to inform the user that the refresh has been successfully triggered.
  internal static var appearanceRefreshAllArtworkConfMsg: String { return L10n.tr("Localizable", "appearance_refresh_all_artwork_conf_msg", fallback: "Refreshing your artwork now") }
  /// Confirmation title used to inform the user that the refresh has been successfully triggered.
  internal static var appearanceRefreshAllArtworkConfTitle: String { return L10n.tr("Localizable", "appearance_refresh_all_artwork_conf_title", fallback: "Aye Aye Captain") }
  /// Section header for the appearance settings related to themes.
  internal static var appearanceThemeHeader: String { return L10n.tr("Localizable", "appearance_theme_header", fallback: "Theme") }
  /// Header for asking the user to select a theme.
  internal static var appearanceThemeSelect: String { return L10n.tr("Localizable", "appearance_theme_select", fallback: "Select Theme") }
  /// A common string used throughout the app. Prompt to archive the selected item(s).
  internal static var archive: String { return L10n.tr("Localizable", "archive", fallback: "Archive") }
  /// A common string used throughout the app. Confirmation prompt before moving forward.
  internal static var areYouSure: String { return L10n.tr("Localizable", "are_you_sure", fallback: "Are You Sure?") }
  /// A common string used throughout the app. Prompt to configure the auto add options for a podcast.
  internal static var autoAdd: String { return L10n.tr("Localizable", "auto_add", fallback: "Auto Add To") }
  /// Option in the auto add dialog to add the items to the bottom of the queue.
  internal static var autoAddToBottom: String { return L10n.tr("Localizable", "auto_add_to_bottom", fallback: "To Bottom") }
  /// Option in the auto add dialog to add the items to the top of the queue.
  internal static var autoAddToTop: String { return L10n.tr("Localizable", "auto_add_to_top", fallback: "To Top") }
  /// Option in the auto add settings to stop adding options once the limit is reached. This option won't add new episodes.
  internal static var autoAddToUpNextStop: String { return L10n.tr("Localizable", "auto_add_to_up_next_stop", fallback: "Stop Adding New Episodes") }
  /// Option in the auto add settings to stop adding options once the limit is reached. This option won't add new episodes. To conserve space this should be a more concise version of 'Stop Adding New Episodes'
  internal static var autoAddToUpNextStopShort: String { return L10n.tr("Localizable", "auto_add_to_up_next_stop_short", fallback: "Stop Adding") }
  /// Option in the auto add settings to stop adding options once the limit is reached. This option will add the podcast to the top top the queue and drop the bottom.
  internal static var autoAddToUpNextTopOnly: String { return L10n.tr("Localizable", "auto_add_to_up_next_top_only", fallback: "Only Add To Top") }
  /// Option in the auto add settings to stop adding options once the limit is reached. This option will add the podcast to the top top the queue and drop the bottom. To conserve space this shouldn't be longer than the English string. If needed "Add To Top" or "To Top" can be translated instead
  internal static var autoAddToUpNextTopOnlyShort: String { return L10n.tr("Localizable", "auto_add_to_up_next_top_only_short", fallback: "Only Add To Top") }
  /// Title for the dialog box that presents the available options for how many episodes for auto download from a filter.
  internal static var autoDownloadFirst: String { return L10n.tr("Localizable", "auto_download_first", fallback: "Auto Download First") }
  /// Subtitle for the auto download setting. This is displayed when the option is turned off.
  internal static var autoDownloadOffSubtitle: String { return L10n.tr("Localizable", "auto_download_off_subtitle", fallback: "Enable to auto download episodes in this filter") }
  /// Subtitle for the auto download setting. This is displayed when the option is turned on. '%1$@' is a placeholder for the number of episodes, this will be more than one.
  internal static func autoDownloadOnPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "auto_download_on_plural_format", String(describing: p1), fallback: "The first %1$@ episodes in this filter will be automatically downloaded")
  }
  /// Provides hint text to auto download the a the first of a configurable amount of episodes. Accompanied by a label indicating how many episodes will be auto downloaded.
  internal static var autoDownloadPromptFirst: String { return L10n.tr("Localizable", "auto_download_prompt_first", fallback: "First") }
  /// A common string used throughout the app. Title for the back button. Used with the accessibility settings.
  internal static var back: String { return L10n.tr("Localizable", "back", fallback: "Back") }
  /// A common string used throughout the app. Title option to place the item at the bottom of the queue.
  internal static var bottom: String { return L10n.tr("Localizable", "bottom", fallback: "Bottom") }
  /// A common string used throughout the app. Informs the user of the maximum amount of bulk downloads. '%1$@' is a placeholder for maximum amount of bulk downloads.
  internal static func bulkDownloadMaxFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "bulk_download_max_format", String(describing: p1), fallback: "Bulk downloads are limited to %1$@.")
  }
  /// A common string used throughout the app. Prompt to cancel the current flow.
  internal static var cancel: String { return L10n.tr("Localizable", "cancel", fallback: "Cancel") }
  /// A common string used throughout the app. Prompt to cancel the download for the selected item(s).
  internal static var cancelDownload: String { return L10n.tr("Localizable", "cancel_download", fallback: "Cancel Download") }
  /// Message title indicating that the cancel process has failed.
  internal static var cancelFailed: String { return L10n.tr("Localizable", "cancel_failed", fallback: "Unable To Cancel") }
  /// Prompt to allow the user to cancel their Pocket Casts Plus subscription.
  internal static var cancelSubscription: String { return L10n.tr("Localizable", "cancel_subscription", fallback: "Cancel Subscription") }
  /// An activity message indicating that the process to cancel is running.
  internal static var canceling: String { return L10n.tr("Localizable", "canceling", fallback: "Canceling...") }
  /// CarPlay subtitle information label that includes the current chapter and total chapter count and the current chapter length. '%1$@' is a placeholder for the current chapter. '%2$@' is a placeholder for the total chapters. '%3$@' is a placeholder for the length of the current chapter.
  internal static func carplayChapterCount(_ p1: Any, _ p2: Any, _ p3: Any) -> String {
    return L10n.tr("Localizable", "carplay_chapter_count", String(describing: p1), String(describing: p2), String(describing: p3), fallback: "%1$@ of %2$@. %3$@")
  }
  /// Provides a link to the menu to present more options.
  internal static var carplayMore: String { return L10n.tr("Localizable", "carplay_more", fallback: "More") }
  /// CarPlay option to modify the playback speed.
  internal static var carplayPlaybackSpeed: String { return L10n.tr("Localizable", "carplay_playback_speed", fallback: "Playback Speed") }
  /// CarPlay prompt to navigate to the up next Queue.
  internal static var carplayUpNextQueue: String { return L10n.tr("Localizable", "carplay_up_next_queue", fallback: "Up Next Queue") }
  /// Prompt to allow the user to update their email address.
  internal static var changeEmail: String { return L10n.tr("Localizable", "change_email", fallback: "Change Email Address") }
  /// Confirmation message title informing the user that their email has been successfully updated.
  internal static var changeEmailConf: String { return L10n.tr("Localizable", "change_email_conf", fallback: "Email Address Changed") }
  /// Prompt to allow the user to Update their password.
  internal static var changePassword: String { return L10n.tr("Localizable", "change_password", fallback: "Change Password") }
  /// Confirmation message title informing the user that their password has been successfully updated.
  internal static var changePasswordConf: String { return L10n.tr("Localizable", "change_password_conf", fallback: "Password Changed") }
  /// Error message informing the user that the change password process failed.
  internal static var changePasswordError: String { return L10n.tr("Localizable", "change_password_error", fallback: "Unable to change password. Invalid password.") }
  /// Error message informing the user that the change password process failed because they failed to enter matching passwords.
  internal static var changePasswordErrorMismatch: String { return L10n.tr("Localizable", "change_password_error_mismatch", fallback: "Passwords do not match") }
  /// Error message informing the user that they need to choose a longer password.
  internal static var changePasswordLengthError: String { return L10n.tr("Localizable", "change_password_length_error", fallback: "Must be at least 6 characters") }
  /// A common string used throughout the app. Often refers to the Chapters list or Chapters tab in the player.
  internal static var chapters: String { return L10n.tr("Localizable", "chapters", fallback: "Chapters") }
  /// A common string used throughout the app. Informs the user how many podcasts have been chosen. '%1$@' is a placeholder for the number of podcasts, this will be more than one.
  internal static func chosenPodcastsPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "chosen_podcasts_plural_format", String(describing: p1), fallback: "%1$@ Podcasts Chosen")
  }
  /// A common string used throughout the app. Informs the user how many podcasts have been chosen. This is the singular format for an accompanying plural option.
  internal static var chosenPodcastsSingular: String { return L10n.tr("Localizable", "chosen_podcasts_singular", fallback: "1 Podcast Chosen") }
  /// Title for the screen that provides the list of available ChromeCast devices.
  internal static var chromecastCastTo: String { return L10n.tr("Localizable", "chromecast_cast_to", fallback: "Cast to") }
  /// Informs the user that ChromeCast has connected.
  internal static var chromecastConnected: String { return L10n.tr("Localizable", "chromecast_connected", fallback: "Connected") }
  /// Informs the user that ChromeCast has connected to the device. Used as a title when no episode is playing.
  internal static var chromecastConnectedToDevice: String { return L10n.tr("Localizable", "chromecast_connected_to_device", fallback: "Connected to device") }
  /// Error message informing the user that the app is unable to Cast local files in ChromeCast.
  internal static var chromecastError: String { return L10n.tr("Localizable", "chromecast_error", fallback: "Unable to cast local file") }
  /// Informs the user that ChromeCast has connected to the device but no episode is playing.
  internal static var chromecastNothingPlaying: String { return L10n.tr("Localizable", "chromecast_nothing_playing", fallback: "Nothing is playing") }
  /// Placeholder name for when ChromeCast doesn't have a device name.
  internal static var chromecastUnnamedDevice: String { return L10n.tr("Localizable", "chromecast_unnamed_device", fallback: "Un-named device") }
  /// A common string used throughout the app. Prompt to perform a clean up operation on the selected items.
  internal static var cleanUp: String { return L10n.tr("Localizable", "clean_up", fallback: "Clean Up") }
  /// A common string used throughout the app. Prompt to clear the up next queue.
  internal static var clear: String { return L10n.tr("Localizable", "clear", fallback: "Clear") }
  /// A common string used throughout the app. Prompt to clear the up next queue.
  internal static var clearUpNext: String { return L10n.tr("Localizable", "clear_up_next", fallback: "Clear Up Next") }
  /// A common string used throughout the app. Message to clear the up next queue.
  internal static var clearUpNextMessage: String { return L10n.tr("Localizable", "clear_up_next_message", fallback: "Are you sure you want to clear your Up Next queue?") }
  /// A common string used throughout the app. Prompt to close the current screen.
  internal static var close: String { return L10n.tr("Localizable", "close", fallback: "Close") }
  /// Common word, the color of something
  internal static var color: String { return L10n.tr("Localizable", "color", fallback: "Color") }
  /// A common string used throughout the app. Generic confirmation
  internal static var confirm: String { return L10n.tr("Localizable", "confirm", fallback: "Confirm") }
  /// Password change form confirm new password field prompt
  internal static var confirmNewPasswordPrompt: String { return L10n.tr("Localizable", "confirm_new_password_prompt", fallback: "Confirm New Password") }
  /// A common string used throughout the app. A prompt to move to the next step of a flow.
  internal static var `continue`: String { return L10n.tr("Localizable", "continue", fallback: "Continue") }
  /// Prompt to open the create account options.
  internal static var createAccount: String { return L10n.tr("Localizable", "create_account", fallback: "Create Account") }
  /// Error message shown when Pocket Casts can't connect to the App Store to retrieve in app purchase details
  internal static var createAccountAppStoreErrorMessage: String { return L10n.tr("Localizable", "create_account_app_store_error_message", fallback: "Pocket Casts is having trouble connecting to the App Store. Please check your connection and try again.") }
  /// Error title shown when Pocket Casts can't connect to the App Store to retrieve in app purchase details
  internal static var createAccountAppStoreErrorTitle: String { return L10n.tr("Localizable", "create_account_app_store_error_title", fallback: "Unable to contact App Store") }
  /// Button title to find out more about Pocket Casts Plus. Note that "Pocket Casts Plus" shouldn't be translated as it's a product name
  internal static var createAccountFindOutMorePlus: String { return L10n.tr("Localizable", "create_account_find_out_more_plus", fallback: "Find out more about Pocket Casts Plus") }
  /// Account type shown on the select account page. Regular as in the normal or default option
  internal static var createAccountFreeAccountType: String { return L10n.tr("Localizable", "create_account_free_account_type", fallback: "Regular") }
  /// Shown under the create account type to indicate what you get with a free Pocket Casts account
  internal static var createAccountFreeDetails: String { return L10n.tr("Localizable", "create_account_free_details", fallback: "Almost everything") }
  /// Price shown for the free tier. "Free" in this case meaning the cost is free
  internal static var createAccountFreePrice: String { return L10n.tr("Localizable", "create_account_free_price", fallback: "Free") }
  /// Shown under the create account type to indicate what you get in Pocket Casts Plus
  internal static var createAccountPlusDetails: String { return L10n.tr("Localizable", "create_account_plus_details", fallback: "Everything unlocked") }
  /// Title for the screen where a user starts creating a filter
  internal static var createFilter: String { return L10n.tr("Localizable", "create_filter", fallback: "Create Filter") }
  /// Email change form current email label
  internal static var currentEmailPrompt: String { return L10n.tr("Localizable", "current_email_prompt", fallback: "Current Email") }
  /// Password change form current password field prompt
  internal static var currentPasswordPrompt: String { return L10n.tr("Localizable", "current_password_prompt", fallback: "Current Password") }
  /// An indicator that the current episode is a user generated episode
  internal static var customEpisode: String { return L10n.tr("Localizable", "custom_episode", fallback: "Custom Episode") }
  /// Prompt to cancel an active upload of a file.
  internal static var customEpisodeCancelUpload: String { return L10n.tr("Localizable", "custom_episode_cancel_upload", fallback: "Cancel Upload") }
  /// Prompt to delete an uploaded file from the cloud.
  internal static var customEpisodeRemoveUpload: String { return L10n.tr("Localizable", "custom_episode_remove_upload", fallback: "Remove from Cloud") }
  /// Prompt to upload a file to the cloud.
  internal static var customEpisodeUpload: String { return L10n.tr("Localizable", "custom_episode_upload", fallback: "Upload to Cloud") }
  /// Label shown for days listened when it's singular, eg: 1 day listened.
  internal static var dayListened: String { return L10n.tr("Localizable", "day_listened", fallback: "Day listened") }
  /// Label shown for days saved when it's singular, eg: 1 day saved.
  internal static var daySaved: String { return L10n.tr("Localizable", "day_saved", fallback: "Day saved") }
  /// Label shown for days listened when it's singular, eg: 2 days listened.
  internal static var daysListened: String { return L10n.tr("Localizable", "days_listened", fallback: "Days listened") }
  /// Label shown for days saved when it's singular, eg: 2 days saved.
  internal static var daysSaved: String { return L10n.tr("Localizable", "days_saved", fallback: "Days saved") }
  /// A common string used throughout the app. Prompt to delete the selected item(s).
  internal static var delete: String { return L10n.tr("Localizable", "delete", fallback: "Delete") }
  /// A prompt to delete the downloaded file
  internal static var deleteDownload: String { return L10n.tr("Localizable", "delete_download", fallback: "Delete Download") }
  /// Prompt to delete the selected item(s) from the device storage and the cloud.
  internal static var deleteEverywhere: String { return L10n.tr("Localizable", "delete_everywhere", fallback: "Delete From Everywhere") }
  /// Prompt to delete the selected item(s) from the device storage and the cloud.
  internal static var deleteEverywhereShort: String { return L10n.tr("Localizable", "delete_everywhere_short", fallback: "Delete Everywhere") }
  /// A common string used throughout the app. Title portion of the prompt to delete the selected file.
  internal static var deleteFile: String { return L10n.tr("Localizable", "delete_file", fallback: "Delete File") }
  /// A common string used throughout the app. Message portion of the prompt to delete the selected file.
  internal static var deleteFileMessage: String { return L10n.tr("Localizable", "delete_file_message", fallback: "Are you sure you want to delete this file?") }
  /// A common string used throughout the app. Prompt to delete the selected item(s) from the cloud storage.
  internal static var deleteFromCloud: String { return L10n.tr("Localizable", "delete_from_cloud", fallback: "Delete From Cloud") }
  /// A common string used throughout the app. Prompt to delete the selected item(s) from the device storage.
  internal static var deleteFromDevice: String { return L10n.tr("Localizable", "delete_from_device", fallback: "Delete From Device") }
  /// A common string used throughout the app. Prompt to delete the selected item(s) from the device storage. 'Only' is used to emphasize that the item is also stored in the cloud and that file won't be deleted.
  internal static var deleteFromDeviceOnly: String { return L10n.tr("Localizable", "delete_from_device_only", fallback: "Delete From Device Only") }
  /// A common string used throughout the app. Prompt to deselect all items in the presented list.
  internal static var deselectAll: String { return L10n.tr("Localizable", "deselect_all", fallback: "Deselect All") }
  /// A common string used throughout the app. Refers to the Discover tab.
  internal static var discover: String { return L10n.tr("Localizable", "discover", fallback: "Discover") }
  /// Title for the section that allows the user to explore different podcast categories.
  internal static var discoverBrowseByCategory: String { return L10n.tr("Localizable", "discover_browse_by_category", fallback: "Browse By Category") }
  /// Title for the podcast category Arts
  internal static var discoverBrowseByCategoryArt: String { return L10n.tr("Localizable", "discover_browse_by_category_art", fallback: "Arts") }
  /// Title for the podcast category Business
  internal static var discoverBrowseByCategoryBusiness: String { return L10n.tr("Localizable", "discover_browse_by_category_business", fallback: "Business") }
  /// Title for the podcast category Comedy
  internal static var discoverBrowseByCategoryComedy: String { return L10n.tr("Localizable", "discover_browse_by_category_comedy", fallback: "Comedy") }
  /// Title for the podcast category Education
  internal static var discoverBrowseByCategoryEducation: String { return L10n.tr("Localizable", "discover_browse_by_category_education", fallback: "Education") }
  /// Title for the podcast category Fiction
  internal static var discoverBrowseByCategoryFiction: String { return L10n.tr("Localizable", "discover_browse_by_category_fiction", fallback: "Fiction") }
  /// Title for the podcast category Games & Hobbies
  internal static var discoverBrowseByCategoryGamesAndHobbies: String { return L10n.tr("Localizable", "discover_browse_by_category_games_and_hobbies", fallback: "Games & Hobbies") }
  /// Title for the podcast category Government
  internal static var discoverBrowseByCategoryGovernment: String { return L10n.tr("Localizable", "discover_browse_by_category_government", fallback: "Government") }
  /// Title for the podcast category Government & Organizations
  internal static var discoverBrowseByCategoryGovernmentAndOrganizations: String { return L10n.tr("Localizable", "discover_browse_by_category_government_and_organizations", fallback: "Government & Organizations") }
  /// Title for the podcast category Health
  internal static var discoverBrowseByCategoryHealth: String { return L10n.tr("Localizable", "discover_browse_by_category_health", fallback: "Health") }
  /// Title for the podcast category Health & Fitness
  internal static var discoverBrowseByCategoryHealthAndFitness: String { return L10n.tr("Localizable", "discover_browse_by_category_health_and_fitness", fallback: "Health & Fitness") }
  /// Title for the podcast category History
  internal static var discoverBrowseByCategoryHistory: String { return L10n.tr("Localizable", "discover_browse_by_category_history", fallback: "History") }
  /// Title for the podcast category Kids & Family
  internal static var discoverBrowseByCategoryKidsAndFamily: String { return L10n.tr("Localizable", "discover_browse_by_category_kids_and_family", fallback: "Kids & Family") }
  /// Title for the podcast category Leisure
  internal static var discoverBrowseByCategoryLeisure: String { return L10n.tr("Localizable", "discover_browse_by_category_leisure", fallback: "Leisure") }
  /// Title for the podcast category Music
  internal static var discoverBrowseByCategoryMusic: String { return L10n.tr("Localizable", "discover_browse_by_category_music", fallback: "Music") }
  /// Title for the podcast category News
  internal static var discoverBrowseByCategoryNews: String { return L10n.tr("Localizable", "discover_browse_by_category_news", fallback: "News") }
  /// Title for the podcast category News & Politics
  internal static var discoverBrowseByCategoryNewsAndPolitics: String { return L10n.tr("Localizable", "discover_browse_by_category_news_and_politics", fallback: "News & Politics") }
  /// Title for the podcast category Religion & Spirituality
  internal static var discoverBrowseByCategoryReligionAndSpirituality: String { return L10n.tr("Localizable", "discover_browse_by_category_religion_and_spirituality", fallback: "Religion & Spirituality") }
  /// Title for the podcast category Science
  internal static var discoverBrowseByCategoryScience: String { return L10n.tr("Localizable", "discover_browse_by_category_science", fallback: "Science") }
  /// Title for the podcast category Science & Medicine
  internal static var discoverBrowseByCategoryScienceAndMedicine: String { return L10n.tr("Localizable", "discover_browse_by_category_science_and_medicine", fallback: "Science & Medicine") }
  /// Title for the podcast category Society
  internal static var discoverBrowseByCategorySociety: String { return L10n.tr("Localizable", "discover_browse_by_category_society", fallback: "Society") }
  /// Title for the podcast category Society & Culture
  internal static var discoverBrowseByCategorySocietyAndCulture: String { return L10n.tr("Localizable", "discover_browse_by_category_society_and_culture", fallback: "Society & Culture") }
  /// Title for the podcast category Sports
  internal static var discoverBrowseByCategorySports: String { return L10n.tr("Localizable", "discover_browse_by_category_sports", fallback: "Sports") }
  /// Title for the podcast category Sports & Recreation
  internal static var discoverBrowseByCategorySportsAndRecreation: String { return L10n.tr("Localizable", "discover_browse_by_category_sports_and_recreation", fallback: "Sports & Recreation") }
  /// Title for the podcast category Technology
  internal static var discoverBrowseByCategoryTechnology: String { return L10n.tr("Localizable", "discover_browse_by_category_technology", fallback: "Technology") }
  /// Title for the podcast category True Crime
  internal static var discoverBrowseByCategoryTrueCrime: String { return L10n.tr("Localizable", "discover_browse_by_category_true_crime", fallback: "True Crime") }
  /// Title for the podcast category TV & Film
  internal static var discoverBrowseByCategoryTvAndFilm: String { return L10n.tr("Localizable", "discover_browse_by_category_tv_and_film", fallback: "TV & Film") }
  /// Prompt to allow the user to manually change the regional information for the Discover tab. '%1$@' is a placeholder for the current region.
  internal static func discoverChangeRegion(_ p1: Any) -> String {
    return L10n.tr("Localizable", "discover_change_region", String(describing: p1), fallback: "Change Region, currently %1$@")
  }
  /// Badge used to mark featured podcasts.
  internal static var discoverFeatured: String { return L10n.tr("Localizable", "discover_featured", fallback: "Featured") }
  /// Informative label letting the users know that the displayed episode is a featured episode.
  internal static var discoverFeaturedEpisode: String { return L10n.tr("Localizable", "discover_featured_episode", fallback: "FEATURED EPISODE") }
  /// Informative label letting the users know that the displayed podcast is a featured new podcast.
  internal static var discoverFreshPick: String { return L10n.tr("Localizable", "discover_fresh_pick", fallback: "FRESH PICK") }
  /// Informational title when the search succeeds but returns no results.
  internal static var discoverNoPodcastsFound: String { return L10n.tr("Localizable", "discover_no_podcasts_found", fallback: "No podcasts found") }
  /// Informational title when the search succeeds but returns no results.
  internal static var discoverNoPodcastsFoundMsg: String { return L10n.tr("Localizable", "discover_no_podcasts_found_msg", fallback: "Try more general or different keywords.") }
  /// Button prompt on the discover page to play the featured episode.
  internal static var discoverPlayEpisode: String { return L10n.tr("Localizable", "discover_play_episode", fallback: "Play Episode") }
  /// Button prompt on the discover page to play the trailer of a featured episode.
  internal static var discoverPlayTrailer: String { return L10n.tr("Localizable", "discover_play_trailer", fallback: "Play Trailer") }
  /// Display title for calling out a podcast network on the discover tab. '%1$@' is a placeholder for the podcast's network title.
  internal static func discoverPodcastNetwork(_ p1: Any) -> String {
    return L10n.tr("Localizable", "discover_podcast_network", String(describing: p1), fallback: "%1$@ Network")
  }
  /// Title used for promotional purposes to highlight podcasts that are popular worldwide.
  internal static var discoverPopular: String { return L10n.tr("Localizable", "discover_popular", fallback: "Popular") }
  /// Title used for promotional purposes to highlight podcasts that are popular in a specific region. '%1$@' is a placeholder for the region's name.
  internal static func discoverPopularIn(_ p1: Any) -> String {
    return L10n.tr("Localizable", "discover_popular_in", String(describing: p1), fallback: "Popular in %1$@")
  }
  /// Region name for Australia used in the Discover Section
  internal static var discoverRegionAustralia: String { return L10n.tr("Localizable", "discover_region_australia", fallback: "Australia") }
  /// Region name for Austria used in the Discover Section
  internal static var discoverRegionAustria: String { return L10n.tr("Localizable", "discover_region_austria", fallback: "Austria") }
  /// Region name for Belgium used in the Discover Section
  internal static var discoverRegionBelgium: String { return L10n.tr("Localizable", "discover_region_belgium", fallback: "Belgium") }
  /// Region name for Brazil used in the Discover Section
  internal static var discoverRegionBrazil: String { return L10n.tr("Localizable", "discover_region_brazil", fallback: "Brazil") }
  /// Region name for Canada used in the Discover Section
  internal static var discoverRegionCanada: String { return L10n.tr("Localizable", "discover_region_canada", fallback: "Canada") }
  /// Region name for China used in the Discover Section
  internal static var discoverRegionChina: String { return L10n.tr("Localizable", "discover_region_china", fallback: "China") }
  /// Region name for Czechia used in the Discover Section
  internal static var discoverRegionCzechia: String { return L10n.tr("Localizable", "discover_region_czechia", fallback: "Czechia") }
  /// Region name for Denmark used in the Discover Section
  internal static var discoverRegionDenmark: String { return L10n.tr("Localizable", "discover_region_denmark", fallback: "Denmark") }
  /// Region name for Finland used in the Discover Section
  internal static var discoverRegionFinland: String { return L10n.tr("Localizable", "discover_region_finland", fallback: "Finland") }
  /// Region name for France used in the Discover Section
  internal static var discoverRegionFrance: String { return L10n.tr("Localizable", "discover_region_france", fallback: "France") }
  /// Region name for Germany used in the Discover Section
  internal static var discoverRegionGermany: String { return L10n.tr("Localizable", "discover_region_germany", fallback: "Germany") }
  /// Region name for Hong Kong used in the Discover Section
  internal static var discoverRegionHongKong: String { return L10n.tr("Localizable", "discover_region_hong_kong", fallback: "Hong Kong") }
  /// Region name for India used in the Discover Section
  internal static var discoverRegionIndia: String { return L10n.tr("Localizable", "discover_region_india", fallback: "India") }
  /// Region name for Ireland used in the Discover Section
  internal static var discoverRegionIreland: String { return L10n.tr("Localizable", "discover_region_ireland", fallback: "Ireland") }
  /// Region name for Israel used in the Discover Section
  internal static var discoverRegionIsrael: String { return L10n.tr("Localizable", "discover_region_israel", fallback: "Israel") }
  /// Region name for Italy used in the Discover Section
  internal static var discoverRegionItaly: String { return L10n.tr("Localizable", "discover_region_italy", fallback: "Italy") }
  /// Region name for Japan used in the Discover Section
  internal static var discoverRegionJapan: String { return L10n.tr("Localizable", "discover_region_japan", fallback: "Japan") }
  /// Region name for Mexico used in the Discover Section
  internal static var discoverRegionMexico: String { return L10n.tr("Localizable", "discover_region_mexico", fallback: "Mexico") }
  /// Region name for Netherlands used in the Discover Section
  internal static var discoverRegionNetherlands: String { return L10n.tr("Localizable", "discover_region_netherlands", fallback: "Netherlands") }
  /// Region name for New Zealand used in the Discover Section
  internal static var discoverRegionNewZealand: String { return L10n.tr("Localizable", "discover_region_new_zealand", fallback: "New Zealand") }
  /// Region name for Norway used in the Discover Section
  internal static var discoverRegionNorway: String { return L10n.tr("Localizable", "discover_region_norway", fallback: "Norway") }
  /// Region name for Philippines used in the Discover Section
  internal static var discoverRegionPhilippines: String { return L10n.tr("Localizable", "discover_region_philippines", fallback: "Philippines") }
  /// Region name for Poland used in the Discover Section
  internal static var discoverRegionPoland: String { return L10n.tr("Localizable", "discover_region_poland", fallback: "Poland") }
  /// Region name for Portugal used in the Discover Section
  internal static var discoverRegionPortugal: String { return L10n.tr("Localizable", "discover_region_portugal", fallback: "Portugal") }
  /// Region name for Russia used in the Discover Section
  internal static var discoverRegionRussia: String { return L10n.tr("Localizable", "discover_region_russia", fallback: "Russia") }
  /// Region name for Saudi Arabia used in the Discover Section
  internal static var discoverRegionSaudiArabia: String { return L10n.tr("Localizable", "discover_region_saudi_arabia", fallback: "Saudi Arabia") }
  /// Region name for Singapore used in the Discover Section
  internal static var discoverRegionSingapore: String { return L10n.tr("Localizable", "discover_region_singapore", fallback: "Singapore") }
  /// Region name for South Africa used in the Discover Section
  internal static var discoverRegionSouthAfrica: String { return L10n.tr("Localizable", "discover_region_south_africa", fallback: "South Africa") }
  /// Region name for South Korea used in the Discover Section
  internal static var discoverRegionSouthKorea: String { return L10n.tr("Localizable", "discover_region_south_korea", fallback: "South Korea") }
  /// Region name for Spain used in the Discover Section
  internal static var discoverRegionSpain: String { return L10n.tr("Localizable", "discover_region_spain", fallback: "Spain") }
  /// Region name for Sweden used in the Discover Section
  internal static var discoverRegionSweden: String { return L10n.tr("Localizable", "discover_region_sweden", fallback: "Sweden") }
  /// Region name for Switzerland used in the Discover Section
  internal static var discoverRegionSwitzerland: String { return L10n.tr("Localizable", "discover_region_switzerland", fallback: "Switzerland") }
  /// Region name for Taiwan used in the Discover Section
  internal static var discoverRegionTaiwan: String { return L10n.tr("Localizable", "discover_region_taiwan", fallback: "Taiwan") }
  /// Region name for Turkey used in the Discover Section
  internal static var discoverRegionTurkey: String { return L10n.tr("Localizable", "discover_region_turkey", fallback: "Turkey") }
  /// Region name for Ukraine used in the Discover Section
  internal static var discoverRegionUkraine: String { return L10n.tr("Localizable", "discover_region_ukraine", fallback: "Ukraine") }
  /// Region name for United Kingdom used in the Discover Section
  internal static var discoverRegionUnitedKingdom: String { return L10n.tr("Localizable", "discover_region_united_kingdom", fallback: "United Kingdom") }
  /// Region name for United States used in the Discover Section
  internal static var discoverRegionUnitedStates: String { return L10n.tr("Localizable", "discover_region_united_states", fallback: "United States") }
  /// Region name used in the Discover Section for a genreic global setting instead of a specific region.
  internal static var discoverRegionWorldwide: String { return L10n.tr("Localizable", "discover_region_worldwide", fallback: "Worldwide") }
  /// Error message when a user performs a search using a search term that's too short.
  internal static var discoverSearchErrorMsg: String { return L10n.tr("Localizable", "discover_search_error_msg", fallback: "Please enter at least 2 characters.") }
  /// Error title when a user performs a search using a search term that's too short.
  internal static var discoverSearchErrorTitle: String { return L10n.tr("Localizable", "discover_search_error_title", fallback: "Length Challenged") }
  /// Informational title informing the users that the search has failed.
  internal static var discoverSearchFailed: String { return L10n.tr("Localizable", "discover_search_failed", fallback: "Search Failed") }
  /// Informational message suggesting that the user checks their internet connection when an error occurs.
  internal static var discoverSearchFailedMsg: String { return L10n.tr("Localizable", "discover_search_failed_msg", fallback: "Check your Internet connection.") }
  /// Screen title to allow the user to manually change the regional information for the Discover tab. This screen shows the available options.
  internal static var discoverSelectRegion: String { return L10n.tr("Localizable", "discover_select_region", fallback: "Select Content Region") }
  /// Button prompt used on the Discover Tab. Opens the linked list to show all podcasts in the section.
  internal static var discoverShowAll: String { return L10n.tr("Localizable", "discover_show_all", fallback: "SHOW ALL") }
  /// Informative label letting the users know that the displayed podcast is a paid placement ad.
  internal static var discoverSponsored: String { return L10n.tr("Localizable", "discover_sponsored", fallback: "SPONSORED") }
  /// Title used for promotional purposes to highlight trending podcasts.
  internal static var discoverTrending: String { return L10n.tr("Localizable", "discover_trending", fallback: "Trending") }
  /// A common string used throughout the app. Confirmation text.
  internal static var done: String { return L10n.tr("Localizable", "done", fallback: "Done") }
  /// A common string used throughout the app. Prompt to download the selected item(s).
  internal static var download: String { return L10n.tr("Localizable", "download", fallback: "Download") }
  /// A common string used throughout the app. Prompt to download all of the selected item(s).
  internal static var downloadAll: String { return L10n.tr("Localizable", "download_all", fallback: "Download All") }
  /// A common string used throughout the app. Prompt to warn the user that continuing with the download will consume data. Used in tandem with a notice that the user is not on WiFi.
  internal static var downloadDataWarning: String { return L10n.tr("Localizable", "download_data_warning", fallback: "Downloading will use data.") }
  /// A common string used throughout the app. Prompts the user that they have selected multiple episodes to download. '%1$@' is a placeholder for the count of the selected items, will be more than one.
  internal static func downloadEpisodePluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "download_episode_plural_format", String(describing: p1), fallback: "Download %1$@ Episodes")
  }
  /// A common string used throughout the app. Prompts the user that they have selected one episode to download.
  internal static var downloadEpisodeSingular: String { return L10n.tr("Localizable", "download_episode_singular", fallback: "Download 1 Episode") }
  /// The episode failed to download due to an issue with the feed. Suggesting the user reaches out to the Podcast Author.
  internal static var downloadErrorContactAuthor: String { return L10n.tr("Localizable", "download_error_contact_author", fallback: "Episode not available due to an error in the podcast feed. Contact the podcast author.") }
  /// The episode failed to download due to an issue with the feed. Suggesting the user reaches out to the Podcast Author.
  internal static var downloadErrorContactAuthorVersion2: String { return L10n.tr("Localizable", "download_error_contact_author_version_2", fallback: "This episode may have been moved or deleted. Contact the podcast author.") }
  /// The episode failed to download due to the user running out of storage space.
  internal static var downloadErrorNotEnoughSpace: String { return L10n.tr("Localizable", "download_error_not_enough_space", fallback: "Unable to save episode, have you run out of space?") }
  /// The episode failed to download because the file wasn't available on the server
  internal static var downloadErrorNotUploaded: String { return L10n.tr("Localizable", "download_error_not_uploaded", fallback: "File not uploaded, unable to play") }
  /// The episode failed to download due to an issue with the feed. Suggesting the user reaches out to the Podcast Author. '%1$@' is a placeholder for the status code that the app received.
  internal static func downloadErrorStatusCode(_ p1: Any) -> String {
    return L10n.tr("Localizable", "download_error_status_code", String(describing: p1), fallback: "Download failed, error code %1$@. Contact the podcast author.")
  }
  /// The episode failed to download but the app wasn't able to determine why. Suggesting to try again after waiting for a bit.
  internal static var downloadErrorTryAgain: String { return L10n.tr("Localizable", "download_error_try_again", fallback: "Unable to download episode. Please try again later.") }
  /// A common string used throughout the app. Informs the user the download has failed.
  internal static var downloadFailed: String { return L10n.tr("Localizable", "download_failed", fallback: "Download Failed") }
  /// A common string used throughout the app. Title for screens and prompts related to storage and downloaded files.
  internal static var downloadedFiles: String { return L10n.tr("Localizable", "downloaded_files", fallback: "Downloaded Files") }
  /// Confirmation message when you choose to delete a set of downloaded files
  internal static var downloadedFilesCleanupConfirmation: String { return L10n.tr("Localizable", "downloaded_files_cleanup_confirmation", fallback: "Are you sure you want to delete these downloaded files?") }
  /// Message for an unsubscribe message box that informs the user that unsubscribing will remove downloaded files.
  internal static var downloadedFilesConfMessage: String { return L10n.tr("Localizable", "downloaded_files_conf_message", fallback: "Unsubscribing will delete all downloaded files in this Podcast, are you sure?") }
  /// Title for an unsubscribe message box that informs the user that unsubscribing will remove downloaded files. Informs the user how many files have been downloaded. '%1$@' is a placeholder for the number of downloaded files, will be more than one.
  internal static func downloadedFilesConfPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "downloaded_files_conf_plural_format", String(describing: p1), fallback: "%1$@ Downloaded Files")
  }
  /// Title for an unsubscribe message box that informs the user that unsubscribing will remove downloaded files. Informs the user one file has been downloaded. Singular version of an accompanying plural message.
  internal static var downloadedFilesConfSingular: String { return L10n.tr("Localizable", "downloaded_files_conf_singular", fallback: "1 Downloaded File") }
  /// A common string used throughout the app. Often refers to the Downloads screen.
  internal static var downloads: String { return L10n.tr("Localizable", "downloads", fallback: "Downloads") }
  /// Prompt to navigate the user to the Auto Downloads settings menu.
  internal static var downloadsAutoDownload: String { return L10n.tr("Localizable", "downloads_auto_download", fallback: "Auto Download Settings") }
  /// The description for the empty state when there are no downloads available
  internal static var downloadsNoDownloadsDesc: String { return L10n.tr("Localizable", "downloads_no_downloads_desc", fallback: "Oh no! You’re fresh out of downloads. Download some more and they’ll show up here.") }
  /// Title for the empty state when there are no downloads available
  internal static var downloadsNoDownloadsTitle: String { return L10n.tr("Localizable", "downloads_no_downloads_title", fallback: "No Downloaded Episodes") }
  /// Prompt to allow the user to retry failed downloads.
  internal static var downloadsRetryFailedDownloads: String { return L10n.tr("Localizable", "downloads_retry_failed_downloads", fallback: "Retry Failed Downloads") }
  /// Prompt to allow the user to stop active downloads.
  internal static var downloadsStopAllDownloads: String { return L10n.tr("Localizable", "downloads_stop_all_downloads", fallback: "Stop All Downloads") }
  /// Common word used to denote editting something
  internal static var edit: String { return L10n.tr("Localizable", "edit", fallback: "Edit") }
  /// Refers to an Episode in the singular form.
  internal static var episode: String { return L10n.tr("Localizable", "episode", fallback: "Episode") }
  /// A common string used throughout the app. Display configurable options related to a number of episodes. '%1$@' is a placeholder for the number of episodes, the value will be more than one.
  internal static func episodeCountPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "episode_count_plural_format", String(describing: p1), fallback: "%1$@ episodes")
  }
  /// Label for adding duration filtering to an episode filter, eg: filter by the duration of an episode
  internal static var episodeFilterByDurationLabel: String { return L10n.tr("Localizable", "episode_filter_by_duration_label", fallback: "Filter by duration") }
  /// Message shown when you have no episodes in an episode filter
  internal static var episodeFilterNoEpisodesMsg: String { return L10n.tr("Localizable", "episode_filter_no_episodes_msg", fallback: "Either it's time to celebrate completing this list, or edit your filter settings to get some more.") }
  /// Title shown when you have no episodes in an episode filter
  internal static var episodeFilterNoEpisodesTitle: String { return L10n.tr("Localizable", "episode_filter_no_episodes_title", fallback: "No Episodes") }
  /// Episode indicator that the current episode is a bonus episode.
  internal static var episodeIndicatorBonus: String { return L10n.tr("Localizable", "episode_indicator_bonus", fallback: "Bonus") }
  /// Episode indicator that the current episode is a trailer for an upcoming season of the podcast. '%1$@' is a placeholder for the season number.
  internal static func episodeIndicatorSeasonTrailer(_ p1: Any) -> String {
    return L10n.tr("Localizable", "episode_indicator_season_trailer", String(describing: p1), fallback: "Season %1$@ Trailer")
  }
  /// Episode indicator that the current episode is a trailer.
  internal static var episodeIndicatorTrailer: String { return L10n.tr("Localizable", "episode_indicator_trailer", fallback: "Trailer") }
  /// Shorthand format used to show the Episode number of a podcast. '%1$@' is a placeholder for the episode number.
  internal static func episodeShorthandFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "episode_shorthand_format", String(describing: p1), fallback: "EPISODE %1$@")
  }
  /// Shorthand format used to show the Episode number of a podcast. 'EP' is short for Episode. '%1$@' is a placeholder for the episode number.
  internal static func episodeShorthandFormatShort(_ p1: Any) -> String {
    return L10n.tr("Localizable", "episode_shorthand_format_short", String(describing: p1), fallback: "EP %1$@")
  }
  /// A common string used throughout the app. Generic title informing the user of an Error. Accompanied with an error message.
  internal static var error: String { return L10n.tr("Localizable", "error", fallback: "Error") }
  /// A common string used throughout the app. Generic title informing the user of an Error. General error message used when the app is unable to locate the podcast that was selected. This usually comes from a sharing or import feature.
  internal static var errorGeneralPodcastNotFound: String { return L10n.tr("Localizable", "error_general_podcast_not_found", fallback: "Unable to find podcast. Please contact the podcast author.") }
  /// Describes how the process to export podcasts from Pocket Casts works.
  internal static var exportPodcastsDescription: String { return L10n.tr("Localizable", "export_podcasts_description", fallback: "Exports all your podcasts as an OPML file, which you can import into other podcast apps.") }
  /// Title for the button that allows the user to export podcasts from Pocket Casts
  internal static var exportPodcastsOption: String { return L10n.tr("Localizable", "export_podcasts_option", fallback: "Export Podcasts") }
  /// Title for the section that provides information on how to export podcasts from Pocket Casts
  internal static var exportPodcastsTitle: String { return L10n.tr("Localizable", "export_podcasts_title", fallback: "EXPORT") }
  /// Indicator during the new feature tour serves as a prompt to end the tour.
  internal static var featureTourEndTour: String { return L10n.tr("Localizable", "feature_tour_end_tour", fallback: "End Tour") }
  /// Indicator during the new feature tour. Used as a navigation indicator when the tour is on the first step. This is replaced with 'position of total' as the user progresses.
  internal static var featureTourNew: String { return L10n.tr("Localizable", "feature_tour_new", fallback: "NEW") }
  /// Indicator during the new feature tour. Used as a navigation indicator as the user progresses through the tour. '%1$@' is a placeholder for the current position. '%2$@' is a placeholder for the total number of steps.
  internal static func featureTourStepFormat(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "feature_tour_step_format", String(describing: p1), String(describing: p2), fallback: "%1$@ of %2$@")
  }
  /// Option to continue with a Third-Party Mail app when the default Apple mail app isn't available.
  internal static var feedbackContinueWithMail: String { return L10n.tr("Localizable", "feedback_continue_with_mail", fallback: "Open Default Mail App") }
  /// Error message for when the user has a mail app configured that's not the default mail app.
  internal static var feedbackMailNotConfiguredMsg: String { return L10n.tr("Localizable", "feedback_mail_not_configured_msg", fallback: "To send a debug attachment, the Apple Mail app has to be configured on your phone. What would you like to do?") }
  /// Error title for when the user has a mail app configured that's not the default mail app.
  internal static var feedbackMailNotConfiguredTitle: String { return L10n.tr("Localizable", "feedback_mail_not_configured_title", fallback: "Mail Not Configured") }
  /// Title for the file upload settings screen. This is used when a user is uploading a new file.
  internal static var fileUploadAddFile: String { return L10n.tr("Localizable", "file_upload_add_file", fallback: "Add File") }
  /// Prompt to add a custom image to the uploaded file.
  internal static var fileUploadAddImage: String { return L10n.tr("Localizable", "file_upload_add_image", fallback: "Add Custom Image") }
  /// Title for the dialog that allows the user to pick the image source for selecting a custom image. either Camera or Photo Library.
  internal static var fileUploadChooseImage: String { return L10n.tr("Localizable", "file_upload_choose_image", fallback: "Choose Image") }
  /// Option for selecting the image source for an uploaded image.
  internal static var fileUploadChooseImageCamera: String { return L10n.tr("Localizable", "file_upload_choose_image_camera", fallback: "Camera") }
  /// Option for selecting the image source for an uploaded image.
  internal static var fileUploadChooseImagePhotoLibrary: String { return L10n.tr("Localizable", "file_upload_choose_image_photo_Library", fallback: "Photo Library") }
  /// Title for the file upload settings screen. This is used when a user is editing an uploaded file.
  internal static var fileUploadEditFile: String { return L10n.tr("Localizable", "file_upload_edit_file", fallback: "Edit File") }
  /// Error message displayed when the user has used all of their storage space.
  internal static var fileUploadError: String { return L10n.tr("Localizable", "file_upload_error", fallback: "Not enough space to upload this file.") }
  /// Subtitle for the error message displayed when the user has used all of their storage space. Instructs the user to try freeing up space.
  internal static var fileUploadErrorSubtitle: String { return L10n.tr("Localizable", "file_upload_error_subtitle", fallback: "Remove some files and try again.") }
  /// Prompt indicating that the user needs to name the file in order to upload it.
  internal static var fileUploadNameRequired: String { return L10n.tr("Localizable", "file_upload_name_required", fallback: "Name required") }
  /// The description for the screen when there are no files currently uploaded. '
  /// ' is a line break format to allow a clean wrapping of text
  internal static var fileUploadNoFilesDescription: String { return L10n.tr("Localizable", "file_upload_no_files_description", fallback: "Want to listen to your own files?\nShare them with Pocket Casts, and they’ll appear here") }
  /// The helper link describing how to add files to Pocket Casts.
  internal static var fileUploadNoFilesHelper: String { return L10n.tr("Localizable", "file_upload_no_files_helper", fallback: "How do I do that?") }
  /// Title for the screen when there are no files currently uploaded
  internal static var fileUploadNoFilesTitle: String { return L10n.tr("Localizable", "file_upload_no_files_title", fallback: "No Files") }
  /// Prompt to remove the image from the uploaded file.
  internal static var fileUploadRemoveImage: String { return L10n.tr("Localizable", "file_upload_remove_image", fallback: "Remove Image") }
  /// Prompt to save the changes to an edited file.
  internal static var fileUploadSave: String { return L10n.tr("Localizable", "file_upload_save", fallback: "Save") }
  /// Error message displayed when the user has attempted to upload an unsupported file type.
  internal static var fileUploadSupportError: String { return L10n.tr("Localizable", "file_upload_support_error", fallback: "This file type is not supported") }
  /// A common string used throughout the app. Refers to the Files settings menu
  internal static var files: String { return L10n.tr("Localizable", "files", fallback: "Files") }
  /// Title for the screen that details how to add a file to Pocket Casts.
  internal static var filesHowToTitle: String { return L10n.tr("Localizable", "files_how_to_title", fallback: "How to save a file") }
  /// Prompt to open a menu to allow sorting of manually added files.
  internal static var filesSort: String { return L10n.tr("Localizable", "files_sort", fallback: "Sort Files") }
  /// Subtitle informing the user that new podcasts will be automatically added to this filter.
  internal static var filterAutoAddSubtitle: String { return L10n.tr("Localizable", "filter_auto_add_subtitle", fallback: "New podcasts you subscribe to will be automatically added") }
  /// Title for the filter option that indicates all podcasts will be included.
  internal static var filterChipsAllPodcasts: String { return L10n.tr("Localizable", "filter_chips_all_podcasts", fallback: "All Your Podcasts") }
  /// Title for the filter option that that opens the episode duration options.
  internal static var filterChipsDuration: String { return L10n.tr("Localizable", "filter_chips_duration", fallback: "Duration") }
  /// Filter option to select podcasts that will be included in the filter.
  internal static var filterChoosePodcasts: String { return L10n.tr("Localizable", "filter_choose_podcasts", fallback: "Choose Podcasts") }
  /// Used on the screen to create a new filter. Provides a prompt to continue refining the filter selections.
  internal static var filterCreateAddMore: String { return L10n.tr("Localizable", "filter_create_add_more", fallback: "Add more criteria to finish refining your filter.") }
  /// Used on the screen to create a new filter. The section header for the list of options to use with the filter.
  internal static var filterCreateFilterBy: String { return L10n.tr("Localizable", "filter_create_filter_by", fallback: "FILTER BY") }
  /// Used on the screen to create a new filter. Provides instructions on how to set up a new filter.
  internal static var filterCreateInstructions: String { return L10n.tr("Localizable", "filter_create_instructions", fallback: "Select your filter criteria using these buttons to create an up to date smart playlist of episodes.") }
  /// Used on the screen to create a new filter. Title for the state where their selection doesn't include any content.
  internal static var filterCreateNoEpisodes: String { return L10n.tr("Localizable", "filter_create_no_episodes", fallback: "No Matching Episodes") }
  /// Used on the screen to create a new filter. The description about why the list of filtered episodes is empty.
  internal static var filterCreateNoEpisodesDescriptionExplanation: String { return L10n.tr("Localizable", "filter_create_no_episodes_description_explanation", fallback: "The criteria you selected doesn’t match any current episodes in your subscriptions") }
  /// Used on the screen to create a new filter. The prompt about what they can do in order to make sure their filter returns results.
  internal static var filterCreateNoEpisodesDescriptionPrompt: String { return L10n.tr("Localizable", "filter_create_no_episodes_description_prompt", fallback: "Choose different criteria, or save this filter if you think it will match episodes in the future.") }
  /// Used on the screen to create a new filter. Title for the toggle to include all podcasts in the filter.
  internal static var filterCreatePodcastsAllPodcasts: String { return L10n.tr("Localizable", "filter_create_podcasts_all_podcasts", fallback: "All Podcasts") }
  /// Used on the screen to create a new filter. The section that shows a preview of waht podcast episodes will be included in the filter.
  internal static var filterCreatePreview: String { return L10n.tr("Localizable", "filter_create_preview", fallback: "PREVIEW") }
  /// Used on the screen to create a new filter. Title for the button to save the filter.
  internal static var filterCreateSave: String { return L10n.tr("Localizable", "filter_create_save", fallback: "Save Filter") }
  /// Title for the screen where a user can set the initial details for a new filter.
  internal static var filterDetails: String { return L10n.tr("Localizable", "filter_details", fallback: "Filter Details") }
  /// Hint text above the sections for the user to select the filter color and icon.
  internal static var filterDetailsColorIcon: String { return L10n.tr("Localizable", "filter_details_color_icon", fallback: "COLOUR & ICON") }
  /// Accessibility hint text for color selection on filters.
  internal static var filterDetailsColorSelection: String { return L10n.tr("Localizable", "filter_details_color_selection", fallback: "Colour Selector") }
  /// Accessibility hint text for icon selection on filters.
  internal static var filterDetailsIconSelection: String { return L10n.tr("Localizable", "filter_details_icon_selection", fallback: "Icon Selector") }
  /// Hint text above the dialog box to enter the filter's name.
  internal static var filterDetailsName: String { return L10n.tr("Localizable", "filter_details_name", fallback: "NAME") }
  /// Title for filter options related to Download Status.
  internal static var filterDownloadStatus: String { return L10n.tr("Localizable", "filter_download_status", fallback: "Download Status") }
  /// Title for filter sections that relate to episode status.
  internal static var filterEpisodeStatus: String { return L10n.tr("Localizable", "filter_episode_status", fallback: "Episode Status") }
  /// Label for the longer than duration filter time
  internal static var filterLongerThanLabel: String { return L10n.tr("Localizable", "filter_longer_than_label", fallback: "Longer than") }
  /// Subtitle informing the user that new podcasts will not be automatically added to this filter.
  internal static var filterManualAddSubtitle: String { return L10n.tr("Localizable", "filter_manual_add_subtitle", fallback: "New podcasts you subscribe to will not be automatically added") }
  /// Title for filter options related to media type settings.
  internal static var filterMediaType: String { return L10n.tr("Localizable", "filter_media_type", fallback: "Media Type") }
  /// Media Type filter option for audio media types.
  internal static var filterMediaTypeAudio: String { return L10n.tr("Localizable", "filter_media_type_audio", fallback: "Audio") }
  /// Media Type filter option for video media types.
  internal static var filterMediaTypeVideo: String { return L10n.tr("Localizable", "filter_media_type_video", fallback: "Video") }
  /// Screen title for the filter options for configuring filter settings related to episode duration.
  internal static var filterOptionEpisodeDuration: String { return L10n.tr("Localizable", "filter_option_episode_duration", fallback: "Episode Duration") }
  /// Error message for when the user attempts to set a filter where the minimal duration is higher than the max duration. Meant to be a fun/funny message. '%1$@' and '%2$@' are placeholders for the configured minimum and maximum times, respectively.
  internal static func filterOptionEpisodeDurationErrorMsgFormat(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "filter_option_episode_duration_error_msg_format", String(describing: p1), String(describing: p2), fallback: "Filtering for episodes longer than %1$@ but shorter than %2$@ would cause a rift in our space time continuum. Sorry.")
  }
  /// Error title for when the user attempts to set a filter where the minimal duration is higher than the max duration. Meant to be a fun/funny message.
  internal static var filterOptionEpisodeDurationErrorTitle: String { return L10n.tr("Localizable", "filter_option_episode_duration_error_title", fallback: "Yes, But No") }
  /// Menu prompt to open the Filter options. Also used for the title of the filter options screen.
  internal static var filterOptions: String { return L10n.tr("Localizable", "filter_options", fallback: "Filter Options") }
  /// Title for filter options related to release date settings.
  internal static var filterReleaseDate: String { return L10n.tr("Localizable", "filter_release_date", fallback: "Release Date") }
  /// Release Date filter option for any release date.
  internal static var filterReleaseDateAnytime: String { return L10n.tr("Localizable", "filter_release_date_anytime", fallback: "Any time") }
  /// Release Date filter option for episodes with a release date with in the last day.
  internal static var filterReleaseDateLast24Hours: String { return L10n.tr("Localizable", "filter_release_date_last_24_hours", fallback: "Last 24 hours") }
  /// Release Date filter option for episodes with a release date with in the last 2 weeks.
  internal static var filterReleaseDateLast2Weeks: String { return L10n.tr("Localizable", "filter_release_date_last_2_weeks", fallback: "Last 2 weeks") }
  /// Release Date filter option for episodes with a release date with in the last three day.
  internal static var filterReleaseDateLast3Days: String { return L10n.tr("Localizable", "filter_release_date_last_3_days", fallback: "Last 3 days") }
  /// Release Date filter option for episodes with a release date with in the last month.
  internal static var filterReleaseDateLastMonth: String { return L10n.tr("Localizable", "filter_release_date_last_month", fallback: "Last month") }
  /// Release Date filter option for episodes with a release date with in the last week.
  internal static var filterReleaseDateLastWeek: String { return L10n.tr("Localizable", "filter_release_date_last_week", fallback: "Last week") }
  /// Label for the shorter than duration filter time
  internal static var filterShorterThanLabel: String { return L10n.tr("Localizable", "filter_shorter_than_label", fallback: "Shorter than") }
  /// Prompt to save the changes to an existing filter.
  internal static var filterUpdate: String { return L10n.tr("Localizable", "filter_update", fallback: "Update Filter") }
  /// A common string used throughout the app. Filter option for the default setting on multiple filters.
  internal static var filterValueAll: String { return L10n.tr("Localizable", "filter_value_all", fallback: "All") }
  /// A common string used throughout the app. Often refers to the Filters screen.
  internal static var filters: String { return L10n.tr("Localizable", "filters", fallback: "Filters") }
  /// A placeholder title for a newly created filter.
  internal static var filtersDefaultNewFilter: String { return L10n.tr("Localizable", "filters_default_new_filter", fallback: "New Filter") }
  /// The title for the auto generated 'New Release' filter.
  internal static var filtersDefaultNewReleases: String { return L10n.tr("Localizable", "filters_default_new_releases", fallback: "New Releases") }
  /// Button title for adding a new filter.
  internal static var filtersNewFilterButton: String { return L10n.tr("Localizable", "filters_new_filter_button", fallback: "+ New Filter") }
  /// Common word used as in the app to denote a folder of items
  internal static var folder: String { return L10n.tr("Localizable", "folder", fallback: "Folder") }
  /// A common string used throughout the app. Informs the user how many podcasts are being added. '%1$@' is a placeholder for the number of podcasts, this will be more than one.
  internal static func folderAddPodcastsPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "folder_add_podcasts_plural_format", String(describing: p1), fallback: "Add %1$@ Podcasts")
  }
  /// A common string used throughout the app. Informs the user how many podcasts have been chosen. This is the singular format for an accompanying plural option.
  internal static var folderAddPodcastsSingular: String { return L10n.tr("Localizable", "folder_add_podcasts_singular", fallback: "Add 1 Podcast") }
  /// Label for the option to add and remove podcasts from a folder
  internal static var folderAddRemovePodcasts: String { return L10n.tr("Localizable", "folder_add_remove_podcasts", fallback: "Add or Remove Podcasts") }
  /// Text shown on button to change the folder a podcast is in
  internal static var folderChange: String { return L10n.tr("Localizable", "folder_change", fallback: "Change folder") }
  /// Prompt to choose a folder color
  internal static var folderChooseColor: String { return L10n.tr("Localizable", "folder_choose_color", fallback: "Choose a color") }
  /// Title for the page where you select which podcasts are in a folder
  internal static var folderChoosePodcasts: String { return L10n.tr("Localizable", "folder_choose_podcasts", fallback: "Choose Podcasts") }
  /// Reason shown below a color picker for folders
  internal static var folderColorDetail: String { return L10n.tr("Localizable", "folder_color_detail", fallback: "Makes it easier to find folders") }
  /// Title for the create folder page
  internal static var folderCreate: String { return L10n.tr("Localizable", "folder_create", fallback: "Create Folder") }
  /// Voiceover label for creating a new folder
  internal static var folderCreateNew: String { return L10n.tr("Localizable", "folder_create_new", fallback: "Create New Folder") }
  /// Label for the delete folder button
  internal static var folderDelete: String { return L10n.tr("Localizable", "folder_delete", fallback: "Delete Folder") }
  /// Confirmation prompt message after you try to delete a folder
  internal static var folderDeletePromptMsg: String { return L10n.tr("Localizable", "folder_delete_prompt_msg", fallback: "This folder will be deleted, and its contents will be moved back to the Podcasts screen.") }
  /// Confirmation prompt title after you try to delete a folder
  internal static var folderDeletePromptTitle: String { return L10n.tr("Localizable", "folder_delete_prompt_title", fallback: "Are You Sure?") }
  /// Label for the option that lets you edit a folder
  internal static var folderEdit: String { return L10n.tr("Localizable", "folder_edit", fallback: "Edit Folder") }
  /// Description shown under the title of an empty folder
  internal static var folderEmptyDescription: String { return L10n.tr("Localizable", "folder_empty_description", fallback: "Add podcasts to your folder and they’ll appear here.") }
  /// Title shown in an empty folder
  internal static var folderEmptyTitle: String { return L10n.tr("Localizable", "folder_empty_title", fallback: "Your folder is empty") }
  /// Text shown on button to go to the folder a podcast is in
  internal static var folderGoTo: String { return L10n.tr("Localizable", "folder_go_to", fallback: "Go to folder") }
  /// Placeholder text in the field asking you to name a folder
  internal static var folderName: String { return L10n.tr("Localizable", "folder_name", fallback: "Folder name") }
  /// Title for the folder name page
  internal static var folderNameTitle: String { return L10n.tr("Localizable", "folder_name_title", fallback: "Name your folder") }
  /// Label for the button to create a new folder
  internal static var folderNew: String { return L10n.tr("Localizable", "folder_new", fallback: "New Folder") }
  /// Title shown for podcasts that aren't in a folder
  internal static var folderNoFolder: String { return L10n.tr("Localizable", "folder_no_folder", fallback: "No Folder") }
  /// Title for the page where you select which folder a podcast is in
  internal static var folderPodcastChooseFolder: String { return L10n.tr("Localizable", "folder_podcast_choose_folder", fallback: "Choose Folder") }
  /// Text shown on button to remove a podcast from a folder
  internal static var folderRemoveFrom: String { return L10n.tr("Localizable", "folder_remove_from", fallback: "Remove from folder") }
  /// Shown on a button to save the folder
  internal static var folderSaveFolder: String { return L10n.tr("Localizable", "folder_save_folder", fallback: "Save Folder") }
  /// Name shown for folders that don't have names
  internal static var folderUnnamed: String { return L10n.tr("Localizable", "folder_unnamed", fallback: "Unnamed Folder") }
  /// Common word used as in the app to denote the folders feature
  internal static var folders: String { return L10n.tr("Localizable", "folders", fallback: "Folders") }
  /// Upsell dialog free trial detail label that informs the user that they no payment is needed, and can cancel at anytime
  internal static var freeTrialDetailLabel: String { return L10n.tr("Localizable", "free_trial_detail_label", fallback: "No Payment Now – Cancel Anytime") }
  /// Free trial duration with the word free emphasized, %1$@ is the localize trial duration (1 month)
  internal static func freeTrialDurationFree(_ p1: Any) -> String {
    return L10n.tr("Localizable", "free_trial_duration_free", String(describing: p1), fallback: "%1$@ FREE")
  }
  /// Free trial terms where %1$@ refers to the trial duration (30 days) and %2$@ is the price after the trial ($0.99 / month)
  internal static func freeTrialPricingTerms(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "free_trial_pricing_terms", String(describing: p1), String(describing: p2), fallback: "%1$@ free then %2$@")
  }
  /// Upsell dialog confirmation button title when a free trial is active
  internal static var freeTrialStartButton: String { return L10n.tr("Localizable", "free_trial_start_button", fallback: "Start Free Trial") }
  /// Upsell dialog title label when a free trial is active, %1$@ refers to the duration of the trial (1 month)
  internal static func freeTrialTitleLabel(_ p1: Any) -> String {
    return L10n.tr("Localizable", "free_trial_title_label", String(describing: p1), fallback: "Try Plus with %1$@ free")
  }
  /// Funny confirmation message accompanying several descriptive dialogs
  internal static var funnyConfMsg: String { return L10n.tr("Localizable", "funny_conf_msg", fallback: "It really matches your eyes ✨") }
  /// The default value when the user has listened for under one minute.
  internal static var funnyTimeNotEnough: String { return L10n.tr("Localizable", "funny_time_not_enough", fallback: "You really don't listen much, do you?") }
  /// A funny time unit used in stats comparing the listening time to the number of times an airplane has taken off. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitAirplaneTakeoffs(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_airplane_takeoffs", String(describing: p1), fallback: "During which time %1$@ planes took off. Please fasten your seatbelt. 🛫")
  }
  /// A funny time unit used in stats comparing the listening time to the number of times an astronaut has sneezed. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitAstronautSneezes(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_astronaut_sneezes", String(describing: p1), fallback: "During which time an astronaut sneezed %1$@ times. Achoo! 😤")
  }
  /// A funny time unit used in stats comparing the listening time to the number of times you could have traveled around the world. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitBalloonTravel(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_balloon_travel", String(describing: p1), fallback: "During which time you could have gone around the world %1$@ times in an air balloon. 🌏")
  }
  /// A funny time unit used in stats comparing the listening time to the number of births that have happened. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitBirths(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_births", String(describing: p1), fallback: "During which time %1$@ babies were born. Wahhh! 🍼")
  }
  /// A funny time unit used in stats comparing the listening time to the number of times you've blinked. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitBlinks(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_blinks", String(describing: p1), fallback: "During which time you blinked %1$@ times. Heyooo! 👀")
  }
  /// A funny time unit used in stats comparing the listening time to the number of emails that have been sent. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitEmails(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_emails", String(describing: p1), fallback: "During which time %1$@ emails were sent. 💌")
  }
  /// A funny time unit used in stats comparing the listening time to the number of times you farted. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitFarts(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_farts", String(describing: p1), fallback: "During which time you released %1$@ oz of air biscuits. Gross! 💨")
  }
  /// A funny time unit used in stats comparing the listening time to the number of times a Google search was performed. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitGoogle(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_google", String(describing: p1), fallback: "During which time %1$@ Google searches were performed. Bazinga. 🔎")
  }
  /// A funny time unit used in stats comparing the listening time to the number of times lightning has struck. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitLightning(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_lightning", String(describing: p1), fallback: "During which time lightning struck %1$@ times. Boom. ⚡️")
  }
  /// A funny time unit used in stats comparing the listening time to the number of phones that have been produced. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitPhoneProduction(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_phone_production", String(describing: p1), fallback: "During which time a certain fruit vendor made $%1$@ 🍏")
  }
  /// A funny time unit used in stats comparing the listening time to the amount of skin cells you've shed. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitShedSkin(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_shed_skin", String(describing: p1), fallback: "During which time you shed %1$@ skin cells. Ew? 😅")
  }
  /// A funny time unit used in stats comparing the listening time to the number of times you tied your shoes. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitTiedShoes(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_tied_shoes", String(describing: p1), fallback: "During which time you could have tied %1$@ shoe laces. Maybe. 👟")
  }
  /// A funny time unit used in stats comparing the listening time to the number of tweets that have been sent. '%1$@' is a placeholder for the amount of time listened compared to the stat.
  internal static func funnyTimeUnitTweets(_ p1: Any) -> String {
    return L10n.tr("Localizable", "funny_time_unit_tweets", String(describing: p1), fallback: "During which time %1$@ tweets were tooted. Toot! Toot! 🐣")
  }
  /// A common string used throughout the app. Title for the prompt to navigate the user to the podcast associated to the selected item.
  internal static var goToPodcast: String { return L10n.tr("Localizable", "go_to_podcast", fallback: "Go to Podcast") }
  /// A common string used throughout the app. Title accompanying the group option setting.
  internal static var groupEpisodes: String { return L10n.tr("Localizable", "group_episodes", fallback: "Group Episodes") }
  /// Prompt to clear the full listening history for the user.
  internal static var historyClearAll: String { return L10n.tr("Localizable", "history_clear_all", fallback: "Clear All") }
  /// Title for the details prompt to confirm the user wants to clear their listening history.
  internal static var historyClearAllDetails: String { return L10n.tr("Localizable", "history_clear_all_details", fallback: "Clear Listening History") }
  /// Message for the details prompt to confirm the user wants to clear their listening history.
  internal static var historyClearAllDetailsMsg: String { return L10n.tr("Localizable", "history_clear_all_details_msg", fallback: "This action cannot be undone.") }
  /// Label shown for hours listened when it's singular, eg: 1 hour listened.
  internal static var hourListened: String { return L10n.tr("Localizable", "hour_listened", fallback: "Hour listened") }
  /// Label shown for hours saved when it's singular, eg: 1 hour saved.
  internal static var hourSaved: String { return L10n.tr("Localizable", "hour_saved", fallback: "Hour saved") }
  /// Label shown for hours listened when it's plural, eg: 1 hours listened.
  internal static var hoursListened: String { return L10n.tr("Localizable", "hours_listened", fallback: "Hours listened") }
  /// Time format to display a set number of hours. '%1$@' is a placeholder for a number of hours, this value will be more than one.
  internal static func hoursPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "hours_plural_format", String(describing: p1), fallback: "%1$@ hours")
  }
  /// Label shown for hours saved when it's plural, eg: 1 hours saved.
  internal static var hoursSaved: String { return L10n.tr("Localizable", "hours_saved", fallback: "Hours saved") }
  /// The initial informational text explaining how to upload a file
  internal static var howToUploadExplanation: String { return L10n.tr("Localizable", "how_to_upload_explanation", fallback: "First, open an app that has the audio files you'd like to save") }
  /// The title for the first instructional image that explains how to upload a file
  internal static var howToUploadFirstInstruction: String { return L10n.tr("Localizable", "how_to_upload_first_instruction", fallback: "Choose to share that file") }
  /// The title for the second instructional image that explains how to upload a file
  internal static var howToUploadSecondInstruction: String { return L10n.tr("Localizable", "how_to_upload_second_instruction", fallback: "In the menu tap \"Copy to Pocket Casts\"") }
  /// The summary text at the end of the screen explaining how to upload a file
  internal static var howToUploadSummary: String { return L10n.tr("Localizable", "how_to_upload_summary", fallback: "That's it, you're done. Change any details you want, hit save and play!") }
  /// Describes the process about how to import podcasts to Pocket Casts. '\
  /// \
  /// ' Is a line break format to separate the description from the following note.
  internal static var importPodcastsDescription: String { return L10n.tr("Localizable", "import_podcasts_description", fallback: "You can import your podcasts subscriptions to Pocket Casts using the widely supported OPML format. Export the file from another app and choose open in Pocket Casts.\n\nNote: You may need to email the OPML file to yourself, long press on the attachment and select Pocket Casts.") }
  /// Title for the section that provides information on how to import podcasts to Pocket Casts
  internal static var importPodcastsTitle: String { return L10n.tr("Localizable", "import_podcasts_title", fallback: "IMPORT TO POCKET CASTS") }
  /// A common string used throughout the app. Status message informing the user that the episode has been started but not finished.
  internal static var inProgress: String { return L10n.tr("Localizable", "in_progress", fallback: "In Progress") }
  /// Title for the hardware keyboard command that closes the player.
  internal static var keycommandClosePlayer: String { return L10n.tr("Localizable", "keycommand_close_player", fallback: "Close Player") }
  /// Title for the hardware keyboard command that decreases the playback speed.
  internal static var keycommandDecreaseSpeed: String { return L10n.tr("Localizable", "keycommand_decrease_speed", fallback: "Decrease Speed") }
  /// Title for the hardware keyboard command that increases the playback speed.
  internal static var keycommandIncreaseSpeed: String { return L10n.tr("Localizable", "keycommand_increase_speed", fallback: "Increase Speed") }
  /// Title for the hardware keyboard command that opens the player.
  internal static var keycommandOpenPlayer: String { return L10n.tr("Localizable", "keycommand_open_player", fallback: "Open Player") }
  /// Title for the hardware keyboard command that toggles play and pause of playback.
  internal static var keycommandPlayPause: String { return L10n.tr("Localizable", "keycommand_play_pause", fallback: "Play/Pause") }
  /// Text for a button where you learn more about a feature
  internal static var learnMore: String { return L10n.tr("Localizable", "learn_more", fallback: "Learn More") }
  /// A common string used throughout the app. Often refers to the Listening History screen.
  internal static var listeningHistory: String { return L10n.tr("Localizable", "listening_history", fallback: "Listening History") }
  /// Progress indicator informing the user that the selected item is still loading.
  internal static var loading: String { return L10n.tr("Localizable", "loading", fallback: "Loading...") }
  /// A common string used throughout the app. Prompt to mark the selected item(s) as played.
  internal static var markPlayed: String { return L10n.tr("Localizable", "mark_played", fallback: "Mark as Played") }
  /// A common string used throughout the app. Prompt to mark the selected item(s) as played. Similar to 'Mark as Played' but more concise.
  internal static var markPlayedShort: String { return L10n.tr("Localizable", "mark_played_short", fallback: "Mark Played") }
  /// A common string used throughout the app. Prompt to mark the selected item(s) as not played.
  internal static var markUnplayedShort: String { return L10n.tr("Localizable", "mark_unplayed_short", fallback: "Mark Unplayed") }
  /// Prompt to close the mini player and clear the queue.
  internal static var miniPlayerClose: String { return L10n.tr("Localizable", "mini_player_close", fallback: "Close And Clear Up Next") }
  /// Label shown for minutes listened when it's singular, eg: 1 minute listened.
  internal static var minuteListened: String { return L10n.tr("Localizable", "minute_listened", fallback: "Minute listened") }
  /// Label shown for minutes saved when it's singular, eg: 1 minute saved.
  internal static var minuteSaved: String { return L10n.tr("Localizable", "minute_saved", fallback: "Minute saved") }
  /// Label shown for minutes listened when it's plural, eg: 2 minutes listened.
  internal static var minutesListened: String { return L10n.tr("Localizable", "minutes_listened", fallback: "Minutes listened") }
  /// Label shown for minutes saved when it's plural, eg: 2 minutes saved.
  internal static var minutesSaved: String { return L10n.tr("Localizable", "minutes_saved", fallback: "Minutes saved") }
  /// Basic string used in formats like 'price / month'
  internal static var month: String { return L10n.tr("Localizable", "month", fallback: "month") }
  /// Basic string used to callout payment intervals like yearly vs monthly
  internal static var monthly: String { return L10n.tr("Localizable", "monthly", fallback: "Monthly") }
  /// A common string used throughout the app. Prompt to move the selected item(s) to the end of the up next queue.
  internal static var moveToBottom: String { return L10n.tr("Localizable", "move_to_bottom", fallback: "Move to Bottom") }
  /// A common string used throughout the app. Prompt to move the selected item(s) to the top of the up next queue.
  internal static var moveToTop: String { return L10n.tr("Localizable", "move_to_top", fallback: "Move to Top") }
  /// Multi-select status message for adding multiple episodes. Notifies that the selected list exceeds the bulk limit so only the first set up to the limit will be added. '%1$@' is a placeholder for the max amount of episodes to add.
  internal static func multiSelectAddEpisodesMaxFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_add_episodes_max_format", String(describing: p1), fallback: "Adding max %1$@ episodes.")
  }
  /// Multi-select status message for adding multiple episodes. '%1$@' is a placeholder for the amount of episodes to add.
  internal static func multiSelectAddingEpisodesPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_adding_episodes_plural_format", String(describing: p1), fallback: "Adding %1$@ episodes.")
  }
  /// Multi-select status message for adding an episode. '%1$@' is a placeholder for the amount of episodes to add.
  internal static var multiSelectAddingEpisodesSingular: String { return L10n.tr("Localizable", "multi_select_adding_episodes_singular", fallback: "Adding 1 episode.") }
  /// Multi-select status message for archiving multiple episodes. '%1$@' is a placeholder for the count of files to be archived (the number will be more than one).
  internal static func multiSelectArchivingEpisodesPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_archiving_episodes_plural_format", String(describing: p1), fallback: "Archiving %1$@ episodes")
  }
  /// Multi-select status message for archiving one episode.
  internal static var multiSelectArchivingEpisodesSingular: String { return L10n.tr("Localizable", "multi_select_archiving_episodes_singular", fallback: "Archiving 1 episode") }
  /// Message portion of the prompt to delete the selected files on the multi select UI. '%1$@' is a placeholder for the count of files to be deleted (the number will be more than one).
  internal static func multiSelectDeleteFileMessagePlural(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_delete_file_message_plural", String(describing: p1), fallback: "Are you sure you want to delete %1$@ files?")
  }
  /// Message portion of the prompt to delete a selected file on the multi select UI.
  internal static var multiSelectDeleteFileMessageSingular: String { return L10n.tr("Localizable", "multi_select_delete_file_message_singular", fallback: "Are you sure you want to delete 1 file?") }
  /// Multi-select status message informing the user that downloads have begun. '%1$@' is a placeholder for the count of the selected items being downloaded.
  internal static func multiSelectDownloadingEpisodesFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_downloading_episodes_format", String(describing: p1), fallback: "Downloading %1$@")
  }
  /// Multi-select status message for marking multiple episodes as played. '%1$@' is a placeholder for the count of episodes to be marked played (the number will be more than one).
  internal static func multiSelectMarkEpisodesPlayedPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_mark_episodes_played_plural_format", String(describing: p1), fallback: "Marking %1$@ episodes as played.")
  }
  /// Multi-select status message for marking one episode as played.
  internal static var multiSelectMarkEpisodesPlayedSingular: String { return L10n.tr("Localizable", "multi_select_mark_episodes_played_singular", fallback: "Marking 1 episode as played.") }
  /// Multi-select status message for marking multiple episodes as not played. '%1$@' is a placeholder for the count of episodes to be marked not played (the number will be more than one).
  internal static func multiSelectMarkEpisodesUnplayedPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_mark_episodes_unplayed_plural_format", String(describing: p1), fallback: "Marking %1$@ episodes as unplayed.")
  }
  /// Multi-select status message for marking one episode as not played.
  internal static var multiSelectMarkEpisodesUnplayedSingular: String { return L10n.tr("Localizable", "multi_select_mark_episodes_unplayed_singular", fallback: "Marking 1 episode as unplayed.") }
  /// Multi-select status message informing the user how many episodes have been queued for download. '%1$@' is a placeholder for the count of the selected items be queued for download.
  internal static func multiSelectQueuingEpisodesFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_queuing_episodes_format", String(describing: p1), fallback: "Queuing %1$@")
  }
  /// Multi-select status message informing the user one episode download is being removed.
  internal static var multiSelectRemoveDownloadSingular: String { return L10n.tr("Localizable", "multi_select_remove_download_singular", fallback: "Removing 1 download.") }
  /// Multi-select status message informing the user how many episodes downloads are being removed. '%1$@' is a placeholder for the count of the selected items be removed for download.
  internal static func multiSelectRemoveDownloadsPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_remove_downloads_plural_format", String(describing: p1), fallback: "Removing %1$@ downloads.")
  }
  /// Title for the prompt to mark the selected items as not having been played.
  internal static var multiSelectRemoveMarkUnplayed: String { return L10n.tr("Localizable", "multi_select_remove_mark_unplayed", fallback: "Mark as Unplayed") }
  /// Multi-select label indicating the number of selected items. '%1$@' is a placeholder for the number of selected items, this will be more than one.
  internal static func multiSelectSelectedCountPlural(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_selected_count_plural", String(describing: p1), fallback: "%1$@ SELECTED EPISODES")
  }
  /// Multi-select label indicating that there is one item selected.
  internal static var multiSelectSelectedCountSingular: String { return L10n.tr("Localizable", "multi_select_selected_count_singular", fallback: "1 SELECTED EPISODE") }
  /// Multi-select menu section header. Indicates that the options in this section will appear in the action bar.
  internal static var multiSelectShortcutInActionBar: String { return L10n.tr("Localizable", "multi_select_shortcut_in_action_bar", fallback: "SHORTCUT IN ACTION BAR") }
  /// Title for the prompt to mark the selected items as stared (favorited).
  internal static var multiSelectStar: String { return L10n.tr("Localizable", "multi_select_star", fallback: "Star Episodes") }
  /// Multi-select status message for marking multiple episodes as favorited (starred). '%1$@' is a placeholder for the count of episodes to be starred (the number will be more than one).
  internal static func multiSelectStarringEpisodesPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_starring_episodes_plural_format", String(describing: p1), fallback: "Starring %1$@ episodes.")
  }
  /// Multi-select status message for marking one episode as favorited (starred).
  internal static var multiSelectStarringEpisodesSingular: String { return L10n.tr("Localizable", "multi_select_starring_episodes_singular", fallback: "Starring 1 episode.") }
  /// Multi-select status message for unarchiving multiple episodes. '%1$@' is a placeholder for the count of files to be unarchived (the number will be more than one).
  internal static func multiSelectUnarchivingEpisodesPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_unarchiving_episodes_plural_format", String(describing: p1), fallback: "Unarchiving %1$@ episodes.")
  }
  /// Multi-select status message for unarchiving one episode.
  internal static var multiSelectUnarchivingEpisodesSingular: String { return L10n.tr("Localizable", "multi_select_unarchiving_episodes_singular", fallback: "Unarchiving 1 episode") }
  /// Title for the prompt to remove the selected items from being stared (favorited).
  internal static var multiSelectUnstar: String { return L10n.tr("Localizable", "multi_select_unstar", fallback: "Unstar Episodes") }
  /// Multi-select status message for marking multiple episodes as not favorited (un-starred). '%1$@' is a placeholder for the count of episodes to be un-starred (the number will be more than one).
  internal static func multiSelectUnstarringEpisodesPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "multi_select_unstarring_episodes_plural_format", String(describing: p1), fallback: "Unstarring %1$@ episodes.")
  }
  /// Multi-select status message for marking one episode as not favorited (un-starred).
  internal static var multiSelectUnstarringEpisodesSingular: String { return L10n.tr("Localizable", "multi_select_unstarring_episodes_singular", fallback: "Unstarring 1 episode") }
  /// Common word used as a title when asking the user to name something
  internal static var name: String { return L10n.tr("Localizable", "name", fallback: "Name") }
  /// Email change form new email address field prompt
  internal static var newEmailAddressPrompt: String { return L10n.tr("Localizable", "new_email_address_prompt", fallback: "New Email Address") }
  /// A common string used throughout the app. References to new episodes.
  internal static var newEpisodes: String { return L10n.tr("Localizable", "new_episodes", fallback: "New episodes") }
  /// Password change form new password field prompt
  internal static var newPasswordPrompt: String { return L10n.tr("Localizable", "new_password_prompt", fallback: "New Password") }
  /// A common string used throughout the app. Prompt to move forward in the flow.
  internal static var next: String { return L10n.tr("Localizable", "next", fallback: "Next") }
  /// A common string used throughout the app. Prompt to move to the next episode.
  internal static var nextEpisode: String { return L10n.tr("Localizable", "next_episode", fallback: "Next Episode") }
  /// A common string used throughout the app. Format used to call out when the associated subscription will be renewed. '%1$@' is a placeholder for a localized date indicating when the renewal will process.
  internal static func nextPaymentFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "next_payment_format", String(describing: p1), fallback: "Next payment: %1$@")
  }
  /// A common string used throughout the app. Default 'not set' option mostly used with group settings.
  internal static var `none`: String { return L10n.tr("Localizable", "none", fallback: "None") }
  /// A common string used throughout the app. Informs the user that they are not on WiFi and the action they're about to take will use data. Used for downloads and uploads.
  internal static var notOnWifi: String { return L10n.tr("Localizable", "not_on_wifi", fallback: "You're not on WiFi") }
  /// Prompt to play the selected item now.
  internal static var notificationsPlayNow: String { return L10n.tr("Localizable", "notifications_play_now", fallback: "Play Now") }
  /// A common string used throughout the app. Refers to the Now Playing tab in the player.
  internal static var nowPlaying: String { return L10n.tr("Localizable", "now_playing", fallback: "Now Playing") }
  /// A common string used throughout the app. Specifically calls out the item that is currently being played. '%1$@' is a placeholder for the item'r name that is being played.
  internal static func nowPlayingItem(_ p1: Any) -> String {
    return L10n.tr("Localizable", "now_playing_item", String(describing: p1), fallback: "Now Playing %1$@")
  }
  /// A common string used throughout the app. Refers to the Now Playing tab in the player. Removes 'Now' to conserve space.
  internal static var nowPlayingShortTitle: String { return L10n.tr("Localizable", "now_playing_short_title", fallback: "Playing") }
  /// A common string used throughout the app. Indicates that the feature is not enabled.
  internal static var off: String { return L10n.tr("Localizable", "off", fallback: "Off") }
  /// A common string used throughout the app. Used as a confirmation or acceptance.
  internal static var ok: String { return L10n.tr("Localizable", "ok", fallback: "OK") }
  /// A common string used throughout the app. Often used as a toggle to enable a feature only when the user is on Wifi.
  internal static var onlyOnWifi: String { return L10n.tr("Localizable", "only_on_wifi", fallback: "Only On WiFi") }
  /// Message for the dialog box informing the user that the podcast import from the provided OPML file has failed.
  internal static var opmlImportFailedMessage: String { return L10n.tr("Localizable", "opml_import_failed_message", fallback: "Unable to import podcasts from the OPML file you specified. Please check that it's valid") }
  /// Title for the dialog box informing the user that the podcast import from the provided OPML file has failed.
  internal static var opmlImportFailedTitle: String { return L10n.tr("Localizable", "opml_import_failed_title", fallback: "OPML Import Failed") }
  /// Progress message indicating the total number of podcasts imported from an OPML file. '%1$@' serves as a placeholder for the current number of imported podcasts. '%2$@' serves as a placeholder for the total number of podcasts to import.
  internal static func opmlImportProgressFormat(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "opml_import_progress_format", String(describing: p1), String(describing: p2), fallback: "Importing %1$@ of %2$@")
  }
  /// Progress message indicating that the import process of an OPML file is running.
  internal static var opmlImporting: String { return L10n.tr("Localizable", "opml_importing", fallback: "Importing Podcasts...") }
  /// Format used to indicate the current page and total in a custom page control. '%1$@' is a placeholder for the current page. '%2$@' is a placeholder for the total pages.
  internal static func pageControlPageProgressFormat(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "page_control_page_progress_format", String(describing: p1), String(describing: p2), fallback: "Page %1$@ of %2$@")
  }
  /// A label indicating the number of podcasts the user has subscribed to compared to the total number of podcasts in the bundle. '%1$@' is a placeholder for the number of subscribed podcasts. '%2$@' is a placeholder for the number of podcasts in the bundle.
  internal static func paidPodcastBundledSubscriptions(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "paid_podcast_bundled_subscriptions", String(describing: p1), String(describing: p2), fallback: "%1$@ / %2$@ SUBSCRIBED")
  }
  /// Option to allow the user to cancel their subscription to a paid podcast feed.
  internal static var paidPodcastCancel: String { return L10n.tr("Localizable", "paid_podcast_cancel", fallback: "Cancel Contribution") }
  /// Message displayed when the user selects to cancel their paid podcast subscription. This message is used when the user is canceling multiple subscriptions. '%1$@' is a placeholder for the last date that the current subscriptions will remain active.
  internal static func paidPodcastCancelMsgPlural(_ p1: Any) -> String {
    return L10n.tr("Localizable", "paid_podcast_cancel_msg_plural", String(describing: p1), fallback: "Supporter status will remain active until %1$@. After that you won't be able to play these podcast anymore.")
  }
  /// Message displayed when the user selects to cancel their paid podcast subscription. This message is used when the podcast allows the user to access episodes that were available to them during their subscription window. '%1$@' is a placeholder for the last date that the current subscription will remain active.
  internal static func paidPodcastCancelMsgRetainAccess(_ p1: Any) -> String {
    return L10n.tr("Localizable", "paid_podcast_cancel_msg_retain_access", String(describing: p1), fallback: "Supporter status will remain active until %1$@. You will only be able to listen to episodes released before this date.")
  }
  /// Message displayed when the user selects to cancel their paid podcast subscription. This message is used when the user is only canceling a singular subscription. '%1$@' is a placeholder for the last date that the current subscription will remain active.
  internal static func paidPodcastCancelMsgSingular(_ p1: Any) -> String {
    return L10n.tr("Localizable", "paid_podcast_cancel_msg_singular", String(describing: p1), fallback: "Supporter status will remain active until %1$@. After that you won't be able to play this podcast anymore.")
  }
  /// A generic error indicating that the app failed to load information about the paid feed.
  internal static var paidPodcastGenericError: String { return L10n.tr("Localizable", "paid_podcast_generic_error", fallback: "Unable to load info") }
  /// Prompt to open settings to adjust settings for a paid feed.
  internal static var paidPodcastManage: String { return L10n.tr("Localizable", "paid_podcast_manage", fallback: "Manage") }
  /// Informational label informing the user when to expect the next episode. '%1$@' is a placeholder for the next upcoming release date.
  internal static func paidPodcastNextEpisodeFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "paid_podcast_next_episode_format", String(describing: p1), fallback: "Next episode %1$@")
  }
  /// Informational label informing the user when the latest episode was released. '%1$@' is a placeholder for the latest release date.
  internal static func paidPodcastReleaseFrequencyFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "paid_podcast_release_frequency_format", String(describing: p1), fallback: "Released %1$@")
  }
  /// Prompt to get the user to sign in to see updates. This acts as the details message for a section. '
  /// ' is the new line character to cause a line wrap.
  internal static var paidPodcastSigninPromptMsg: String { return L10n.tr("Localizable", "paid_podcast_signin_prompt_msg", fallback: "SIGN IN FOR\nUPDATES") }
  /// Prompt to get the user to sign in to see updates. This acts as the title for a section.
  internal static var paidPodcastSigninPromptTitle: String { return L10n.tr("Localizable", "paid_podcast_signin_prompt_title", fallback: "Sign in for new episodes") }
  /// Format used to indicate the subscription for the paid podcast has ended. '%1$@' is a placeholder for the date that the subscription ended on.
  internal static func paidPodcastSubscriptionEnded(_ p1: Any) -> String {
    return L10n.tr("Localizable", "paid_podcast_subscription_ended", String(describing: p1), fallback: "ENDED: %1$@")
  }
  /// Format used to indicate the subscription for the paid podcast will end on the specified date. '%1$@' is a placeholder for the date that the subscription will end.
  internal static func paidPodcastSubscriptionEnds(_ p1: Any) -> String {
    return L10n.tr("Localizable", "paid_podcast_subscription_ends", String(describing: p1), fallback: "ENDS: %1$@")
  }
  /// A label used to inform the user that the selected podcast feed is for paid supporters only.
  internal static var paidPodcastSupporterOnlyMsg: String { return L10n.tr("Localizable", "paid_podcast_supporter_only_msg", fallback: "Supporter-only feed") }
  /// Prompt to get the user to sign in after selecting to support a podcast while signed out. '%1$@' is a placeholder for the name of the podcast the user has subscribed to.
  internal static func paidPodcastSupporterSigninPrompt(_ p1: Any) -> String {
    return L10n.tr("Localizable", "paid_podcast_supporter_signin_prompt", String(describing: p1), fallback: "Thanks for signing up as a %1$@ supporter. To access your special content, you’ll need to sign in.")
  }
  /// A confirmation message for when a user has selected too unsubscribe and has downloaded files.
  internal static var paidPodcastUnsubscribeMsg: String { return L10n.tr("Localizable", "paid_podcast_unsubscribe_msg", fallback: "Unsubscribing from all these podcasts will delete any downloaded files they have, are you sure?") }
  /// A common string used throughout the app. Prompt to pause the playback.
  internal static var pause: String { return L10n.tr("Localizable", "pause", fallback: "Pause") }
  /// A common string used throughout the app. Used to reference the Phone as the playing source with in the Apple Watch App (Watch is the other option for this use case)
  internal static var phone: String { return L10n.tr("Localizable", "phone", fallback: "Phone") }
  /// A common string used throughout the app. Prompt to start playback.
  internal static var play: String { return L10n.tr("Localizable", "play", fallback: "Play") }
  /// A common string used throughout the app. Prompt to start playback and add the remaining selected items to the queue.
  internal static var playAll: String { return L10n.tr("Localizable", "play_all", fallback: "Play All") }
  /// A common string used throughout the app. Prompt to add the selected item(s) to the end of the queue.
  internal static var playLast: String { return L10n.tr("Localizable", "play_last", fallback: "Play Last") }
  /// A common string used throughout the app. Prompt to add the selected item(s) to the top of the queue.
  internal static var playNext: String { return L10n.tr("Localizable", "play_next", fallback: "Play Next") }
  /// One of the options for how aggressive to be in trimming silence. Sets it to max the highest setting.
  internal static var playbackEffectTrimSilenceMax: String { return L10n.tr("Localizable", "playback_effect_trim_silence_max", fallback: "Mad Max") }
  /// One of the options for how aggressive to be in trimming silence. Sets it to medium the middle setting.
  internal static var playbackEffectTrimSilenceMedium: String { return L10n.tr("Localizable", "playback_effect_trim_silence_medium", fallback: "Medium") }
  /// One of the options for how aggressive to be in trimming silence. Sets it to mild the lowest setting.
  internal static var playbackEffectTrimSilenceMild: String { return L10n.tr("Localizable", "playback_effect_trim_silence_mild", fallback: "Mild") }
  /// Used in the player to describe effects you can use to change audio playback. Things like speed, volume, etc.
  internal static var playbackEffects: String { return L10n.tr("Localizable", "playback_effects", fallback: "Playback effects") }
  /// A common string used throughout the app. Generic message informing the user that playback failed.
  internal static var playbackFailed: String { return L10n.tr("Localizable", "playback_failed", fallback: "Playback Failed") }
  /// Label indicating the current value for the playback speed. '%1$@' is a placeholder for the playback speed and 'x' is meant to read as 'times' as in '1.1 times' for '1.1x'
  internal static func playbackSpeed(_ p1: Any) -> String {
    return L10n.tr("Localizable", "playback_speed", String(describing: p1), fallback: "%1$@x")
  }
  /// Accessibility hint text informing the user that the Sleep timer is enabled.
  internal static var playerAccessibilitySleepTimerOn: String { return L10n.tr("Localizable", "player_accessibility_sleep_timer_on", fallback: "Sleep timer on") }
  /// Subtitle for settings indicating this item operates as delete for files.
  internal static var playerActionSubtitleDelete: String { return L10n.tr("Localizable", "player_action_subtitle_delete", fallback: "Shown as Delete for custom episodes") }
  /// Subtitle for settings indicating this item is hidden for files.
  internal static var playerActionSubtitleHidden: String { return L10n.tr("Localizable", "player_action_subtitle_hidden", fallback: "Hidden for custom episodes") }
  /// Header for the available playback effect options.
  internal static var playerActionTitleEffects: String { return L10n.tr("Localizable", "player_action_title_effects", fallback: "Playback Effects") }
  /// Title for the prompt to navigate the user to the files section of the app.
  internal static var playerActionTitleGoToFile: String { return L10n.tr("Localizable", "player_action_title_go_to_file", fallback: "Go to Files") }
  /// Title for the available output device options.
  internal static var playerActionTitleOutputOptions: String { return L10n.tr("Localizable", "player_action_title_output_options", fallback: "Output Device") }
  /// Header for the available timer options for auto-pausing playback.
  internal static var playerActionTitleSleepTimer: String { return L10n.tr("Localizable", "player_action_title_sleep_timer", fallback: "Sleep Timer") }
  /// Title for the prompt to remove an episode from the favorites.
  internal static var playerActionTitleUnstarEpisode: String { return L10n.tr("Localizable", "player_action_title_unstar_episode", fallback: "Unstar Episode") }
  /// Title for a page where you can rearrange common actions (eg sort/reorder and move the ones you like more to the top)
  internal static var playerActionsRearrangeTitle: String { return L10n.tr("Localizable", "player_actions_rearrange_title", fallback: "Rearrange Actions") }
  /// Confirmation prompt for archiving an episode.
  internal static var playerArchivedConfirmation: String { return L10n.tr("Localizable", "player_archived_confirmation", fallback: "Archive this episode?") }
  /// Accessibility label calling out the current artwork that's being displayed. '%1$@' is a placeholder for either the episode name or the chapter title.
  internal static func playerArtwork(_ p1: Any) -> String {
    return L10n.tr("Localizable", "player_artwork", String(describing: p1), fallback: "%1$@ Artwork")
  }
  /// Information label that includes the current chapter and total chapter count example '1 of 3'. '%1$@' is a placeholder for the current chapter. '%2$@' is a placeholder for the total chapters.
  internal static func playerChapterCount(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "player_chapter_count", String(describing: p1), String(describing: p2), fallback: "%1$@ of %2$@")
  }
  /// Accessibility label for the player control that rewinds the current playback position by a customizable time.
  internal static var playerDecrementTime: String { return L10n.tr("Localizable", "player_decrement_time", fallback: "Decrement time") }
  /// Detail text explaining that trim silence feature.
  internal static var playerEffectsTrimSilenceDetails: String { return L10n.tr("Localizable", "player_effects_trim_silence_details", fallback: "Reduces the length of an episode by trimming silence in conversations.") }
  /// Detail text celebrating how much time has been saved using the trim silence feature. '%1$@' is a placeholder for the amount of time saved using the feature.
  internal static func playerEffectsTrimSilenceProgress(_ p1: Any) -> String {
    return L10n.tr("Localizable", "player_effects_trim_silence_progress", String(describing: p1), fallback: "In total you've saved %1$@ using this feature.")
  }
  /// Generic error used when playback fails but the episode has a downloaded file. Warns the user that playback is failing because the associated file likely has been corrupted.
  internal static var playerErrorCorruptedFile: String { return L10n.tr("Localizable", "player_error_corrupted_file", fallback: "The episode might be corrupted, but you can try to play it again.") }
  /// Generic error used when playback fails while streaming. Asks the user to verify their internet connection.
  internal static var playerErrorInternetConnection: String { return L10n.tr("Localizable", "player_error_internet_connection", fallback: "Check your Internet connection and try again.") }
  /// Accessibility label for the player control that fast-forwards the current playback position by a customizable time.
  internal static var playerIncrementTime: String { return L10n.tr("Localizable", "player_increment_time", fallback: "Increment time") }
  /// Confirmation prompt for marking an episode as played.
  internal static var playerMarkAsPlayedConfirmation: String { return L10n.tr("Localizable", "player_mark_as_played_confirmation", fallback: "Mark this episode as played?") }
  /// Warning that comes along with selecting to play all. Informs the user that their queue will be cleared.
  internal static var playerOptionsPlayAllMessage: String { return L10n.tr("Localizable", "player_options_play_all_message", fallback: "This will clear your current Up Next queue.") }
  /// Prompt to play a single episode from a multi-select screen.
  internal static var playerOptionsPlayEpisodeSingular: String { return L10n.tr("Localizable", "player_options_play_episode_singular", fallback: "Play 1 Episode") }
  /// Prompt to play a multiple episodes from a multi-select screen. '%1$@' is a placeholder for the number of episodes; the value will be more than one.
  internal static func playerOptionsPlayEpisodesPlural(_ p1: Any) -> String {
    return L10n.tr("Localizable", "player_options_play_episodes_plural", String(describing: p1), fallback: "Play %1$@ Episodes")
  }
  /// Section header for organizing which options will show in the player vs in the menu.
  internal static var playerOptionsShortcutOnPlayer: String { return L10n.tr("Localizable", "player_options_shortcut_on_player", fallback: "SHORTCUT ON PLAYER") }
  /// Accessibility label for the Route selector control. Opens the Apple menu for selecting the playback device such as headphones or a Bluetooth speaker.
  internal static var playerRouteSelection: String { return L10n.tr("Localizable", "player_route_selection", fallback: "Route Selector") }
  /// Header for the share menu where the user selects to share the podcast, episode, or episode at the current position
  internal static var playerShareHeader: String { return L10n.tr("Localizable", "player_share_header", fallback: "SHARE LINK TO") }
  /// Error title when there is a download error.
  internal static var playerUserEpisodeDownloadError: String { return L10n.tr("Localizable", "player_user_episode_download_error", fallback: "Download Error") }
  /// Error title when there is a playback error.
  internal static var playerUserEpisodePlaybackError: String { return L10n.tr("Localizable", "player_user_episode_playback_error", fallback: "Playback Error") }
  /// Error title when there is an upload error.
  internal static var playerUserEpisodeUploadError: String { return L10n.tr("Localizable", "player_user_episode_upload_error", fallback: "Upload Error") }
  /// A common string used throughout the app. Catch all prompt to suggest to the user to try the task again.
  internal static var pleaseTryAgain: String { return L10n.tr("Localizable", "please_try_again", fallback: "Please try again") }
  /// A common string used throughout the app. Catch all prompt to suggest to the user to try the task again later.
  internal static var pleaseTryAgainLater: String { return L10n.tr("Localizable", "please_try_again_later", fallback: "Please try again later.") }
  /// Prompt informing the user that an account is required in order to sign up for Pocket Casts Plus
  internal static var plusAccountRequiredPrompt: String { return L10n.tr("Localizable", "plus_account_required_prompt", fallback: "A Pocket Casts account is required for Pocket Casts Plus. This ensures seamless listening across all your devices.") }
  /// Details prompt informing the user that an account is required in order to sign up for Pocket Casts Plus
  internal static var plusAccountRequiredPromptDetails: String { return L10n.tr("Localizable", "plus_account_required_prompt_details", fallback: "Create an account or sign in to redeem your access to Pocket Casts Plus.") }
  /// Details message informing the user that they'll return to a free account at the end of their trial
  internal static var plusAccountTrialDetails: String { return L10n.tr("Localizable", "plus_account_trial_details", fallback: "When your trial is over you’ll still have all the great benefits of your regular account. Happy podcasting!") }
  /// The available cloud storage limit available to Pocket Casts Plus Subscribers. '%1$@' is a placeholder for the available storage.
  internal static func plusCloudStorageLimitFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "plus_cloud_storage_limit_format", String(describing: p1), fallback: "%1$@ GB Cloud Storage")
  }
  /// Error message informing the user that they have already signed up for plus with this account.
  internal static var plusErrorAlreadyRegistered: String { return L10n.tr("Localizable", "plus_error_already_registered", fallback: "You already have a Pocket Casts Plus account") }
  /// Error message details informing the user that they have already signed up for plus with this account so they can't take advantage of the entered promotion.
  internal static var plusErrorAlreadyRegisteredDetails: String { return L10n.tr("Localizable", "plus_error_already_registered_details", fallback: "Thanks for your support, but unfortunately this means you can’t take part in this promotion.") }
  /// Account detail message informing the user when their Plus account will expire. '%1$@' is a placeholder for when the account will expire.
  internal static func plusExpirationFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "plus_expiration_format", String(describing: p1), fallback: "Expires %1$@")
  }
  /// Feature of Pocket Casts plus, Cloud Storage. Being able to upload your files to the Pocket Casts servers
  internal static var plusFeatureCloudStorage: String { return L10n.tr("Localizable", "plus_feature_cloud_storage", fallback: "Cloud Storage") }
  /// Feature of Pocket Casts plus, Themes and icons. Themes for changing the way the app looks, icons to change the icon shown on your home screen
  internal static var plusFeatureThemesIcons: String { return L10n.tr("Localizable", "plus_feature_themes_icons", fallback: "Extra Themes & App Icons") }
  /// Feature of Pocket Casts plus, Apple Watch app. Standalone meaning it can run with your iPhone
  internal static var plusFeatureWatchApp: String { return L10n.tr("Localizable", "plus_feature_watch_app", fallback: "Standalone Watch Playback") }
  /// Feature of Pocket Casts plus, Web Player. As in our web based version capable of playing podcasts
  internal static var plusFeatureWebPlayer: String { return L10n.tr("Localizable", "plus_feature_web_player", fallback: "Web Player") }
  /// A common string used throughout the app. often used as a section header to divide settings related to Pocket Casts Plus vs free features. 'PLUS' refers to Pocket Casts Plus.
  internal static var plusFeatures: String { return L10n.tr("Localizable", "plus_features", fallback: "PLUS FEATURES") }
  /// Account detail message informing the user that they have been granted a limited free membership. '%1$@' is a placeholder for a localized string for the free time period.
  internal static func plusFreeMembershipFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "plus_free_membership_format", String(describing: p1), fallback: "%1$@ Free")
  }
  /// Account detail message informing the user that they have been granted a lifetime membership.
  internal static var plusLifetimeMembership: String { return L10n.tr("Localizable", "plus_lifetime_membership", fallback: "Lifetime Member") }
  /// Pocket Casts Plus marketing page, description of the Cloud Storage feature
  internal static var plusMarketingCloudStorageDescription: String { return L10n.tr("Localizable", "plus_marketing_cloud_storage_description", fallback: "Speed up your lectures. Burn through other content. Be your own Podcast DJ.") }
  /// Pocket Casts Plus marketing page, title of the Cloud Storage feature
  internal static var plusMarketingCloudStorageTitle: String { return L10n.tr("Localizable", "plus_marketing_cloud_storage_title", fallback: "Cloud Storage") }
  /// Pocket Casts Plus marketing page, description of the Desktop Apps feature
  internal static var plusMarketingDesktopAppsDescription: String { return L10n.tr("Localizable", "plus_marketing_desktop_apps_description", fallback: "Take your podcasts to more places with our Windows, macOS and Web apps.") }
  /// Pocket Casts Plus marketing page, title of the Desktop Apps feature
  internal static var plusMarketingDesktopAppsTitle: String { return L10n.tr("Localizable", "plus_marketing_desktop_apps_title", fallback: "Desktop Apps") }
  /// Pocket Casts Plus marketing page, the final call to action to get people to upgrade
  internal static var plusMarketingFinalCallToAction: String { return L10n.tr("Localizable", "plus_marketing_final_call_to_action", fallback: "Time to up your podcasting game?\nGet desktop apps, bring your own files and spruce things up with fresh new themes, exclusive to plus members.") }
  /// Pocket Casts Plus marketing page, description of the Folders feature
  internal static var plusMarketingFoldersDescription: String { return L10n.tr("Localizable", "plus_marketing_folders_description", fallback: "Create folders to organise your podcast collection.") }
  /// Pocket Casts Plus marketing page, learn more button. Note that Pocket Casts is a proper noun and shouldn't be translated
  internal static var plusMarketingLearnMoreButton: String { return L10n.tr("Localizable", "plus_marketing_learn_more_button", fallback: "Learn more about Pocket Casts Plus") }
  /// Pocket Casts Plus marketing page, the main description of Pocket Casts Plus
  internal static var plusMarketingMainDescription: String { return L10n.tr("Localizable", "plus_marketing_main_description", fallback: "Get personal, and get distributed, all at once. Upload your personal audio files to our cloud servers, access your account via our web player, and make the app yours.") }
  /// Pocket Casts Plus marketing page, the main title
  internal static var plusMarketingMainTitle: String { return L10n.tr("Localizable", "plus_marketing_main_title", fallback: "Enhanced Features For Advanced Listeners") }
  /// Pocket Casts Plus marketing page, description of the Themes & Icons feature
  internal static var plusMarketingThemesIconsDescription: String { return L10n.tr("Localizable", "plus_marketing_themes_icons_description", fallback: "Fly your true colors. Exclusive icons and themes for the plus club only.") }
  /// Pocket Casts Plus marketing page, title of the Themes & Icons feature
  internal static var plusMarketingThemesIconsTitle: String { return L10n.tr("Localizable", "plus_marketing_themes_icons_title", fallback: "Themes & Icons") }
  /// Pocket Casts Plus marketing page, the text on the upgrade button
  internal static var plusMarketingUpgradeButton: String { return L10n.tr("Localizable", "plus_marketing_upgrade_button", fallback: "Upgrade To Plus") }
  /// Pocket Casts Plus marketing page, description of the Watch Playback feature
  internal static var plusMarketingWatchPlaybackDescription: String { return L10n.tr("Localizable", "plus_marketing_watch_playback_description", fallback: "Ditch the phone and go for a run – without missing a beat. Apple Watch stands alone.") }
  /// Pocket Casts Plus marketing page, title of the Watch Playback feature
  internal static var plusMarketingWatchPlaybackTitle: String { return L10n.tr("Localizable", "plus_marketing_watch_playback_title", fallback: "Watch Playback") }
  /// Informational message informing the user that their recurring payments for Plus have been canceled.
  internal static var plusPaymentCanceled: String { return L10n.tr("Localizable", "plus_payment_canceled", fallback: "Payment Cancelled") }
  /// Label that goes along with the yearly subscription used to indicate that the yearly plan is the best overall value.
  internal static var plusPaymentFrequencyBestValue: String { return L10n.tr("Localizable", "plus_payment_frequency_best_value", fallback: "Best Value") }
  /// Informational label that's below the monthly price of Pocket Casts Plus. This label sits below a localized price.
  internal static var plusPerMonth: String { return L10n.tr("Localizable", "plus_per_month", fallback: "per month") }
  /// The price of Pocket Casts Plus per month. '%1$@' is a localized monthly price.
  internal static func plusPricePerMonth(_ p1: Any) -> String {
    return L10n.tr("Localizable", "plus_price_per_month", String(describing: p1), fallback: "%1$@ / monthly")
  }
  /// Promotional information for Pocket Casts Plus. Please note that "Pocket Casts Plus" should not be translated because it's a product name
  internal static var plusPromoParagraph: String { return L10n.tr("Localizable", "plus_promo_paragraph", fallback: "Get Pocket Casts Plus to unlock this feature, plus lots more!") }
  /// Error message informing the user the promotion code has expired
  internal static var plusPromotionExpired: String { return L10n.tr("Localizable", "plus_promotion_expired", fallback: "Promotion Expired or Invalid") }
  /// A nudge to ask the user to continue the sign up process even though they encountered an error.
  internal static var plusPromotionExpiredNudge: String { return L10n.tr("Localizable", "plus_promotion_expired_nudge", fallback: "You’re welcome to sign up for Pocket Casts Plus anyway, create a regular account, or just dive right in.") }
  /// Error message informing the user the promotion code has already been used
  internal static var plusPromotionUsed: String { return L10n.tr("Localizable", "plus_promotion_used", fallback: "Code already used") }
  /// Heading for things that require Pocket Casts Plus to work. Please note that "Pocket Casts Plus" should not be translated because it's a product name
  internal static var plusRequiredFeature: String { return L10n.tr("Localizable", "plus_required_feature", fallback: "This feature requires Pocket Casts Plus") }
  /// Title for the screen to allow the user to choose between a monthly or yearly subscription.
  internal static var plusSelectPaymentFrequency: String { return L10n.tr("Localizable", "plus_select_payment_frequency", fallback: "Select Payment Frequency") }
  /// Message informing the user that their Pocket Casts Plus subscription is managed by Apple's system and needs to be managed there.
  internal static var plusSubscriptionApple: String { return L10n.tr("Localizable", "plus_subscription_apple", fallback: "Your subscription is managed by the Apple App Store") }
  /// Message informing the user where to manage their Pocket Casts Plus subscription managed by Apple.
  internal static var plusSubscriptionAppleDetails: String { return L10n.tr("Localizable", "plus_subscription_apple_details", fallback: "To cancel your subscription, you’ll need to cancel via Settings.") }
  /// Message informing the user when their Pocket Casts Plus subscription will expire. %1$@ is a placeholder for the expiration date.
  internal static func plusSubscriptionExpiration(_ p1: Any) -> String {
    return L10n.tr("Localizable", "plus_subscription_expiration", String(describing: p1), fallback: "PLUS EXPIRES IN %1$@")
  }
  /// Message informing the user that their Pocket Casts Plus subscription is managed by Google's system and needs to be managed there.
  internal static var plusSubscriptionGoogle: String { return L10n.tr("Localizable", "plus_subscription_google", fallback: "It looks like you subscribed to Pocket Casts Plus from an Android device") }
  /// Message informing the user where to manage their Pocket Casts Plus subscription managed by Google.
  internal static var plusSubscriptionGoogleDetails: String { return L10n.tr("Localizable", "plus_subscription_google_details", fallback: "To cancel your subscription, you’ll need to cancel via Settings.") }
  /// Message informing the user that their Pocket Casts Plus subscription is managed by Web's system and needs to be managed there.
  internal static var plusSubscriptionWeb: String { return L10n.tr("Localizable", "plus_subscription_web", fallback: "It looks like you subscribed to Pocket Casts Plus from the web") }
  /// Message informing the user where to manage their Pocket Casts Plus subscription managed by Web.
  internal static var plusSubscriptionWebDetails: String { return L10n.tr("Localizable", "plus_subscription_web_details", fallback: "To cancel your subscription, you’ll need to cancel via Pocketcasts.com.") }
  /// The heading shown for the Pocket Casts Newsletter
  internal static var pocketCastsNewsletter: String { return L10n.tr("Localizable", "pocket_casts_newsletter", fallback: "Pocket Casts Newsletter") }
  /// The description for the Pocket Casts Newsletter
  internal static var pocketCastsNewsletterDescription: String { return L10n.tr("Localizable", "pocket_casts_newsletter_description", fallback: "Receive news, app updates, themed playlists, interviews, and more.") }
  /// A common string used throughout the app. Refers to the subscription program Pocket Casts Plus subscription. 'Pocket Casts' as a proper noun should not be localized.
  internal static var pocketCastsPlus: String { return L10n.tr("Localizable", "pocket_casts_plus", fallback: "Pocket Casts Plus") }
  /// A shortened version of the common string used throughout the app. Refers to the subscription program Pocket Casts Plus subscription.
  internal static var pocketCastsPlusShort: String { return L10n.tr("Localizable", "pocket_casts_plus_short", fallback: "Plus") }
  /// Indicates that the access to the podcast has ended on the specified date. '%1$@' is a placeholder for date that the access expired.
  internal static func podcastAccessEnded(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_access_ended", String(describing: p1), fallback: "Access ended: %1$@")
  }
  /// Indicates that the access to the podcast will end on the specified date. '%1$@' is a placeholder for date that the access will end.
  internal static func podcastAccessEnds(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_access_ends", String(describing: p1), fallback: "Access ends: %1$@")
  }
  /// Prompt to archive all of the selected items.
  internal static var podcastArchiveAll: String { return L10n.tr("Localizable", "podcast_archive_all", fallback: "Archive All") }
  /// Prompt to archive all played episodes of the current podcast.
  internal static var podcastArchiveAllPlayed: String { return L10n.tr("Localizable", "podcast_archive_all_played", fallback: "Archive All Played") }
  /// Confirmation to archive a certain number of podcast episodes. This is the singular form of an accompanying plural form.
  internal static var podcastArchiveEpisodeCountSingular: String { return L10n.tr("Localizable", "podcast_archive_episode_count_singular", fallback: "Archive 1 Episode") }
  /// Confirmation to archive a certain number of podcast episodes. '%1$@' is a placeholder for the number of episodes.
  internal static func podcastArchiveEpisodesCountPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_archive_episodes_count_plural_format", String(describing: p1), fallback: "Archive %1$@ Episodes")
  }
  /// Confirmation message that appears alongside the various bulk archive prompts.
  internal static var podcastArchivePromptMsg: String { return L10n.tr("Localizable", "podcast_archive_prompt_msg", fallback: "You should only do this if you don't want to see them anymore.") }
  /// Indicates that the episode has been archived.
  internal static var podcastArchived: String { return L10n.tr("Localizable", "podcast_archived", fallback: "Archived") }
  /// Label used to display the number or archived episodes in a podcast. '%1$@' is a placeholder for the archived episode number.
  internal static func podcastArchivedCountFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_archived_count_format", String(describing: p1), fallback: "%1$@ archived")
  }
  /// Informational message informing the user that no episodes are being displayed because they're all archived. '%1$@' is a placeholder for the number of episodes.
  internal static func podcastArchivedMsg(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_archived_msg", String(describing: p1), fallback: "All %1$@ episodes of this podcast have been archived")
  }
  /// A common string used throughout the app. Displays the count of selected podcasts. '%1$@' is a placeholder for the number of podcasts, the value will be more than one.
  internal static func podcastCountPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_count_plural_format", String(describing: p1), fallback: "%1$@ podcasts")
  }
  /// A common string used throughout the app. Displays the count of selected podcasts. This is the singular version of an accompanying plural format.
  internal static var podcastCountSingular: String { return L10n.tr("Localizable", "podcast_count_singular", fallback: "1 podcast") }
  /// Error message informing the user that the episode encountered a download error.
  internal static var podcastDetailsDownloadError: String { return L10n.tr("Localizable", "podcast_details_download_error", fallback: "Episode download failed") }
  /// Message informing the user that the episode will download once the device restores a WiFi connection.
  internal static var podcastDetailsDownloadWifiQueue: String { return L10n.tr("Localizable", "podcast_details_download_wifi_queue", fallback: "This episode will automatically download when you're next on WiFi") }
  /// Message details informing the user that the episode has been unarchived manually and won't be archived when the episode limit is reached. '%1$@' is a placeholder for the episode limit.
  internal static func podcastDetailsManualUnarchiveMsg(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_details_manual_unarchive_msg", String(describing: p1), fallback: "It won't be auto archived by your new episode limit of %1$@")
  }
  /// Message informing the user that the episode has been unarchived manually. Used with episode limits.
  internal static var podcastDetailsManualUnarchiveTitle: String { return L10n.tr("Localizable", "podcast_details_manual_unarchive_title", fallback: "Episode Manually Unarchived") }
  /// Error message informing the user that the episode encountered a playback error.
  internal static var podcastDetailsPlaybackError: String { return L10n.tr("Localizable", "podcast_details_playback_error", fallback: "Unable to play episode") }
  /// Indicates that the episode is queued for download.
  internal static var podcastDetailsQueued: String { return L10n.tr("Localizable", "podcast_details_queued", fallback: "Queued") }
  /// Confirmation prompt to remove the episode file for the selected podcast episode.
  internal static var podcastDetailsRemoveDownload: String { return L10n.tr("Localizable", "podcast_details_remove_download", fallback: "REMOVE DOWNLOADED FILE?") }
  /// Prompt to download the selected podcast now.
  internal static var podcastDownloadNow: String { return L10n.tr("Localizable", "podcast_download_now", fallback: "Download Now") }
  /// Indicates that a file is being downloaded and includes the completed percentage. '%1$@' is a placeholder for percentage that has been downloaded so far.
  internal static func podcastDownloading(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_downloading", String(describing: p1), fallback: "Downloading... %1$@")
  }
  /// Label used to display the number of episodes in a podcast. '%1$@' is a placeholder for the number of episodes.
  internal static func podcastEpisodeCountPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_episode_count_plural_format", String(describing: p1), fallback: "%1$@ episodes")
  }
  /// Label used to display the number of episodes in a podcast. This is the singular form of an accompanying plural form.
  internal static var podcastEpisodeCountSingular: String { return L10n.tr("Localizable", "podcast_episode_count_singular", fallback: "1 episode") }
  /// Label used to display the episode limit for a podcast. '%1$@' is a placeholder for the episode limit.
  internal static func podcastEpisodeLimitCountFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_episode_limit_count_format", String(describing: p1), fallback: "Limited to %1$@")
  }
  /// Message for a generic error used when a podcast fails to load without a more detailed reason why. ':(' is meant to be ASCII art for a sad face.
  internal static var podcastErrorMessage: String { return L10n.tr("Localizable", "podcast_error_message", fallback: "Unable to load podcast details :(") }
  /// Title for a generic error used when a podcast fails to load without a more detailed reason why. Meant to be a fun cultural reference.
  internal static var podcastErrorTitle: String { return L10n.tr("Localizable", "podcast_error_title", fallback: "Literally Can't Even") }
  /// Indicates that a file has failed to download.
  internal static var podcastFailedDownload: String { return L10n.tr("Localizable", "podcast_failed_download", fallback: "Episode download failed.") }
  /// Indicates that a file has failed to upload.
  internal static var podcastFailedUpload: String { return L10n.tr("Localizable", "podcast_failed_upload", fallback: "Failed to upload") }
  /// Button text shown on the podcast grid when you have no podcasts, takes you to the Discover section of the app
  internal static var podcastGridDiscoverPodcasts: String { return L10n.tr("Localizable", "podcast_grid_discover_podcasts", fallback: "Discover Podcasts") }
  /// Description shown when you have no podcasts on the podcast grid
  internal static var podcastGridNoPodcastsMsg: String { return L10n.tr("Localizable", "podcast_grid_no_podcasts_msg", fallback: "Coming from another app? Import your podcasts via Profile > Settings > Import & Export.\n\n\nIf you're looking for inspiration try the Discover tab.") }
  /// Title of the message on the podcast grid when you have no podcasts
  internal static var podcastGridNoPodcastsTitle: String { return L10n.tr("Localizable", "podcast_grid_no_podcasts_title", fallback: "Time to add some Podcasts!") }
  /// Title for the options box that allows the user to pick from the various grouping options.
  internal static var podcastGroupOptionsTitle: String { return L10n.tr("Localizable", "podcast_group_options_title", fallback: "GROUP BY") }
  /// Prompt to hide archived episodes from the episode list.
  internal static var podcastHideArchived: String { return L10n.tr("Localizable", "podcast_hide_archived", fallback: "Hide Archived") }
  /// Longer form informational label informing users that this podcast is limited to a configured set of episodes. '%1$@' is a placeholder for the number of episodes.
  internal static func podcastLimitPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_limit_plural_format", String(describing: p1), fallback: "Limited to %1$@ most recent episodes")
  }
  /// Longer form informational label informing users that this podcast is limited to one episode. Singular version of an accompanying plural format.
  internal static var podcastLimitSingular: String { return L10n.tr("Localizable", "podcast_limit_singular", fallback: "Limited to 1 most recent episode") }
  /// Progress indicator informing the user that the podcasts that have been shared or imported are currently loading.
  internal static var podcastLoading: String { return L10n.tr("Localizable", "podcast_loading", fallback: "Loading Podcast...") }
  /// Used to indicate no date was provided.
  internal static var podcastNoDate: String { return L10n.tr("Localizable", "podcast_no_date", fallback: "Date Not Set") }
  /// Label used to indicate that the podcast episode isn't grouped into a season.
  internal static var podcastNoSeason: String { return L10n.tr("Localizable", "podcast_no_season", fallback: "No Season") }
  /// Accessibility label to prompt to pause an active download.
  internal static var podcastPauseDownload: String { return L10n.tr("Localizable", "podcast_pause_download", fallback: "Pause download") }
  /// Accessibility label to prompt to pause a playback.
  internal static var podcastPausePlayback: String { return L10n.tr("Localizable", "podcast_pause_playback", fallback: "Pause playback") }
  /// Indicates that a file is queued for download and includes the estimated size.
  internal static var podcastQueued: String { return L10n.tr("Localizable", "podcast_queued", fallback: "Queued") }
  /// Indicates that the episode is queued for download.
  internal static var podcastQueuing: String { return L10n.tr("Localizable", "podcast_queuing", fallback: "Queued...") }
  /// Prompt to trigger an artwork refresh on the podcast.
  internal static var podcastRefreshArtwork: String { return L10n.tr("Localizable", "podcast_refresh_artwork", fallback: "Refresh Artwork") }
  /// Format used to show the Season number of a podcast. '%1$@' is a placeholder for the Season number.
  internal static func podcastSeasonFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_season_format", String(describing: p1), fallback: "Season %1$@")
  }
  /// Prompt to allow the user to share the currently selected episode.
  internal static var podcastShareEpisode: String { return L10n.tr("Localizable", "podcast_share_episode", fallback: "Share Link to Episode") }
  /// Error message used when there are no available apps that can accept the podcast file.
  internal static var podcastShareEpisodeErrorMsg: String { return L10n.tr("Localizable", "podcast_share_episode_error_msg", fallback: "You don't have any apps installed that will accept this file") }
  /// Error message for when a podcast can't be found after it has been shared.
  internal static var podcastShareErrorMsg: String { return L10n.tr("Localizable", "podcast_share_error_msg", fallback: "The podcast author may have removed it since this link was shared.") }
  /// Error title for when a podcast can't be found after it has been shared.
  internal static var podcastShareErrorTitle: String { return L10n.tr("Localizable", "podcast_share_error_title", fallback: "Unable To Find Episode") }
  /// Progress message shown while the users curated list is being synced to the server.
  internal static var podcastShareListCreating: String { return L10n.tr("Localizable", "podcast_share_list_creating", fallback: "Creating list...") }
  /// Placeholder for the description of the podcast list. Used when users create a curated list of podcasts. This item is optional.
  internal static var podcastShareListDescription: String { return L10n.tr("Localizable", "podcast_share_list_description", fallback: "Description (optional)") }
  /// Placeholder for the name of the podcast list. Used when users create a curated list of podcasts.
  internal static var podcastShareListName: String { return L10n.tr("Localizable", "podcast_share_list_name", fallback: "List Name") }
  /// Option to share the episode file to other apps.
  internal static var podcastShareOpenFile: String { return L10n.tr("Localizable", "podcast_share_open_file", fallback: "Open File in...") }
  /// Prompt to Show archived episodes in the episode list.
  internal static var podcastShowArchived: String { return L10n.tr("Localizable", "podcast_show_archived", fallback: "Show Archived") }
  /// A common string used throughout the app. Refers to Podcasts in the singular form.
  internal static var podcastSingular: String { return L10n.tr("Localizable", "podcast_singular", fallback: "Podcast") }
  /// Used to reference that a new podcast episode will be available in the near future.
  internal static var podcastSoon: String { return L10n.tr("Localizable", "podcast_soon", fallback: "Any day now") }
  /// Title for the options box that allows the user to pick from the various sort options.
  internal static var podcastSortOrderTitle: String { return L10n.tr("Localizable", "podcast_sort_order_title", fallback: "SORT ORDER") }
  /// Confirmation option to stream the selected episode. Used in tandem with a notice that the user is not on WiFi.
  internal static var podcastStreamConfirmation: String { return L10n.tr("Localizable", "podcast_stream_confirmation", fallback: "Stream Anyway") }
  /// Prompt to warn the user that continuing with the option to stream will consume data. Used in tandem with a notice that the user is not on WiFi.
  internal static var podcastStreamDataWarning: String { return L10n.tr("Localizable", "podcast_stream_data_warning", fallback: "Streaming this episode will use data") }
  /// Used to reference the episode was published this month.
  internal static var podcastThisMonth: String { return L10n.tr("Localizable", "podcast_this_month", fallback: "This Month") }
  /// Indicates the remaining amount of time left in the episode. '%1$@' is a placeholder for the remaining time.
  internal static func podcastTimeLeft(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_time_left", String(describing: p1), fallback: "%1$@ left")
  }
  /// Used to reference tomorrow in terms of when the next episode will be available.
  internal static var podcastTomorrow: String { return L10n.tr("Localizable", "podcast_tomorrow", fallback: "Tomorrow") }
  /// Prompt to unarchive all of the selected items.
  internal static var podcastUnarchiveAll: String { return L10n.tr("Localizable", "podcast_unarchive_all", fallback: "Unarchive All") }
  /// Indicates that the updates to the podcast has ended on the specified date. '%1$@' is a placeholder for date that the updates ended.
  internal static func podcastUpdatesEnded(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_updates_ended", String(describing: p1), fallback: "Updates ended: %1$@")
  }
  /// Indicates that the updates to the podcast will end on the specified date. '%1$@' is a placeholder for date that the updates will end.
  internal static func podcastUpdatesEnds(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_updates_ends", String(describing: p1), fallback: "Updates ends: %1$@")
  }
  /// Confirmation option to upload the selected file. Used in tandem with a notice that the user is not on WiFi.
  internal static var podcastUploadConfirmation: String { return L10n.tr("Localizable", "podcast_upload_confirmation", fallback: "Upload Now") }
  /// Indicates that a file is being uploaded and includes the completed percentage. '%1$@' is a placeholder for a localized percentage that has been uploaded so far.
  internal static func podcastUploading(_ p1: Any) -> String {
    return L10n.tr("Localizable", "podcast_uploading", String(describing: p1), fallback: "Uploading... %1$@")
  }
  /// Indicates that a file is queued to be uploaded but hasn't started yet.
  internal static var podcastWaitingUpload: String { return L10n.tr("Localizable", "podcast_waiting_upload", fallback: "Waiting to upload") }
  /// Used to reference yesterday.
  internal static var podcastYesterday: String { return L10n.tr("Localizable", "podcast_yesterday", fallback: "Yesterday") }
  /// The badge feature is set to show the number of unplayed episodes.
  internal static var podcastsBadgeAllUnplayed: String { return L10n.tr("Localizable", "podcasts_badge_all_unplayed", fallback: "Unfinished Episodes") }
  /// The badge feature is set to show an indicator if an unplayed episode exists.
  internal static var podcastsBadgeLatestEpisode: String { return L10n.tr("Localizable", "podcasts_badge_latest_episode", fallback: "Only Latest Episode") }
  /// Title for the options to configure badge display options.
  internal static var podcastsBadges: String { return L10n.tr("Localizable", "podcasts_badges", fallback: "Badges") }
  /// Episodes will be displayed in order from the longest to the shortest.
  internal static var podcastsEpisodeSortLongestToShortest: String { return L10n.tr("Localizable", "podcasts_episode_sort_longest_to_shortest", fallback: "Longest to Shortest") }
  /// Episodes will be displayed in order from the most resent to the oldest.
  internal static var podcastsEpisodeSortNewestToOldest: String { return L10n.tr("Localizable", "podcasts_episode_sort_newest_to_oldest", fallback: "Newest to oldest") }
  /// Episodes will be displayed in order from the oldest to the most resent.
  internal static var podcastsEpisodeSortOldestToNewest: String { return L10n.tr("Localizable", "podcasts_episode_sort_oldest_to_newest", fallback: "Oldest to newest") }
  /// Episodes will be displayed in order from the shortest to the longest.
  internal static var podcastsEpisodeSortShortestToLongest: String { return L10n.tr("Localizable", "podcasts_episode_sort_shortest_to_longest", fallback: "Shortest to Longest") }
  /// Presents the podcasts with large podcast artwork tiles.
  internal static var podcastsLargeGrid: String { return L10n.tr("Localizable", "podcasts_large_grid", fallback: "Large Grid") }
  /// Title for the set of options for the presentation styles like grid sizes vs list view.
  internal static var podcastsLayout: String { return L10n.tr("Localizable", "podcasts_layout", fallback: "Layout") }
  /// Grid Items will be sorted sorted based on the users custom ordering. This is performed by dragging and dropping a podcast to the desired order.
  internal static var podcastsLibrarySortCustom: String { return L10n.tr("Localizable", "podcasts_library_sort_custom", fallback: "Drag and Drop") }
  /// Grid Items will be sorted based on the date the user subscribed to them. Newest to oldest.
  internal static var podcastsLibrarySortDateAdded: String { return L10n.tr("Localizable", "podcasts_library_sort_date_added", fallback: "Date Added") }
  /// Grid Items will be sorted based on the date of their newest episode. Newest to oldest.
  internal static var podcastsLibrarySortEpisodeReleaseDate: String { return L10n.tr("Localizable", "podcasts_library_sort_episode_release_date", fallback: "Episode Release Date") }
  /// Grid Items will be sorted alphabetically based on name.
  internal static var podcastsLibrarySortTitle: String { return L10n.tr("Localizable", "podcasts_library_sort_title", fallback: "Name") }
  /// Presents the podcasts in a list view.
  internal static var podcastsList: String { return L10n.tr("Localizable", "podcasts_list", fallback: "List") }
  /// A common string used throughout the app. Refers to Podcasts in the plural form as well as the Podcasts screen.
  internal static var podcastsPlural: String { return L10n.tr("Localizable", "podcasts_plural", fallback: "Podcasts") }
  /// Prompt to open the menu to share your podcasts list.
  internal static var podcastsShare: String { return L10n.tr("Localizable", "podcasts_share", fallback: "Share Podcasts") }
  /// Presents the podcasts with small podcast artwork tiles.
  internal static var podcastsSmallGrid: String { return L10n.tr("Localizable", "podcasts_small_grid", fallback: "Small Grid") }
  /// Prompt to open the menu to allow the user to sort their podcasts.
  internal static var podcastsSort: String { return L10n.tr("Localizable", "podcasts_sort", fallback: "Sort Podcasts") }
  /// Common word to denote a preview of something is being shown
  internal static var preview: String { return L10n.tr("Localizable", "preview", fallback: "Preview") }
  /// Pricing terms explaining how much will be charged after a free trial ends, %1$@ is the price ($0.99 / month)
  internal static func pricingTermsAfterTrial(_ p1: Any) -> String {
    return L10n.tr("Localizable", "pricing_terms_after_trial", String(describing: p1), fallback: "then %1$@")
  }
  /// A common string used throughout the app. Refers to the Profile tab.
  internal static var profile: String { return L10n.tr("Localizable", "profile", fallback: "Profile") }
  /// Body of Plus promotional section
  internal static var profileHelpSupport: String { return L10n.tr("Localizable", "profile_help_support", fallback: "Help support Pocket Casts by upgrading your account") }
  /// Informational label indicating the last time the app was refreshed. '%1$@' is a placeholder for a date string indicating when the last refresh occurred.
  internal static func profileLastAppRefresh(_ p1: Any) -> String {
    return L10n.tr("Localizable", "profile_last_app_refresh", String(describing: p1), fallback: "App last refreshed %1$@")
  }
  /// Displays the number of files for when there are multiple files. '%1$@' is a placeholder for the number of files.
  internal static func profileNumberOfFiles(_ p1: Any) -> String {
    return L10n.tr("Localizable", "profile_number_of_files", String(describing: p1), fallback: "%1$@ Files")
  }
  /// The percentage of file storage space that is currently being used. '%1$@' is a placeholder for a localized percentage.
  internal static func profilePercentFull(_ p1: Any) -> String {
    return L10n.tr("Localizable", "profile_percent_full", String(describing: p1), fallback: "%1$@ Full")
  }
  /// Prompt to allow the user to reset their account password.
  internal static var profileResetPassword: String { return L10n.tr("Localizable", "profile_reset_password", fallback: "Reset Password") }
  /// Notice informing the user that the email to reset their password is being prepared to be sent.
  internal static var profileSendingResetEmail: String { return L10n.tr("Localizable", "profile_sending_reset_email", fallback: "Sending Reset Email") }
  /// Notice informing the user that the email to reset their password has been successfully sent. This serves as the message body for an alert accompanied with a title. ':)' is meant to be ASCII art for a happy face.
  internal static var profileSendingResetEmailConfMsg: String { return L10n.tr("Localizable", "profile_sending_reset_email_conf_msg", fallback: "Check your email :)") }
  /// Notice informing the user that the email to reset their password has been successfully sent. This serves as the title for an alert.
  internal static var profileSendingResetEmailConfTitle: String { return L10n.tr("Localizable", "profile_sending_reset_email_conf_title", fallback: "Password Reset Link Sent") }
  /// Notice informing the user that the attempt to send the password reset email has failed.
  internal static var profileSendingResetEmailFailed: String { return L10n.tr("Localizable", "profile_sending_reset_email_failed", fallback: "Failed to send reset email, please try again later.") }
  /// Displays the number of files for when there is a single file.
  internal static var profileSingleFile: String { return L10n.tr("Localizable", "profile_single_file", fallback: "1 File") }
  /// Description for the empty state on screen where the user can review their starred (favorited) podcast epsiodes
  internal static var profileStarredNoEpisodesDesc: String { return L10n.tr("Localizable", "profile_starred_no_episodes_desc", fallback: "You haven't starred any episodes yet.") }
  /// Title for the empty state on screen where the user can review their starred (favorited) podcast epsiodes
  internal static var profileStarredNoEpisodesTitle: String { return L10n.tr("Localizable", "profile_starred_no_episodes_title", fallback: "Nothing Starred") }
  /// Confirmation message to clear the give number of episodes from the queue. '%1$@' is a placeholder for the number of episodes, this will be more than one.
  internal static func queueClearEpisodeQueuePlural(_ p1: Any) -> String {
    return L10n.tr("Localizable", "queue_clear_episode_queue_plural", String(describing: p1), fallback: "Clear %1$@ Episodes")
  }
  /// Prompt to allow the user to clear their queue.
  internal static var queueClearQueue: String { return L10n.tr("Localizable", "queue_clear_queue", fallback: "CLEAR QUEUE") }
  /// A common string used throughout the app. Provides an option to add the selected item(s) to a queue instead of performing the action now. Used for downloads and uploads.
  internal static var queueForLater: String { return L10n.tr("Localizable", "queue_for_later", fallback: "Queue For Later") }
  /// Accessibility label indicating the current podcast is playing and it's episode date. '%1$@' is a placeholder for the episode date.
  internal static func queueNowPlayingAccessibility(_ p1: Any) -> String {
    return L10n.tr("Localizable", "queue_now_playing_accessibility", String(describing: p1), fallback: "Now Playing. %1$@")
  }
  /// Label indicating the amount of time remains on an episode. '%1$@' is a placeholder for a localized time format for the remaining time.
  internal static func queueTimeRemaining(_ p1: Any) -> String {
    return L10n.tr("Localizable", "queue_time_remaining", String(describing: p1), fallback: "%1$@ remaining")
  }
  /// Information label indication the total time remaining in the queue. This is a total across all episodes in the up next queue. '%1$@' is a placeholder for the total time remaining in the queue.
  internal static func queueTotalTimeRemaining(_ p1: Any) -> String {
    return L10n.tr("Localizable", "queue_total_time_remaining", String(describing: p1), fallback: "%1$@ total time remaining")
  }
  /// Hint text in the pull to refresh custom control. Provides a notice that new Podcast episodes are being fetched.
  internal static var refreshControlFetchingEpisodes: String { return L10n.tr("Localizable", "refresh_control_fetching_episodes", fallback: "FINDING NEW PODCAST EPISODES") }
  /// Hint text in the pull to refresh custom control.
  internal static var refreshControlPullToRefresh: String { return L10n.tr("Localizable", "refresh_control_pull_to_refresh", fallback: "PULL TO REFRESH") }
  /// Hint text in the pull to refresh custom control. Informs the user that the refresh has finished successfully.
  internal static var refreshControlRefreshComplete: String { return L10n.tr("Localizable", "refresh_control_refresh_complete", fallback: "REFRESH COMPLETE") }
  /// Hint text in the pull to refresh custom control. Informs the user that the refresh has failed. ':(' is meant as sad face ASCII art.
  internal static var refreshControlRefreshFailed: String { return L10n.tr("Localizable", "refresh_control_refresh_failed", fallback: "REFRESH FAILED :(") }
  /// Hint text in the pull to refresh custom control. Provides a notice that files are being synced with the server.
  internal static var refreshControlRefreshingFiles: String { return L10n.tr("Localizable", "refresh_control_refreshing_files", fallback: "REFRESHING FILES") }
  /// Hint text in the pull to refresh custom control. Provides a prompt to release the control to trigger the refresh.
  internal static var refreshControlReleaseToRefresh: String { return L10n.tr("Localizable", "refresh_control_release_to_refresh", fallback: "RELEASE TO REFRESH") }
  /// Hint text in the pull to refresh custom control. Informs the user that the sync has failed. ':(' is meant as sad face ASCII art.
  internal static var refreshControlSyncFailed: String { return L10n.tr("Localizable", "refresh_control_sync_failed", fallback: "SYNC FAILED :(") }
  /// Hint text in the pull to refresh custom control. Provides a notice that Podcasts are being synced with the server.
  internal static var refreshControlSyncingPodcasts: String { return L10n.tr("Localizable", "refresh_control_syncing_podcasts", fallback: "SYNCING PODCASTS AND PROGRESS") }
  /// A common string used throughout the app. Error title indicating that the refresh process has failed.
  internal static var refreshFailed: String { return L10n.tr("Localizable", "refresh_failed", fallback: "Refresh failed") }
  /// A common string used throughout the app. Prompt to perform a manual refresh of the displayed data.
  internal static var refreshNow: String { return L10n.tr("Localizable", "refresh_now", fallback: "Refresh Now") }
  /// A common string used throughout the app. Informational label indicating the last time the refresh occurred. '%1$@' is a placeholder for a localized string indicating when the refresh happened.
  internal static func refreshPreviousRun(_ p1: Any) -> String {
    return L10n.tr("Localizable", "refresh_previous_run", String(describing: p1), fallback: "Last refresh: %1$@")
  }
  /// Activity indicator letting the user know that the process to refresh the current content is running.
  internal static var refreshing: String { return L10n.tr("Localizable", "refreshing", fallback: "Refreshing...") }
  /// Label used when a podcast releases daily episodes
  internal static var releaseFrequencyDaily: String { return L10n.tr("Localizable", "release_frequency_daily", fallback: "Daily") }
  /// Label used when a podcast releases episodes every two weeks
  internal static var releaseFrequencyFortnightly: String { return L10n.tr("Localizable", "release_frequency_fortnightly", fallback: "Fortnightly") }
  /// Label used when a podcast releases hourly episodes
  internal static var releaseFrequencyHourly: String { return L10n.tr("Localizable", "release_frequency_hourly", fallback: "Hourly") }
  /// Label used when a podcast releases episodes every month
  internal static var releaseFrequencyMonthly: String { return L10n.tr("Localizable", "release_frequency_monthly", fallback: "Monthly") }
  /// Label used when a podcast releases episodes every week
  internal static var releaseFrequencyWeekly: String { return L10n.tr("Localizable", "release_frequency_weekly", fallback: "Weekly") }
  /// A common string used throughout the app. Prompt to remove the selected item(s).
  internal static var remove: String { return L10n.tr("Localizable", "remove", fallback: "Remove") }
  /// A common string used throughout the app. Prompt to remove all of the selected item(s).
  internal static var removeAll: String { return L10n.tr("Localizable", "remove_all", fallback: "Remove All") }
  /// A common string used throughout the app. Prompt to delete the selected item(s) local file download.
  internal static var removeDownload: String { return L10n.tr("Localizable", "remove_download", fallback: "Remove Download") }
  /// A common string used throughout the app. Prompt to remove the selected item(s) from the up next queue.
  internal static var removeFromUpNext: String { return L10n.tr("Localizable", "remove_from_up_next", fallback: "Remove From Up Next") }
  /// A common string used throughout the app. Prompt to remove the selected item(s) from the up next queue. Shorter form of 'Remove From Up Next' to conserve space on the Apple Watch.
  internal static var removeUpNext: String { return L10n.tr("Localizable", "remove_up_next", fallback: "Remove Up Next") }
  /// A common string used throughout the app. Prompt to retry the recent request.
  internal static var retry: String { return L10n.tr("Localizable", "retry", fallback: "Retry") }
  /// A common string used throughout the app. Placeholder text used in search boxes.
  internal static var search: String { return L10n.tr("Localizable", "search", fallback: "Search") }
  /// A common string used throughout the app when searching podcasts. Placeholder text used in search boxes.
  internal static var searchPodcasts: String { return L10n.tr("Localizable", "search_podcasts", fallback: "Search Podcasts") }
  /// A common string used throughout the app. Refers to the season a podcast episode is in.
  internal static var season: String { return L10n.tr("Localizable", "season", fallback: "Season") }
  /// Shorthand format used to show the Season and the Episode number of a podcast. 'S' is short for Season. '%1$@' is a placeholder for the season number. 'E' is short for Episode. '%2$@' is a placeholder for the episode number.
  internal static func seasonEpisodeShorthandFormat(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "season_episode_shorthand_format", String(describing: p1), String(describing: p2), fallback: "S%1$@ E%2$@")
  }
  /// Shorthand format used to show the Season number of a podcast. 'S' is short for Season. '%1$@' is a placeholder for the season number.
  internal static func seasonOnlyShorthandFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "season_only_shorthand_format", String(describing: p1), fallback: "S%1$@")
  }
  /// Label shown for seconds listened when it's plural, eg: 15 seconds listened.
  internal static var secondsListened: String { return L10n.tr("Localizable", "seconds_listened", fallback: "Seconds listened") }
  /// Label shown for seconds saved when it's plural, eg: 15 seconds saved.
  internal static var secondsSaved: String { return L10n.tr("Localizable", "seconds_saved", fallback: "Seconds saved") }
  /// A common string used throughout the app. Prompt to select items.
  internal static var select: String { return L10n.tr("Localizable", "select", fallback: "Select") }
  /// A common string used throughout the app. Prompt to select all items in the presented list.
  internal static var selectAll: String { return L10n.tr("Localizable", "select_all", fallback: "Select All") }
  /// A common string used throughout the app. Prompt to select all items above the currently selected item.
  internal static var selectAllAbove: String { return L10n.tr("Localizable", "select_all_above", fallback: "Select all above") }
  /// A common string used throughout the app. Prompt to select all items below the currently selected item.
  internal static var selectAllBelow: String { return L10n.tr("Localizable", "select_all_below", fallback: "Select all below") }
  /// A common string used throughout the app. Prompt to select episodes in the presented list.
  internal static var selectEpisodes: String { return L10n.tr("Localizable", "select_episodes", fallback: "Select Episodes") }
  /// A common string used throughout the app. Indicates the number of selected items. '%1$@' is a placeholder for the selected items.
  internal static func selectedCountFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "selected_count_format", String(describing: p1), fallback: "%1$@ selected")
  }
  /// Server error message for when the user tries to upload a file that is too large.
  internal static var serverErrorFilesFileTooLarge: String { return L10n.tr("Localizable", "server_error_files_file_too_large", fallback: "This file is too big too upload.") }
  /// Server error message for when the user tries to upload a file with an invalid file type.
  internal static var serverErrorFilesInvalidContentType: String { return L10n.tr("Localizable", "server_error_files_invalid_content_type", fallback: "Unable to upload, as we're unable to determine the content type of this file.") }
  /// Server error message for when the user tries to upload a file while not logged in.
  internal static var serverErrorFilesInvalidUser: String { return L10n.tr("Localizable", "server_error_files_invalid_user", fallback: "User is not logged in.") }
  /// Server error message for when the user tries to upload a file but doesn't have sufficient space remaining.
  internal static var serverErrorFilesStorageLimitExceeded: String { return L10n.tr("Localizable", "server_error_files_storage_limit_exceeded", fallback: "You have exceeded the storage limit for your account.") }
  /// Server error message for when the user tries to upload a file without a title.
  internal static var serverErrorFilesTitleRequired: String { return L10n.tr("Localizable", "server_error_files_title_required", fallback: "Title is required.") }
  /// Server error message indicating a generic error for when the file uploads fail.
  internal static var serverErrorFilesUploadFailedGeneric: String { return L10n.tr("Localizable", "server_error_files_upload_failed_generic", fallback: "Unable to upload file, please try again later.") }
  /// Server error message for when a file upload files because a unique identifier failed wasn't created.
  internal static var serverErrorFilesUuidRequired: String { return L10n.tr("Localizable", "server_error_files_uuid_required", fallback: "File uuid is required.") }
  /// Server error message for when the user account has been locked.
  internal static var serverErrorLoginAccountLocked: String { return L10n.tr("Localizable", "server_error_login_account_locked", fallback: "Your account has been locked due too many login attempts, please try again later.") }
  /// Server error message for when the user attempted to login without their email.
  internal static var serverErrorLoginEmailBlank: String { return L10n.tr("Localizable", "server_error_login_email_blank", fallback: "Enter an email address.") }
  /// Server error message for when the user enters an invalid email.
  internal static var serverErrorLoginEmailInvalid: String { return L10n.tr("Localizable", "server_error_login_email_invalid", fallback: "Invalid email") }
  /// Server error message for when the user's email couldn't be identified on the server .
  internal static var serverErrorLoginEmailNotFound: String { return L10n.tr("Localizable", "server_error_login_email_not_found", fallback: "Email not found") }
  /// Server error message for when the user tries to create an account for an email tied to an existing account.
  internal static var serverErrorLoginEmailTaken: String { return L10n.tr("Localizable", "server_error_login_email_taken", fallback: "Email taken") }
  /// Server error message for when the user attempted to login without their password.
  internal static var serverErrorLoginPasswordBlank: String { return L10n.tr("Localizable", "server_error_login_password_blank", fallback: "Enter a password.") }
  /// Server error message for when the user enters an invalid password.
  internal static var serverErrorLoginPasswordIncorrect: String { return L10n.tr("Localizable", "server_error_login_password_incorrect", fallback: "Incorrect password") }
  /// Server error message for when the user enters an invalid password.
  internal static var serverErrorLoginPasswordInvalid: String { return L10n.tr("Localizable", "server_error_login_password_invalid", fallback: "Invalid password") }
  /// Server error message for when the user tries to access a feature they don't have access to.
  internal static var serverErrorLoginPermissionDeniedNotAdmin: String { return L10n.tr("Localizable", "server_error_login_permission_denied_not_admin", fallback: "Permission denied") }
  /// Server error message for when the server failed to create the account fro the user.
  internal static var serverErrorLoginUnableToCreateAccount: String { return L10n.tr("Localizable", "server_error_login_unable_to_create_account", fallback: "We couldn't set up that account, sorry.") }
  /// Server error message for when the server failed to create the account fro the user.
  internal static var serverErrorLoginUserRegisterFailed: String { return L10n.tr("Localizable", "server_error_login_user_register_failed", fallback: "Unable to create account, please try again later") }
  /// Server error message for when the user tries to redeem a promo when they are already a plus subscriber.
  internal static var serverErrorPromoAlreadyPlus: String { return L10n.tr("Localizable", "server_error_promo_already_plus", fallback: "You are already a Pocket Casts Plus subscriber, there's no need to redeem any codes.") }
  /// Server error message for when the user tries to redeem a promo code that has already been used.
  internal static var serverErrorPromoAlreadyRedeemed: String { return L10n.tr("Localizable", "server_error_promo_already_redeemed", fallback: "You have already claimed this promo code. It was worth a shot though!") }
  /// Server error message for when the user attempts to redeem a promo code that is no longer active.
  internal static var serverErrorPromoCodeExpiredOrInvalid: String { return L10n.tr("Localizable", "server_error_promo_code_expired_or_invalid", fallback: "This promo code has expired or is invalid.") }
  /// Generic server error message for when an unexpected or unhandled issue occurred.
  internal static var serverErrorUnknown: String { return L10n.tr("Localizable", "server_error_unknown", fallback: "Something went wrong") }
  /// Server message thanking the user for signing up to the service.
  internal static var serverMessageLoginThanksSigningUp: String { return L10n.tr("Localizable", "server_message_login_thanks_signing_up", fallback: "Thanks for signing up!") }
  /// A common string used throughout the app. Reference to the settings menus.
  internal static var settings: String { return L10n.tr("Localizable", "settings", fallback: "Settings") }
  /// A common string used throughout the app. Refers to the About settings menu
  internal static var settingsAbout: String { return L10n.tr("Localizable", "settings_about", fallback: "About") }
  /// A common string used throughout the app. Refers to the Appearance settings menu.
  internal static var settingsAppearance: String { return L10n.tr("Localizable", "settings_appearance", fallback: "Appearance") }
  /// Provides a prompt for the user to configure the settings related to Inactive Episodes. Used in places like configuring Auto Archive settings.
  internal static var settingsArchiveInactiveEpisodes: String { return L10n.tr("Localizable", "settings_archive_inactive_episodes", fallback: "Inactive Episodes") }
  /// Title for the options menu to configure the settings related to archiving Inactive Episodes.
  internal static var settingsArchiveInactiveTitle: String { return L10n.tr("Localizable", "settings_archive_inactive_title", fallback: "Archive Inactive") }
  /// Provides a prompt for the user to configure the settings related to Played Episodes. Used in places like configuring Auto Archive settings.
  internal static var settingsArchivePlayedEpisodes: String { return L10n.tr("Localizable", "settings_archive_played_episodes", fallback: "Played Episodes") }
  /// Title for the options menu to configure the settings related to archiving Played Episodes.
  internal static var settingsArchivePlayedTitle: String { return L10n.tr("Localizable", "settings_archive_played_title", fallback: "Archive Played") }
  /// A common string used throughout the app. Refers to the Auto Add to Up Next settings menu
  internal static var settingsAutoAdd: String { return L10n.tr("Localizable", "settings_auto_add", fallback: "Auto Add to Up Next") }
  /// Prompt to select the episode limit for auto adding podcasts to the Up Next Queue.
  internal static var settingsAutoAddLimit: String { return L10n.tr("Localizable", "settings_auto_add_limit", fallback: "Auto Add Limit") }
  /// Prompt to select the behavior of the app if the auto add limit has been reached.
  internal static var settingsAutoAddLimitReached: String { return L10n.tr("Localizable", "settings_auto_add_limit_reached", fallback: "If Limit Reached") }
  /// Subtitle explaining the app's behavior when the episode limit is reached and new episodes are not add to the Up Next Queue. '%1$@' is a placeholder for the auto add limit.
  internal static func settingsAutoAddLimitSubtitleStop(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_auto_add_limit_subtitle_stop", String(describing: p1), fallback: "New episodes will stop being added when Up Next reaches %1$@ episodes.")
  }
  /// Subtitle explaining the app's behavior when the episode limit is reached and new episodes are added to the top of the Up Next Queue. '%1$@' is a placeholder for the auto add limit.
  internal static func settingsAutoAddLimitSubtitleTop(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_auto_add_limit_subtitle_top", String(describing: p1), fallback: "When Up Next reaches %1$@, new episodes auto-added to the top will remove the last episode in the queue. No new episodes will be added to the bottom.")
  }
  /// Section header that displays all of the Podcasts that will automatically add new episodes to the Up Next Queue.
  internal static var settingsAutoAddPodcasts: String { return L10n.tr("Localizable", "settings_auto_add_podcasts", fallback: "Auto-Add Podcasts") }
  /// A common string used throughout the app. Refers to the Auto Archive settings menu
  internal static var settingsAutoArchive: String { return L10n.tr("Localizable", "settings_auto_archive", fallback: "Auto Archive") }
  /// Setting to auto archive a podcast episode. This value will auto archive the episode after 1 Week has passed.
  internal static var settingsAutoArchive1Week: String { return L10n.tr("Localizable", "settings_auto_archive_1_week", fallback: "After 1 Week") }
  /// Setting to auto archive a podcast episode. This value will auto archive the episode after 24 Hours has passed.
  internal static var settingsAutoArchive24Hours: String { return L10n.tr("Localizable", "settings_auto_archive_24_hours", fallback: "After 24 Hours") }
  /// Setting to auto archive a podcast episode. This value will auto archive the episode after 2 Days has passed.
  internal static var settingsAutoArchive2Days: String { return L10n.tr("Localizable", "settings_auto_archive_2_days", fallback: "After 2 Days") }
  /// Setting to auto archive a podcast episode. This value will auto archive the episode after 2 Weeks has passed.
  internal static var settingsAutoArchive2Weeks: String { return L10n.tr("Localizable", "settings_auto_archive_2_weeks", fallback: "After 2 Weeks") }
  /// Setting to auto archive a podcast episode. This value will auto archive the episode after 30 Days has passed.
  internal static var settingsAutoArchive30Days: String { return L10n.tr("Localizable", "settings_auto_archive_30_days", fallback: "After 30 Days") }
  /// Setting to auto archive a podcast episode. This value will auto archive the episode after 3 Months has passed.
  internal static var settingsAutoArchive3Months: String { return L10n.tr("Localizable", "settings_auto_archive_3_months", fallback: "After 3 Months") }
  /// Prompt for the toggle to include starred episodes when auto archiving.
  internal static var settingsAutoArchiveIncludeStarred: String { return L10n.tr("Localizable", "settings_auto_archive_include_starred", fallback: "Include Starred Episodes") }
  /// Subtitle for the toggle to include starred episodes when auto archiving. This is the text that will be shown when the toggle is on.
  internal static var settingsAutoArchiveIncludeStarredOffSubtitle: String { return L10n.tr("Localizable", "settings_auto_archive_include_starred_off_subtitle", fallback: "Starred episodes won't be auto archived") }
  /// Subtitle for the toggle to include starred episodes when auto archiving. This is the text that will be shown when the toggle is on.
  internal static var settingsAutoArchiveIncludeStarredOnSubtitle: String { return L10n.tr("Localizable", "settings_auto_archive_include_starred_on_subtitle", fallback: "Starred episodes will be auto archived") }
  /// Subtitle for the main section of auto archive settings. This section sets the time limits or event triggers for when episodes are auto archived.
  internal static var settingsAutoArchiveSubtitle: String { return L10n.tr("Localizable", "settings_auto_archive_subtitle", fallback: "Archive episodes after set time limits. Downloads are removed when the episode is archived.") }
  /// A common string used throughout the app. Refers to the Auto Download settings menu
  internal static var settingsAutoDownload: String { return L10n.tr("Localizable", "settings_auto_download", fallback: "Auto Download") }
  /// Label indicating the number of selected filters. '%1$@' is a placeholder for the number of filters selected.
  internal static func settingsAutoDownloadsFiltersSelectedFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_auto_downloads_filters_selected_format", String(describing: p1), fallback: "%1$@ filters selected")
  }
  /// Label indicating the number of selected filters. This is the singular form for an accompanying plural option.
  internal static var settingsAutoDownloadsFiltersSelectedSingular: String { return L10n.tr("Localizable", "settings_auto_downloads_filters_selected_singular", fallback: "1 filter selected") }
  /// Label indicating no filters have been selected.
  internal static var settingsAutoDownloadsNoFiltersSelected: String { return L10n.tr("Localizable", "settings_auto_downloads_no_filters_selected", fallback: "No Filters Selected") }
  /// Label indicating no podcasts have been selected.
  internal static var settingsAutoDownloadsNoPodcastsSelected: String { return L10n.tr("Localizable", "settings_auto_downloads_no_podcasts_selected", fallback: "No Podcasts Selected") }
  /// Label indicating the number of selected podcasts. '%1$@' is a placeholder for the number of podcasts selected.
  internal static func settingsAutoDownloadsPodcastsSelectedFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_auto_downloads_podcasts_selected_format", String(describing: p1), fallback: "%1$@ podcasts selected")
  }
  /// Label indicating the number of selected podcasts. This is the singular form for an accompanying plural option.
  internal static var settingsAutoDownloadsPodcastsSelectedSingular: String { return L10n.tr("Localizable", "settings_auto_downloads_podcasts_selected_singular", fallback: "1 podcast selected") }
  /// Subtitle explaining the toggle to auto download the top episodes of a filter.
  internal static var settingsAutoDownloadsSubtitleFilters: String { return L10n.tr("Localizable", "settings_auto_downloads_subtitle_filters", fallback: "Download the top episodes in a filter.") }
  /// Subtitle explaining the toggle to auto download New Episodes.
  internal static var settingsAutoDownloadsSubtitleNewEpisodes: String { return L10n.tr("Localizable", "settings_auto_downloads_subtitle_new_episodes", fallback: "Download new episodes when they are released.") }
  /// Subtitle explaining the toggle to auto download items in the Up Next Queue.
  internal static var settingsAutoDownloadsSubtitleUpNext: String { return L10n.tr("Localizable", "settings_auto_downloads_subtitle_up_next", fallback: "Download episodes added to Up Next.") }
  /// Section Header for selecting the options for setting the app badge based on the user's filters.
  internal static var settingsBadgeFilterHeader: String { return L10n.tr("Localizable", "settings_badge_filter_header", fallback: "EPISODE FILTER COUNT") }
  /// Option for setting the app badge based on the new episodes since the app opened.
  internal static var settingsBadgeNewSinceOpened: String { return L10n.tr("Localizable", "settings_badge_new_since_opened", fallback: "New Since App Opened") }
  /// Option for setting the app badge based on the total unplayed episodes.
  internal static var settingsBadgeTotalUnplayed: String { return L10n.tr("Localizable", "settings_badge_total_unplayed", fallback: "Total Unplayed") }
  /// Label displayed right next the button to opt-in/out for Analytics tracking
  internal static var settingsCollectInformation: String { return L10n.tr("Localizable", "settings_collect_information", fallback: "Collect information") }
  /// Additional information about how the information collected is and how it's used
  internal static var settingsCollectInformationAdditionalInformation: String { return L10n.tr("Localizable", "settings_collect_information_additional_information", fallback: "Allowing us to collect analytics helps us build a better app. We understand if you would prefer not to share this information.") }
  /// Prompt to open the menu to create a new Siri shortcut. 'Siri' refers to Apple's voice assistant.
  internal static var settingsCreateSiriShortcut: String { return L10n.tr("Localizable", "settings_create_siri_shortcut", fallback: "Create Siri Shortcut") }
  /// Informational message to accompany a prompt to create a Siri Shortcut. 'Siri' refers to Apple's voice assistant. '%1$@' is a placeholder for the podcasts name.
  internal static func settingsCreateSiriShortcutMsg(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_create_siri_shortcut_msg", String(describing: p1), fallback: "Create a Siri Shortcut to play the newest episode of %1$@")
  }
  /// A common string used throughout the app. Indicates an option(s) to customize the settings for this podcast.
  internal static var settingsCustom: String { return L10n.tr("Localizable", "settings_custom", fallback: "Custom For This Podcast") }
  /// A message accompanying the toggle to enable auto archive settings that are specific to the selected podcast.
  internal static var settingsCustomAutoArchiveMsg: String { return L10n.tr("Localizable", "settings_custom_auto_archive_msg", fallback: "Need more fine grained control? Enable auto-archive settings for this podcast") }
  /// A message accompanying the toggle to set custom settings for a particular podcast.
  internal static var settingsCustomMsg: String { return L10n.tr("Localizable", "settings_custom_msg", fallback: "Pocket Casts will remember your last playback effects and use them on all podcasts. You can enable this if you want to create custom ones for just this podcast.") }
  /// Provides a prompt for the user to configure the settings related to episode limits. This controls how many episodes will be preserved before auto archiving them.
  internal static var settingsEpisodeLimit: String { return L10n.tr("Localizable", "settings_episode_limit", fallback: "Episode Limit") }
  /// Informs the user of max episode count for the up next queue. This value is configurable. '%1$@' is a placeholder for the current value as set by the user.
  internal static func settingsEpisodeLimitFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_episode_limit_format", String(describing: p1), fallback: "%1$@ Episode Limit")
  }
  /// A format for values accompanying the setting to auto archive based on a set limit. '%1$@' is a placeholder for the number of episodes that will be saved before auto archiving the oldest ones.
  internal static func settingsEpisodeLimitLimitFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_episode_limit_limit_format", String(describing: p1), fallback: "%1$@ most recent")
  }
  /// A message accompanying the episode limit settings providing a hint towards one use case for this feature.
  internal static var settingsEpisodeLimitMsg: String { return L10n.tr("Localizable", "settings_episode_limit_msg", fallback: "For shows that release hourly or daily episodes, setting an episode limit can help keep only the most recent ones, while archiving any that are older.") }
  /// A value accompanying the setting to auto archive based on a set limit. This value disables the feature.
  internal static var settingsEpisodeLimitNoLimit: String { return L10n.tr("Localizable", "settings_episode_limit_no_limit", fallback: "No Limit") }
  /// Alert title informing the user that the OPML export has encountered an error. 'OPML' refers to the file type that will be exported.
  internal static var settingsExportError: String { return L10n.tr("Localizable", "settings_export_error", fallback: "Export Error") }
  /// Alert message informing the user that the OPML export has encountered an error. 'OPML' refers to the file type that will be exported.
  internal static var settingsExportErrorMsg: String { return L10n.tr("Localizable", "settings_export_error_msg", fallback: "Unable to export OPML, please try again later.") }
  /// Alert title informing the user that the OPML export is processing. 'OPML' refers to the file type that will be exported.
  internal static var settingsExportOpml: String { return L10n.tr("Localizable", "settings_export_opml", fallback: "Exporting OPML") }
  /// Informs the user that Pocket Casts has dedicated an issue with this podcasts feed.
  internal static var settingsFeedError: String { return L10n.tr("Localizable", "settings_feed_error", fallback: "Feed Error") }
  /// Informs the user that Pocket Casts has stopped updating this feed due to too many errors. Provides a prompt to tap the refresh button that is presented above this message box.
  internal static var settingsFeedErrorMsg: String { return L10n.tr("Localizable", "settings_feed_error_msg", fallback: "The feed for this podcast stopped updating because it had too many errors. Tap above to fix this.") }
  /// Title used in a dialog box. Prompt user to try refreshing the feed after encountering an error.
  internal static var settingsFeedFixRefresh: String { return L10n.tr("Localizable", "settings_feed_fix_refresh", fallback: "Try To Update It") }
  /// The message body for a dialog box used to inform the user the request to update the feed has failed.
  internal static var settingsFeedFixRefreshFailedMsg: String { return L10n.tr("Localizable", "settings_feed_fix_refresh_failed_msg", fallback: "Unable to update this feed, please try again later.") }
  /// The title for a dialog box used to inform the user that the request to update the feed has failed.
  internal static var settingsFeedFixRefreshFailedTitle: String { return L10n.tr("Localizable", "settings_feed_fix_refresh_failed_title", fallback: "Update Failed") }
  /// The message body for a dialog box used to inform the user that the an update to the feed has been queued.
  internal static var settingsFeedFixRefreshSuccessMsg: String { return L10n.tr("Localizable", "settings_feed_fix_refresh_success_msg", fallback: "We've queued an update for this podcast. Our server will re-check it and if it works you should have new episodes soon. Please check back in about an hour.") }
  /// The title for a dialog box used to inform the user that the an update to the feed has been queued.
  internal static var settingsFeedFixRefreshSuccessTitle: String { return L10n.tr("Localizable", "settings_feed_fix_refresh_success_title", fallback: "Update Queued") }
  /// Informs the user that Pocket Casts has dedicated an issue with this podcasts feed.
  internal static var settingsFeedIssue: String { return L10n.tr("Localizable", "settings_feed_issue", fallback: "Feed Issue") }
  /// Informs the user that Pocket Casts has stopped updating this feed due to too many errors.
  internal static var settingsFeedIssueMsg: String { return L10n.tr("Localizable", "settings_feed_issue_msg", fallback: "The feed for this podcast stopped updating because it had too many errors.") }
  /// Prompt to navigate the user to the files setting screen.
  internal static var settingsFiles: String { return L10n.tr("Localizable", "settings_files", fallback: "Files Settings") }
  /// Subtitle for the toggle to auto add new files to the Up Next Queue.
  internal static var settingsFilesAddUpNextSubtitle: String { return L10n.tr("Localizable", "Settings_files_add_up_next_subtitle", fallback: "Add new files to Up Next automatically") }
  /// Prompt for the toggle to enable auto downloads for uploaded files.
  internal static var settingsFilesAutoDownload: String { return L10n.tr("Localizable", "settings_files_auto_download", fallback: "Auto Download from Cloud") }
  /// Subtitle explaining the app behavior when the toggle to for auto downloads for uploaded files is off.
  internal static var settingsFilesAutoDownloadSubtitleOff: String { return L10n.tr("Localizable", "settings_files_auto_download_subtitle_off", fallback: "Files added to the cloud from other devices will not be automatically downloaded.") }
  /// Subtitle explaining the app behavior when the toggle to for auto downloads for uploaded files is on.
  internal static var settingsFilesAutoDownloadSubtitleOn: String { return L10n.tr("Localizable", "settings_files_auto_download_subtitle_on", fallback: "Files added to the cloud from other devices will be automatically downloaded.") }
  /// Prompt for the toggle to enable auto uploads for uploaded files.
  internal static var settingsFilesAutoUpload: String { return L10n.tr("Localizable", "settings_files_auto_upload", fallback: "Auto Upload to Cloud") }
  /// Subtitle explaining the app behavior when the toggle to for auto uploads is off.
  internal static var settingsFilesAutoUploadSubtitleOff: String { return L10n.tr("Localizable", "settings_files_auto_upload_subtitle_off", fallback: "Files added to this device will not be automatically uploaded to the Cloud.") }
  /// Subtitle explaining the app behavior when the toggle to for auto uploads is on.
  internal static var settingsFilesAutoUploadSubtitleOn: String { return L10n.tr("Localizable", "settings_files_auto_upload_subtitle_on", fallback: "Files added to this device will be automatically uploaded to the Cloud.") }
  /// Prompt for the toggle to enable the option to delete the cloud file after playing.
  internal static var settingsFilesDeleteCloudFile: String { return L10n.tr("Localizable", "settings_files_delete_cloud_file", fallback: "Delete Cloud File") }
  /// Prompt for the toggle to enable the option to delete the local file after playing.
  internal static var settingsFilesDeleteLocalFile: String { return L10n.tr("Localizable", "settings_files_delete_local_file", fallback: "Delete Local File") }
  /// A common string used throughout the app. Reference to the General settings menu.
  internal static var settingsGeneral: String { return L10n.tr("Localizable", "settings_general", fallback: "General") }
  /// Confirmation to apply a setting change to all podcasts.
  internal static var settingsGeneralApplyAllConf: String { return L10n.tr("Localizable", "settings_general_apply_all_conf", fallback: "Apply to existing") }
  /// Prompt to apply a setting change to all podcasts.
  internal static var settingsGeneralApplyAllTitle: String { return L10n.tr("Localizable", "settings_general_apply_all_title", fallback: "Apply to existing podcasts?") }
  /// Setting option to choose the default display archived episodes.
  internal static var settingsGeneralArchivedEpisodes: String { return L10n.tr("Localizable", "settings_general_archived_episodes", fallback: "Archived Episodes") }
  /// Prompt to ask the user if they'd like to show/hide archived episodes for all podcasts. '%1$@' is a placeholder for a localized string 'show' or 'hide' based on the current setting.
  internal static func settingsGeneralArchivedEpisodesPromptFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_general_archived_episodes_prompt_format", String(describing: p1), fallback: "Would you like to change all your existing podcasts to %1$@ archived episodes?")
  }
  /// Setting toggle to enable the feature to automatically open the player when playback starts.
  internal static var settingsGeneralAutoOpenPlayer: String { return L10n.tr("Localizable", "settings_general_auto_open_player", fallback: "Open Player Automatically") }
  /// Section header for the general settings that are more general app related.
  internal static var settingsGeneralDefaultsHeader: String { return L10n.tr("Localizable", "settings_general_defaults_header", fallback: "DEFAULTS") }
  /// Setting option to choose the primary way in which episodes are grouped.
  internal static var settingsGeneralEpisodeGroups: String { return L10n.tr("Localizable", "settings_general_episode_groups", fallback: "Podcast Episode Grouping") }
  /// Setting option to choose to hide archived episodes.
  internal static var settingsGeneralHide: String { return L10n.tr("Localizable", "settings_general_hide", fallback: "Hide") }
  /// Setting toggle to enable the app to keep your screen awake.
  internal static var settingsGeneralKeepScreenAwake: String { return L10n.tr("Localizable", "settings_general_keep_screen_awake", fallback: "Keep Screen Awake") }
  /// Setting toggle to modify which bluetooth protocol to use.
  internal static var settingsGeneralLegacyBluetooth: String { return L10n.tr("Localizable", "settings_general_legacy_bluetooth", fallback: "Legacy Bluetooth Support") }
  /// Subtitle explaining the toggle to modify which bluetooth protocol to use.
  internal static var settingsGeneralLegacyBluetoothSubtitle: String { return L10n.tr("Localizable", "settings_general_legacy_bluetooth_subtitle", fallback: "If you have a Bluetooth Device or Car Stereo that seems to be pausing Pocket Casts while it's playing, or resetting the playback position to 0, try turning this setting on to fix it.") }
  /// Setting toggle to enable the gesture for multi-select.
  internal static var settingsGeneralMultiSelectGesture: String { return L10n.tr("Localizable", "settings_general_multi_select_gesture", fallback: "Multi-select Gesture") }
  /// Subtitle explaining the toggle to enable the gesture for multi-select.
  internal static var settingsGeneralMultiSelectGestureSubtitle: String { return L10n.tr("Localizable", "settings_general_multi_select_gesture_subtitle", fallback: "Multi-select by dragging 2 fingers down on any episode list. Turn this off if you find yourself triggering this accidentally or it interferes with the accessibility features you use.") }
  /// Option to not move forward with a prompt to apply to all podcasts.
  internal static var settingsGeneralNoThanks: String { return L10n.tr("Localizable", "settings_general_no_thanks", fallback: "No thanks") }
  /// Setting toggle to enable the app to open the links in an external browser.
  internal static var settingsGeneralOpenInBrowser: String { return L10n.tr("Localizable", "settings_general_open_in_browser", fallback: "Open Links In Browser") }
  /// Setting toggle to modify what controls are available on the lock screen.
  internal static var settingsGeneralPlayBackActions: String { return L10n.tr("Localizable", "settings_general_play_back_actions", fallback: "Extra Playback Actions") }
  /// Subtitle explaining the toggle to modify what controls are available on the lock screen.
  internal static var settingsGeneralPlayBackActionsSubtitle: String { return L10n.tr("Localizable", "settings_general_play_back_actions_subtitle", fallback: "Adds a mark played and star option to your phone lock screen and CarPlay. Note: on the lock screen this will replace the skip back button.") }
  /// Section header for the general settings that are more player related.
  internal static var settingsGeneralPlayerHeader: String { return L10n.tr("Localizable", "settings_general_player_header", fallback: "PLAYER") }
  /// Setting toggle to enable publishing chapter titles to the device's "Now Playing Info Center" data used by bluetooth and other connected devices.
  internal static var settingsGeneralPublishChapterTitles: String { return L10n.tr("Localizable", "settings_general_publish_chapter_titles", fallback: "Publish Chapter Titles") }
  /// Subtitle explaining the toggle to publish chapter titles.
  internal static var settingsGeneralPublishChapterTitlesSubtitle: String { return L10n.tr("Localizable", "settings_general_publish_chapter_titles_subtitle", fallback: "If on, this will send chapter titles over Bluetooth and other connected devices instead of the episode title.") }
  /// Setting toggle to change the behavior of the skip button on external devices.
  internal static var settingsGeneralRemoteSkipsChapters: String { return L10n.tr("Localizable", "settings_general_remote_skips_chapters", fallback: "Remote Skips Chapters") }
  /// Subtitle explaining the toggle to change the behavior of the skip button on external devices.
  internal static var settingsGeneralRemoteSkipsChaptersSubtitle: String { return L10n.tr("Localizable", "settings_general_remote_skips_chapters_subtitle", fallback: "When enabled and an episode has chapters, pressing the skip button in your car or headphones will skip to the next chapter.") }
  /// Prompt to ask the user if they'd like to remove the grouping from all podcasts.
  internal static var settingsGeneralRemoveGroupsApplyAll: String { return L10n.tr("Localizable", "settings_general_remove_groups_apply_all", fallback: "Would you like to change all your existing podcasts to be not be grouped as well?") }
  /// Setting option to choose the default action when selecting an episode row.
  internal static var settingsGeneralRowAction: String { return L10n.tr("Localizable", "settings_general_row_action", fallback: "Row Action") }
  /// Prompt to ask the user if they'd like to apply the grouping to all podcasts. '%1$@' is a placeholder for a localized name for the grouping type.
  internal static func settingsGeneralSelectedGroupApplyAll(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_general_selected_group_apply_all", String(describing: p1), fallback: "Would you like to change all your existing podcasts to be grouped by %1$@?")
  }
  /// Setting option to choose to show archived episodes.
  internal static var settingsGeneralShow: String { return L10n.tr("Localizable", "settings_general_show", fallback: "Show") }
  /// Setting toggle to enable the feature that adjusts the playback position when resuming.
  internal static var settingsGeneralSmartPlayback: String { return L10n.tr("Localizable", "settings_general_smart_playback", fallback: "Intelligent Playback Resumption") }
  /// Subtitle explaining the feature that adjusts the playback position when resuming.
  internal static var settingsGeneralSmartPlaybackSubtitle: String { return L10n.tr("Localizable", "settings_general_smart_playback_subtitle", fallback: "If on, Pocket Casts will go back a little in episodes you resume so you can catch up more comfortably.") }
  /// Setting option to choose how to handle swiping to add something to the queue.
  internal static var settingsGeneralUpNextSwipe: String { return L10n.tr("Localizable", "settings_general_up_next_swipe", fallback: "Up Next Swipe") }
  /// Setting toggle to modify how a tap is handled in the up next queue.
  internal static var settingsGeneralUpNextTap: String { return L10n.tr("Localizable", "settings_general_up_next_tap", fallback: "Play Up Next On Tap") }
  /// Subtitle explaining the toggle to modify how a tap is handled in the up next queue. This is used when the toggle is off.
  internal static var settingsGeneralUpNextTapOffSubtitle: String { return L10n.tr("Localizable", "settings_general_up_next_tap_off_subtitle", fallback: "Tapping an episode in Up Next shows the actions page. Long press plays the episode. Turn on to switch these around.") }
  /// Subtitle explaining the toggle to modify how a tap is handled in the up next queue. This is used when the toggle is on.
  internal static var settingsGeneralUpNextTapOnSubtitle: String { return L10n.tr("Localizable", "settings_general_up_next_tap_on_subtitle", fallback: "Tapping an episode in Up Next will play it. Long press shows episode options. Turn off to switch these around.") }
  /// Title for the menu that takes you to the global up next queue settings
  internal static var settingsGlobalSettings: String { return L10n.tr("Localizable", "settings_global_settings", fallback: "Global Settings") }
  /// A common string used throughout the app. Refers to the Help & Feedback settings menu
  internal static var settingsHelp: String { return L10n.tr("Localizable", "settings_help", fallback: "Help & Feedback") }
  /// Title for the screen that manages the importing and exporting of podcasts.
  internal static var settingsImportExport: String { return L10n.tr("Localizable", "settings_import_export", fallback: "Import / Export") }
  /// Informs the user that the current podcast is included in one filter. '%1$@' is a placeholder for the number of filters this podcast is included in.
  internal static func settingsInFiltersPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_in_filters_plural_format", String(describing: p1), fallback: "Included In %1$@ Filter")
  }
  /// Informs the user that the current podcast is included in one filter. This is the singular form of an accompanying plural string.
  internal static var settingsInFiltersSingular: String { return L10n.tr("Localizable", "settings_in_filters_singular", fallback: "Included In 1 Filter") }
  /// Setting section header. Indicates that the options in this section will appear in the menu vs an action bar.
  internal static var settingsInMenu: String { return L10n.tr("Localizable", "settings_in_menu", fallback: "IN MENU") }
  /// A message accompanying the settings for inactive episodes explaining what is considered an inactive episode.
  internal static var settingsInactiveEpisodesMsg: String { return L10n.tr("Localizable", "settings_inactive_episodes_msg", fallback: "Inactive episodes are episodes you haven't played or downloaded in the time you specify above. Downloads are removed when the episode is archived.") }
  /// Informs the user that the current podcast isn't included in any filters.
  internal static var settingsNotInFilters: String { return L10n.tr("Localizable", "settings_not_in_filters", fallback: "Not Included In Any Filters") }
  /// A common string used throughout the app. Refers to the Notifications settings menu.
  internal static var settingsNotifications: String { return L10n.tr("Localizable", "settings_notifications", fallback: "Notifications") }
  /// App badge choice to have the badge reflect the filter count
  internal static var settingsNotificationsFilterCount: String { return L10n.tr("Localizable", "settings_notifications_filter_count", fallback: "Filter count") }
  /// Subtitle explaining what notifications to expect when you enable notifications.
  internal static var settingsNotificationsSubtitle: String { return L10n.tr("Localizable", "settings_notifications_subtitle", fallback: "Notifies you when a new episode is available. Also useful for improving the reliability of auto downloads.") }
  /// A common string used throughout the app. Refers to the Import/Export OPML settings menu
  internal static var settingsOpml: String { return L10n.tr("Localizable", "settings_opml", fallback: "Import/Export OPML") }
  /// Provides a prompt for the user to configure the playback speed options.
  internal static var settingsPlaySpeed: String { return L10n.tr("Localizable", "settings_play_speed", fallback: "Play Speed") }
  /// Informational label breaking down the pricing structure for Pocket Casts Plus. '%1$@' is a placeholder for the localized price if paid per month, '%2$@' is a placeholder for the localized price if paid per year
  internal static func settingsPlusPricingFormat(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "settings_plus_pricing_format", String(describing: p1), String(describing: p2), fallback: "%1$@ per month / %2$@ per year")
  }
  /// A common string used throughout the app. Refers to the Privacy settings menu
  internal static var settingsPrivacy: String { return L10n.tr("Localizable", "settings_privacy", fallback: "Privacy") }
  /// Title for the options to configure the queue position when a podcast is set to be auto added to the up next queue.
  internal static var settingsQueuePosition: String { return L10n.tr("Localizable", "settings_queue_position", fallback: "Position in Queue") }
  /// Label for an input that takes the user to the privacy policy
  internal static var settingsReadPrivacyPolicy: String { return L10n.tr("Localizable", "settings_read_privacy_policy", fallback: "Read privacy policy") }
  /// Prompt to select a filter
  internal static var settingsSelectFilterSingular: String { return L10n.tr("Localizable", "settings_select_filter_singular", fallback: "Select Filter") }
  /// Prompt to select filters
  internal static var settingsSelectFiltersPlural: String { return L10n.tr("Localizable", "settings_select_filters_plural", fallback: "Select Filters") }
  /// Option for the filter Siri Shortcut. This sets the app to open the filter when the shortcut is triggered.
  internal static var settingsShortcutsFilterOpenFilter: String { return L10n.tr("Localizable", "settings_shortcuts_filter_open_filter", fallback: "Open Filter") }
  /// Option for the filter Siri Shortcut. This sets the filter to play all episodes in the filter when the shortcut is triggered.
  internal static var settingsShortcutsFilterPlayAllEpisodes: String { return L10n.tr("Localizable", "settings_shortcuts_filter_play_all_episodes", fallback: "Play all episodes") }
  /// Option for the filter Siri Shortcut. This sets the filter to play the top episode in the filter when the shortcut is triggered.
  internal static var settingsShortcutsFilterPlayTopEpisode: String { return L10n.tr("Localizable", "settings_shortcuts_filter_play_top_episode", fallback: "Play the top episode") }
  /// Prompt to open the menu to interact with a pre-configured Siri shortcut. 'Siri' refers to Apple's voice assistant.
  internal static var settingsSiriShortcut: String { return L10n.tr("Localizable", "settings_siri_shortcut", fallback: "Siri Shortcut") }
  /// Informational message that accompanies an existing Siri shortcut for a particular podcast. 'Siri' refers to Apple's voice assistant. '%1$@' is a placeholder for the podcasts name.
  internal static func settingsSiriShortcutMsg(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_siri_shortcut_msg", String(describing: p1), fallback: "A Siri Shortcut to play the top episode in %1$@")
  }
  /// A common string used throughout the app. Refers to the Siri Shortcuts settings menu. 'Siri' refers to Apple's voice assistant.
  internal static var settingsSiriShortcuts: String { return L10n.tr("Localizable", "settings_siri_shortcuts", fallback: "Siri Shortcuts") }
  /// Section header for the available Siri shortcuts (not yet enabled).
  internal static var settingsSiriShortcutsAvailable: String { return L10n.tr("Localizable", "settings_siri_shortcuts_available", fallback: "Available shortcuts") }
  /// Section header for the enabled Siri shortcuts.
  internal static var settingsSiriShortcutsEnabled: String { return L10n.tr("Localizable", "settings_siri_shortcuts_enabled", fallback: "Enabled shortcuts") }
  /// Option to create a Siri Shortcut to a specific filter.
  internal static var settingsSiriShortcutsSpecificFilter: String { return L10n.tr("Localizable", "settings_siri_shortcuts_specific_filter", fallback: "Shortcut to a specific filter") }
  /// Option to create a Siri Shortcut to a specific podcast.
  internal static var settingsSiriShortcutsSpecificPodcast: String { return L10n.tr("Localizable", "settings_siri_shortcuts_specific_podcast", fallback: "Shortcut to a specific podcast") }
  /// Prompt to open the configurable options to have the podcast skip an initial portion of the selected podcast.
  internal static var settingsSkipFirst: String { return L10n.tr("Localizable", "settings_skip_first", fallback: "Skip First") }
  /// Prompt to open the configurable options to have the podcast skip the final portion of the selected podcast.
  internal static var settingsSkipLast: String { return L10n.tr("Localizable", "settings_skip_last", fallback: "Skip Last") }
  /// Fun informational message about the skip options available in the settings.
  internal static var settingsSkipMsg: String { return L10n.tr("Localizable", "settings_skip_msg", fallback: "Skip intro and outro music like the power user you were born to be.") }
  /// A common string used throughout the app. Refers to the Stats settings menu
  internal static var settingsStats: String { return L10n.tr("Localizable", "settings_stats", fallback: "Stats") }
  /// A common string used throughout the app. Refers to the Storage & Data Use settings menu.
  internal static var settingsStorage: String { return L10n.tr("Localizable", "settings_storage", fallback: "Storage & Data Use") }
  /// Prompt for the toggle that turns on the dialog that warns the user before using data.
  internal static var settingsStorageDataWarning: String { return L10n.tr("Localizable", "settings_storage_data_warning", fallback: "Warn Before Using Data") }
  /// Prompt for the toggle that will include starred files in the clean up operation.
  internal static var settingsStorageDownloadsStarred: String { return L10n.tr("Localizable", "settings_storage_downloads_starred", fallback: "Include Starred") }
  /// Section header for settings related to data usage.
  internal static var settingsStorageMobileData: String { return L10n.tr("Localizable", "settings_storage_mobile_data", fallback: "MOBILE DATA") }
  /// Section header for information about storage space used.
  internal static var settingsStorageUsage: String { return L10n.tr("Localizable", "settings_storage_usage", fallback: "USAGE") }
  /// Title for the settings screen
  internal static var settingsTitle: String { return L10n.tr("Localizable", "settings_title", fallback: "Podcast Settings") }
  /// Provides a prompt for the user to configure the sensitivity associated to the auto trimming silence setting.
  internal static var settingsTrimLevel: String { return L10n.tr("Localizable", "settings_trim_level", fallback: "Trim Level") }
  /// Provides a prompt for the user to configure the trim silence options.
  internal static var settingsTrimSilence: String { return L10n.tr("Localizable", "settings_trim_silence", fallback: "Trim Silence") }
  /// Informs the user about how the Queue will be adjusted when the episode limit is reached. '%1$@' is a placeholder for the current queue limit.
  internal static func settingsUpNextLimit(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_up_next_limit", String(describing: p1), fallback: "Automatically add new episodes to Up Next. New episodes will stop being added when Up Next reaches %1$@.")
  }
  /// Informs the user about how the Queue will be adjusted when the episode limit is reached. '%1$@' is a placeholder for the current queue limit.
  internal static func settingsUpNextLimitAddToTop(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_up_next_limit_add_to_top", String(describing: p1), fallback: "Automatically add new episodes to Up Next. When Up Next reaches %1$@, new episodes auto-added to the top will remove the last episode in the queue.")
  }
  /// Provides a prompt for the user to toggle on the volume boosting setting.
  internal static var settingsVolumeBoost: String { return L10n.tr("Localizable", "settings_volume_boost", fallback: "Volume Boost") }
  /// Prompt for the toggle that enables auto downloads for the Apple Watch app.
  internal static var settingsWatchAutoDownload: String { return L10n.tr("Localizable", "settings_watch_auto_download", fallback: "Auto Download Up Next") }
  /// Subtitle for the toggle that explains the behavior for the auto download feature for the Apple Watch app.
  internal static var settingsWatchAutoDownloadOffSubtitle: String { return L10n.tr("Localizable", "settings_watch_auto_download_off_subtitle", fallback: "Set the number of episodes from your Up Next queue Pocket Casts will download to your watch for offline playback.") }
  /// Prompt for the toggle that enables the feature to delete auto downloads that fall outside episode limit for the Apple Watch app.
  internal static var settingsWatchDeleteDownloads: String { return L10n.tr("Localizable", "settings_watch_delete_downloads", fallback: "Delete Downloads Outside Limit") }
  /// Subtitle explaining the behavior of the app for when the toggle to delete auto downloads is turned off.
  internal static var settingsWatchDeleteDownloadsOffSubtitle: String { return L10n.tr("Localizable", "settings_watch_delete_downloads_off_subtitle", fallback: "To conserve watch storage, a maximum of 25 episodes in your Up Next queue will be auto-downloaded. Older download files outside this limit will be automatically deleted.") }
  /// Subtitle explaining the behavior of the app for when the toggle to delete auto downloads is turned on.
  internal static var settingsWatchDeleteDownloadsOnSubtitle: String { return L10n.tr("Localizable", "settings_watch_delete_downloads_on_subtitle", fallback: "All download files in your Up Next queue that are outside this limit will be automatically deleted. Manual downloads aren't managed by these settings.") }
  /// Prompt for the option to select the number of episodes to auto downloads for the Apple Watch app.
  internal static var settingsWatchEpisodeLimit: String { return L10n.tr("Localizable", "settings_watch_episode_limit", fallback: "Number of Episodes") }
  /// Subtitle explaining for the option to select the number of episodes to auto downloads for the Apple Watch app. '%1$@' is a placeholder for the number of items to download.
  internal static func settingsWatchEpisodeLimitSubtitle(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_watch_episode_limit_subtitle", String(describing: p1), fallback: "Pocket Casts will download the top %1$@ episodes of your Up Next queue to your watch for offline playback.")
  }
  /// Prompt for the option format to select the number of episodes to auto downloads for the Apple Watch app. '%1$@' is a placeholder for the number of items to download
  internal static func settingsWatchEpisodeNumberOptionFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "settings_watch_episode_number_option_format", String(describing: p1), fallback: "Top %1$@")
  }
  /// Title for the options for the user to configure their account.
  internal static var setupAccount: String { return L10n.tr("Localizable", "setup_account", fallback: "Set Up Account") }
  /// A common string used throughout the app. Prompt to open the share settings for the selected item(s).
  internal static var share: String { return L10n.tr("Localizable", "share", fallback: "Share") }
  /// A common string used throughout the app. Option to share the episode at the current playback position.
  internal static var shareCurrentPosition: String { return L10n.tr("Localizable", "share_current_position", fallback: "Current Position") }
  /// Message indicating that the process to subscribe to a podcast list is in progress.
  internal static var shareListSubscribing: String { return L10n.tr("Localizable", "share_list_subscribing", fallback: "Subscribing...") }
  /// Message indicating that all of the podcasts have been selected.
  internal static var sharePodcastsAllSelected: String { return L10n.tr("Localizable", "share_podcasts_all_selected", fallback: "ALL SELECTED") }
  /// Title for the screen to finalize options to create a list of podcasts to share.
  internal static var sharePodcastsCreateList: String { return L10n.tr("Localizable", "share_podcasts_create_list", fallback: "Create List") }
  /// Message indicating that the process to share a podcast list is in progress.
  internal static var sharePodcastsSharing: String { return L10n.tr("Localizable", "share_podcasts_sharing", fallback: "Sharing...") }
  /// Error message for when sharing fails.
  internal static var sharePodcastsSharingFailedMsg: String { return L10n.tr("Localizable", "share_podcasts_sharing_failed_msg", fallback: "Something went wrong creating your share page") }
  /// Title indicating that sharing has failed.
  internal static var sharePodcastsSharingFailedTitle: String { return L10n.tr("Localizable", "share_podcasts_sharing_failed_title", fallback: "Sharing Failed") }
  /// A common string used throughout the app. Title for the screen to select multiple podcasts to share.
  internal static var shareSelectPodcasts: String { return L10n.tr("Localizable", "share_select_podcasts", fallback: "Select Podcasts") }
  /// Progress indicator informing the user that the item that has been sent to them via share is loading.
  internal static var sharedItemLoading: String { return L10n.tr("Localizable", "shared_item_loading", fallback: "Loading Shared Item...") }
  /// Title for the screen that shows the podcasts from a shared list of podcasts.
  internal static var sharedList: String { return L10n.tr("Localizable", "shared_list", fallback: "Shared List") }
  /// Confirmation option presented when a user selects to subscribe to all podcasts in a list.
  internal static var sharedListSubscribeConfAction: String { return L10n.tr("Localizable", "shared_list_subscribe_conf_action", fallback: "Heck Yes!") }
  /// Message for a dialog presented when a user selects to subscribe to all podcasts in a list. '%1$@' is a placeholder for the number of podcasts that will be subscribed to.
  internal static func sharedListSubscribeConfMsg(_ p1: Any) -> String {
    return L10n.tr("Localizable", "shared_list_subscribe_conf_msg", String(describing: p1), fallback: "Are you sure you want to subscribe to %1$@ podcasts?")
  }
  /// Title for a dialog presented when a user selects to subscribe to all podcasts in a list.
  internal static var sharedListSubscribeConfTitle: String { return L10n.tr("Localizable", "shared_list_subscribe_conf_title", fallback: "That's a lot of podcasts!") }
  /// A common string used throughout the app. Refers to the Notes (show notes) tab in the player.
  internal static var showNotes: String { return L10n.tr("Localizable", "show_notes", fallback: "Notes") }
  /// A common string used throughout the app. Prompt for the user to sign into their account.
  internal static var signIn: String { return L10n.tr("Localizable", "sign_in", fallback: "Sign In") }
  /// Email address field prompt
  internal static var signInEmailAddressPrompt: String { return L10n.tr("Localizable", "sign_in_email_address_prompt", fallback: "Email Address") }
  /// Button text to go to the forgot password page
  internal static var signInForgotPassword: String { return L10n.tr("Localizable", "sign_in_forgot_password", fallback: "I forgot my password") }
  /// Message shown below the sign in prompt to give users more details about what it does
  internal static var signInMessage: String { return L10n.tr("Localizable", "sign_in_message", fallback: "Save your podcast subscriptions in the cloud and sync your progress with other devices.") }
  /// Password field prompt
  internal static var signInPasswordPrompt: String { return L10n.tr("Localizable", "sign_in_password_prompt", fallback: "Password") }
  /// Prompt for the user to sign into their account or create an account
  internal static var signInPrompt: String { return L10n.tr("Localizable", "sign_in_prompt", fallback: "Sign in or create account") }
  /// Label indicating which account the user is signed into. The accounts email address is displayed in close proximity to this label.
  internal static var signedInAs: String { return L10n.tr("Localizable", "signed_in_as", fallback: "SIGNED IN AS") }
  /// Label indicating which account is not signed in.
  internal static var signedOut: String { return L10n.tr("Localizable", "signed_out", fallback: "Not Signed In") }
  /// Siri shortcut title for increasing the sleep timer by a specified amount. '%1$@' is the placeholder for the time specified amount or time.
  internal static func siriShortcutExtendSleepTimer(_ p1: Any) -> String {
    return L10n.tr("Localizable", "siri_shortcut_extend_sleep_timer", String(describing: p1), fallback: "Set sleep timer to %1$@")
  }
  /// Siri shortcut phrase for increasing the sleep timer by a specified amount.
  internal static var siriShortcutExtendSleepTimerFiveMin: String { return L10n.tr("Localizable", "siri_shortcut_extend_sleep_timer_five_min", fallback: "Extend sleep timer by 5 minutes") }
  /// Siri shortcut title and phrase for having siri skip to the next chapter of a podcast
  internal static var siriShortcutNextChapter: String { return L10n.tr("Localizable", "siri_shortcut_next_chapter", fallback: "Next chapter") }
  /// Siri shortcut invocation phrase for opening a specified filter. '%1$@' is the placeholder for the specified filter.
  internal static func siriShortcutOpenFilterPhrase(_ p1: Any) -> String {
    return L10n.tr("Localizable", "siri_shortcut_open_filter_phrase", String(describing: p1), fallback: "Open %1$@")
  }
  /// Siri shortcut invocation phrase for pausing the current episode
  internal static var siriShortcutPausePhrase: String { return L10n.tr("Localizable", "siri_shortcut_pause_phrase", fallback: "Pause") }
  /// Siri shortcut title for pausing the current episode
  internal static var siriShortcutPauseTitle: String { return L10n.tr("Localizable", "siri_shortcut_pause_title", fallback: "Pause Current Episode") }
  /// Siri shortcut invocation phrase for playing all episodes of a particular filter. '%1$@' is a placeholder for the name of the filter to play from
  internal static func siriShortcutPlayAllPhrase(_ p1: Any) -> String {
    return L10n.tr("Localizable", "siri_shortcut_play_all_phrase", String(describing: p1), fallback: "Play all %1$@")
  }
  /// Siri shortcut title for playing all episodes of a particular filter
  internal static var siriShortcutPlayAllTitle: String { return L10n.tr("Localizable", "siri_shortcut_play_all_title", fallback: "Playing all episodes") }
  /// Siri shortcut title for playing the top episode of a particular podcast or filter
  internal static var siriShortcutPlayEpisodeTitle: String { return L10n.tr("Localizable", "siri_shortcut_play_episode_title", fallback: "Playing the top episode") }
  /// Siri shortcut invocation phrase for playing the specified filter. '%1$@' is a placeholder for the name of the filter to play from
  internal static func siriShortcutPlayFilterPhrase(_ p1: Any) -> String {
    return L10n.tr("Localizable", "siri_shortcut_play_filter_phrase", String(describing: p1), fallback: "Play top %1$@")
  }
  /// Siri shortcut invocation phrase for playing the specified podcast. '%1$@' is a placeholder for the name of the podcast
  internal static func siriShortcutPlayPodcastPhrase(_ p1: Any) -> String {
    return L10n.tr("Localizable", "siri_shortcut_play_podcast_phrase", String(describing: p1), fallback: "Play %1$@")
  }
  /// Siri shortcut phrase title for playing a suggested podcast
  internal static var siriShortcutPlaySuggestedPodcastPhrase: String { return L10n.tr("Localizable", "siri_shortcut_play_suggested_podcast_phrase", fallback: "Play a suggested episode") }
  /// Siri shortcut suggested title for playing a suggested podcast
  internal static var siriShortcutPlaySuggestedPodcastSuggestedTitle: String { return L10n.tr("Localizable", "siri_shortcut_play_suggested_podcast_suggested_title", fallback: "Surprise Me!") }
  /// Siri shortcut title for playing a suggested podcast
  internal static var siriShortcutPlaySuggestedPodcastTitle: String { return L10n.tr("Localizable", "siri_shortcut_play_suggested_podcast_title", fallback: "Playing a suggested episode") }
  /// Siri shortcut invocation phrase for playing the next episode in the queue.
  internal static var siriShortcutPlayUpNextPhrase: String { return L10n.tr("Localizable", "siri_shortcut_play_up_next_phrase", fallback: "Up Next") }
  /// Siri shortcut title for playing the next episode in the queue
  internal static var siriShortcutPlayUpNextTitle: String { return L10n.tr("Localizable", "siri_shortcut_play_up_next_title", fallback: "Playing next episode") }
  /// Siri shortcut title and phrase for having siri skip to the previous chapter of a podcast
  internal static var siriShortcutPreviousChapter: String { return L10n.tr("Localizable", "siri_shortcut_previous_chapter", fallback: "Previous chapter") }
  /// Siri shortcut invocation phrase for resuming the current episode
  internal static var siriShortcutResumePhrase: String { return L10n.tr("Localizable", "siri_shortcut_resume_phrase", fallback: "Resume") }
  /// Siri shortcut title for resuming the current episode
  internal static var siriShortcutResumeTitle: String { return L10n.tr("Localizable", "siri_shortcut_resume_title", fallback: "Resuming Current Episode") }
  /// Title for the siri shortcuts page to create a shortcut to a podcast
  internal static var siriShortcutToPodcast: String { return L10n.tr("Localizable", "siri_shortcut_to_podcast", fallback: "Create Shortcut to Podcast") }
  /// A common string used throughout the app. Prompt to rewind the playback by a configurable amount.
  internal static var skipBack: String { return L10n.tr("Localizable", "skip_back", fallback: "Skip Back") }
  /// A common string used throughout the app. Prompt to fast-forward the playback by a configurable amount.
  internal static var skipForward: String { return L10n.tr("Localizable", "skip_forward", fallback: "Skip Forward") }
  /// The Sleep Timer feature.
  internal static var sleepTimer: String { return L10n.tr("Localizable", "sleep_timer", fallback: "Sleep Timer") }
  /// Prompt to add five minutes to an active timer.
  internal static var sleepTimerAdd5Mins: String { return L10n.tr("Localizable", "sleep_timer_add_5_mins", fallback: "+ 5 Minutes") }
  /// Prompt to cancel the active sleep timer.
  internal static var sleepTimerCancel: String { return L10n.tr("Localizable", "sleep_timer_cancel", fallback: "Cancel Timer") }
  /// Prompt to change the active sleep timer to be end of episode.
  internal static var sleepTimerEndOfEpisode: String { return L10n.tr("Localizable", "sleep_timer_end_of_episode", fallback: "End Of Episode") }
  /// Accessibility hint that displays the remaining amount of time for the sleep timer. '%1$@' is a placeholder for the remaining time.
  internal static func sleepTimerTimeRemaining(_ p1: Any) -> String {
    return L10n.tr("Localizable", "sleep_timer_time_remaining", String(describing: p1), fallback: "Sleep Timer on, %1$@ remaining")
  }
  /// Prompt to confirm when presented with a connection prompt. Used when connecting to a Sonos speaker.
  internal static var sonosConnectAction: String { return L10n.tr("Localizable", "sonos_connect_action", fallback: "CONNECT") }
  /// Prompt to connect to a Sonos speaker. 'Sonos' refers the the speaker manufacturer.
  internal static var sonosConnectPrompt: String { return L10n.tr("Localizable", "sonos_connect_prompt", fallback: "Connect To Sonos") }
  /// Notice indicating that the app is attempting to make a connection to a Sonos device. 'Sonos' refers the the speaker manufacturer.
  internal static var sonosConnecting: String { return L10n.tr("Localizable", "sonos_connecting", fallback: "CONNECTING...") }
  /// Notice indicating that the app failed to make a connection to a Sonos device because the accounts weren't successfully linked. 'Sonos' refers the the speaker manufacturer.
  internal static var sonosConnectionFailedAccountLink: String { return L10n.tr("Localizable", "sonos_connection_failed_account_link", fallback: "Unable to link Pocket Casts account at this time. Please try again later.") }
  /// Notice indicating that the app failed to make a connection to a Sonos device because because it couldn't detect the Sonos App. 'Sonos' refers the the speaker manufacturer.
  internal static var sonosConnectionFailedAppMissing: String { return L10n.tr("Localizable", "sonos_connection_failed_app_missing", fallback: "Unable to open Sonos app to complete linking process.") }
  /// Notice indicating that the app failed to make a connection to a Sonos device. 'Sonos' refers the the speaker manufacturer.
  internal static var sonosConnectionFailedTitle: String { return L10n.tr("Localizable", "sonos_connection_failed_title", fallback: "Linking Failed") }
  /// Notice informing the users about what data will be provided to the Sonos speaker upon connection. 'Sonos' refers the the speaker manufacturer.
  internal static var sonosConnectionPrivacyNotice: String { return L10n.tr("Localizable", "sonos_connection_privacy_notice", fallback: "Connecting to Sonos will allow the Sonos app to access your episode information.\n\nYour email address, password and other sensitive items are never shared.") }
  /// Notice informing the users they need Pocket Casts account and need to sign in before connecting to the Sonos speaker. 'Sonos' refers the the speaker manufacturer.
  internal static var sonosConnectionSignInPrompt: String { return L10n.tr("Localizable", "sonos_connection_sign_in_prompt", fallback: "You need to have a Pocket Casts account before you can connect with Sonos.") }
  /// A common string used throughout the app. Prompt for the sort option menus.
  internal static var sortBy: String { return L10n.tr("Localizable", "sort_by", fallback: "Sort By") }
  /// A common string used throughout the app. Title accompanying the sort option setting.
  internal static var sortEpisodes: String { return L10n.tr("Localizable", "sort_episodes", fallback: "Sort Episodes") }
  /// Used next to a setting for how fast audio will play
  internal static var speed: String { return L10n.tr("Localizable", "speed", fallback: "Speed") }
  /// A common string used throughout the app. Prompt to mark an episode(s) as favorited.
  internal static var starEpisode: String { return L10n.tr("Localizable", "star_episode", fallback: "Star Episode") }
  /// A common string used throughout the app. Prompt to mark an episode(s) as favorited. Similar to 'Star Episode' but more concise.
  internal static var starEpisodeShort: String { return L10n.tr("Localizable", "star_episode_short", fallback: "Star") }
  /// Accessibility message for the cell displaying the time for how long they've listened to Pocket Casts. '%1$@' is a placeholder for how long they've listened and '%2$@' is a placeholder for a localized funny stat related to their listening history.
  internal static func statsAccessibilityListenHistoryFormat(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "stats_accessibility_listen_history_format", String(describing: p1), String(describing: p2), fallback: "You've listened for %1$@. %2$@")
  }
  /// Row header that displays the amount of time saved from Auto skipping episode parts.
  internal static var statsAutoSkip: String { return L10n.tr("Localizable", "stats_auto_skip", fallback: "Auto Skipping") }
  /// Error message for when stats fail to load due to internet connection error.
  internal static var statsError: String { return L10n.tr("Localizable", "stats_error", fallback: "Unable to load stats, check your Internet connection") }
  /// Message informing the user how long they've been a user. '%1$@' is a placeholder for the date for when they created their account.
  internal static func statsListenHistoryFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "stats_listen_history_format", String(describing: p1), fallback: "Since %1$@ you’ve listened for")
  }
  /// Loading message displayed while stats are being pulled.
  internal static var statsListenHistoryLoading: String { return L10n.tr("Localizable", "stats_listen_history_loading", fallback: "You’ve listened for") }
  /// Header for the cell displaying the time for how long they've listened to Pocket Casts.
  internal static var statsListenHistoryNoDate: String { return L10n.tr("Localizable", "stats_listen_history_no_date", fallback: "You’ve listened for") }
  /// Row header that displays the amount of time saved from the Skip forward feature.
  internal static var statsSkipping: String { return L10n.tr("Localizable", "stats_skipping", fallback: "Skipping") }
  /// Section header that breaks down how much listening time has been saved across a variety of features.
  internal static var statsTimeSaved: String { return L10n.tr("Localizable", "stats_time_saved", fallback: "TIME SAVED BY") }
  /// A placeholder string for when the app fails to generate a time from the given inputs.
  internal static var statsTimeZeroSeconds: String { return L10n.tr("Localizable", "stats_time_zero_seconds", fallback: "0 seconds") }
  /// A common string used throughout the app. Status header showing the totals for accumulated stat numbers.
  internal static var statsTotal: String { return L10n.tr("Localizable", "stats_total", fallback: "Total") }
  /// Row header that displays the amount of time saved from adjusting the Playback speed feature.
  internal static var statsVariableSpeed: String { return L10n.tr("Localizable", "stats_variable_speed", fallback: "Variable Speed") }
  /// A common string used throughout the app. Status message informing the user that the episode has been downloaded.
  internal static var statusDownloaded: String { return L10n.tr("Localizable", "status_downloaded", fallback: "Downloaded") }
  /// A common string used throughout the app. Status message informing the user that the episode is downloading.
  internal static var statusDownloading: String { return L10n.tr("Localizable", "status_downloading", fallback: "Downloading") }
  /// A common string used throughout the app. Status message informing the user that the episode has not been downloaded.
  internal static var statusNotDownloaded: String { return L10n.tr("Localizable", "status_not_downloaded", fallback: "Not Downloaded") }
  /// A common string used throughout the app. Status message informing the user that the episode is currently not selected. Used with accessibility.
  internal static var statusNotSelected: String { return L10n.tr("Localizable", "status_not_selected", fallback: "Not Selected") }
  /// A common string used throughout the app. Status message informing the user that the episode has not been starred (favorited).
  internal static var statusNotStarred: String { return L10n.tr("Localizable", "status_not_starred", fallback: "Not Starred") }
  /// A common string used throughout the app. Status message informing the user that the episode has been played.
  internal static var statusPlayed: String { return L10n.tr("Localizable", "status_played", fallback: "Played") }
  /// A common string used throughout the app. Status message informing the user that the episode is currently selected. Used with accessibility.
  internal static var statusSelected: String { return L10n.tr("Localizable", "status_selected", fallback: "Selected") }
  /// A common string used throughout the app. Status message informing the user that the episode has been starred (favorited).
  internal static var statusStarred: String { return L10n.tr("Localizable", "status_starred", fallback: "Starred") }
  /// A common string used throughout the app. Status message informing the user that the episode has not been played.
  internal static var statusUnplayed: String { return L10n.tr("Localizable", "status_unplayed", fallback: "Unplayed") }
  /// A common string used throughout the app. Status message informing the user that the episode has been uploaded.
  internal static var statusUploaded: String { return L10n.tr("Localizable", "status_uploaded", fallback: "Uploaded") }
  /// A common string used throughout the app. Prompt to cancel the download for the selected item(s).
  internal static var stopDownload: String { return L10n.tr("Localizable", "stop_download", fallback: "Stop Download") }
  /// Prompt to subscribe to the selected podcast.
  internal static var subscribe: String { return L10n.tr("Localizable", "subscribe", fallback: "Subscribe") }
  /// Prompt to subscribe to all of the selected podcast.
  internal static var subscribeAll: String { return L10n.tr("Localizable", "subscribe_all", fallback: "Subscribe All") }
  /// Label indicating that the user is currently subscribed to the selected podcast.
  internal static var subscribed: String { return L10n.tr("Localizable", "subscribed", fallback: "Subscribed") }
  /// Title for the subscription details page informing the users that the selected subscription has been canceled.
  internal static var subscriptionCancelled: String { return L10n.tr("Localizable", "subscription_cancelled", fallback: "Subscription Cancelled") }
  /// Message on the subscription details page informing the users when the canceled subscription will officially end. '%1$@' is a placeholder for the date in which the subscription expires.
  internal static func subscriptionCancelledMsg(_ p1: Any) -> String {
    return L10n.tr("Localizable", "subscription_cancelled_msg", String(describing: p1), fallback: "Subscription Cancelled %1$@ ")
  }
  /// A common string used throughout the app. Thanks the user for their support. Used for paid feeds and Pocket Casts Plus.
  internal static var subscriptionsThankYou: String { return L10n.tr("Localizable", "subscriptions_thank_you", fallback: "Thanks for your support!") }
  /// A label used to identify that a user is a supporter of the selected podcast.
  internal static var supporter: String { return L10n.tr("Localizable", "supporter", fallback: "Supporter") }
  /// Menu option to open details on available podcast supporter contribution options.
  internal static var supporterContributions: String { return L10n.tr("Localizable", "supporter_contributions", fallback: "Supporter Contributions") }
  /// Subtitle to prompt the user to review their supports contribution details for more information.
  internal static var supporterContributionsSubtitle: String { return L10n.tr("Localizable", "supporter_contributions_subtitle", fallback: "Check contributions for details") }
  /// Informational message informing the user that their recurring payments for supporter contributions have been canceled.
  internal static var supporterPaymentCanceled: String { return L10n.tr("Localizable", "supporter_payment_canceled", fallback: "Supporter: Cancelled") }
  /// Notice the sync failed due to an account error.
  internal static var syncAccountError: String { return L10n.tr("Localizable", "sync_account_error", fallback: "Check your username and password.") }
  /// Sync status update notifying the user that the app is logged in.
  internal static var syncAccountLogin: String { return L10n.tr("Localizable", "sync_account_login", fallback: "Logged in...") }
  /// A common string used throughout the app. Used to indicate that the sync process has failed.
  internal static var syncFailed: String { return L10n.tr("Localizable", "sync_failed", fallback: "Sync failed") }
  /// Notice that the app is syncing the up next and history for the account.
  internal static var syncInProgress: String { return L10n.tr("Localizable", "sync_in_progress", fallback: "Syncing Up Next and History") }
  /// Progress message indicating the total number of podcasts being synced. '%1$@' serves as a placeholder for the current number of synced podcasts. '%2$@' serves as a placeholder for the total number of podcasts to sync.
  internal static func syncProgress(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "sync_progress", String(describing: p1), String(describing: p2), fallback: "Podcast %1$@ of %2$@")
  }
  /// Progress message indicating the total number of podcasts that have been synced. '%1$@' serves as a placeholder for the current number of synced podcasts, will be more than one.
  internal static func syncProgressUnknownCountPluralFormat(_ p1: Any) -> String {
    return L10n.tr("Localizable", "sync_progress_unknown_count_plural_format", String(describing: p1), fallback: "Synced %1$@ podcasts")
  }
  /// Progress message indicating the total number of podcasts that have been synced. Used in the singular case.
  internal static var syncProgressUnknownCountSingular: String { return L10n.tr("Localizable", "sync_progress_unknown_count_singular", fallback: "Synced 1 podcast") }
  /// A common string used throughout the app. Used to indicate that the sync process in running.
  internal static var syncing: String { return L10n.tr("Localizable", "syncing", fallback: "Syncing...") }
  /// Prompt to allow the user to review the Terms of Use.
  internal static var termsOfUse: String { return L10n.tr("Localizable", "terms_of_use", fallback: "Terms of Use") }
  /// Theme name for the Classic theme.
  internal static var themeClassic: String { return L10n.tr("Localizable", "theme_classic", fallback: "Classic") }
  /// Theme name for the Dark theme.
  internal static var themeDark: String { return L10n.tr("Localizable", "theme_dark", fallback: "Default Dark") }
  /// Theme name for the Dark Contrast theme.
  internal static var themeDarkContrast: String { return L10n.tr("Localizable", "theme_dark_contrast", fallback: "Dark Contrast") }
  /// Theme name for the Electricity theme.
  internal static var themeElectricity: String { return L10n.tr("Localizable", "theme_electricity", fallback: "Electricity") }
  /// Theme name for the Extra Dark theme.
  internal static var themeExtraDark: String { return L10n.tr("Localizable", "theme_extra_dark", fallback: "Extra Dark") }
  /// Theme name for the Indigo theme.
  internal static var themeIndigo: String { return L10n.tr("Localizable", "theme_indigo", fallback: "Indigo") }
  /// Theme name for the Light theme.
  internal static var themeLight: String { return L10n.tr("Localizable", "theme_light", fallback: "Default Light") }
  /// Theme name for the Light Contrast theme.
  internal static var themeLightContrast: String { return L10n.tr("Localizable", "theme_light_contrast", fallback: "Light Contrast") }
  /// Theme name for the Radioactivity theme.
  internal static var themeRadioactivity: String { return L10n.tr("Localizable", "theme_radioactivity", fallback: "Radioactivity") }
  /// Theme name for the Rosé theme.
  internal static var themeRose: String { return L10n.tr("Localizable", "theme_rose", fallback: "Rosé") }
  /// Open ended time format describing either unknown or truly never
  internal static var timeFormatNever: String { return L10n.tr("Localizable", "time_format_never", fallback: "never") }
  /// A placeholder when time conversions fail. Sets the value to zero seconds
  internal static var timePlaceholder: String { return L10n.tr("Localizable", "time_placeholder", fallback: "0 sec") }
  /// A common string used throughout the app. Used to reference today.
  internal static var today: String { return L10n.tr("Localizable", "today", fallback: "Today") }
  /// A common string used throughout the app. Title option to place the item at the top of the queue.
  internal static var top: String { return L10n.tr("Localizable", "top", fallback: "Top") }
  /// Label indicating that the trial period for the subscription or promotion has ended.
  internal static var trialFinished: String { return L10n.tr("Localizable", "trial_finished", fallback: "Trial Finished") }
  /// The Trim Silence feature, removes silence from podcasts to make them shorter.
  internal static var trimSilence: String { return L10n.tr("Localizable", "trim_silence", fallback: "Trim Silence") }
  /// A common string used throughout the app. Catch all prompt to suggest to the user to try the the task again.
  internal static var tryAgain: String { return L10n.tr("Localizable", "try_again", fallback: "Try Again") }
  /// A common string used throughout the app. Prompt to restore the selected item(s) from an archived state.
  internal static var unarchive: String { return L10n.tr("Localizable", "unarchive", fallback: "Unarchive") }
  /// A common string used throughout the app. Used to reference an unknown duration '?' is an indicator that the amount of time isn't known and 'm' is a reference for minutes.
  internal static var unknownDuration: String { return L10n.tr("Localizable", "unknown_duration", fallback: "? m") }
  /// A common string used throughout the app. Prompt to un-star the selected item (remove from favorited).
  internal static var unstar: String { return L10n.tr("Localizable", "unstar", fallback: "Unstar") }
  /// A common string used throughout the app. Prompt to unsubscribe from the selected podcast(s).
  internal static var unsubscribe: String { return L10n.tr("Localizable", "unsubscribe", fallback: "Unsubscribe") }
  /// A common string used throughout the app. Prompt to unsubscribe from all of the selected podcast.
  internal static var unsubscribeAll: String { return L10n.tr("Localizable", "unsubscribe_all", fallback: "Unsubscribe All") }
  /// A common string used throughout the app. Title for the prompt to display the queue of episodes to play next.
  internal static var upNext: String { return L10n.tr("Localizable", "up_next", fallback: "Up Next") }
  /// Description shown when your Up Next list is empty. Note that for non right to left languages "right" should be change to "left" (and translated)
  internal static var upNextEmptyDescription: String { return L10n.tr("Localizable", "up_next_empty_description", fallback: "You can queue episodes to play next by swiping right on episode rows, or tapping the icon on an episode card.") }
  /// Heading shown when your Up Next list is empty
  internal static var upNextEmptyTitle: String { return L10n.tr("Localizable", "up_next_empty_title", fallback: "Nothing in Up Next") }
  /// An alphabetical sort option for uploaded files.
  internal static var uploadSortAlpha: String { return L10n.tr("Localizable", "upload_sort_alpha", fallback: "Title (A-Z)") }
  /// The Volume Boost feature. Makes voices louder.
  internal static var volumeBoost: String { return L10n.tr("Localizable", "volume_boost", fallback: "Volume Boost") }
  /// A short description of what the Volume Boost feature does
  internal static var volumeBoostDescription: String { return L10n.tr("Localizable", "volume_boost_description", fallback: "Voices sound louder") }
  /// A common string used throughout the app. Informs the user that the app is waiting for wifi to reconnect.
  internal static var waitForWifi: String { return L10n.tr("Localizable", "wait_for_wifi", fallback: "Waiting for WiFi") }
  /// A common string used throughout the app. Used to reference the Watch as the playing source with in the Apple Watch App (Phone is the other option for this use case)
  internal static var watch: String { return L10n.tr("Localizable", "watch", fallback: "Watch") }
  /// Indicates that the episode is being played is currently buffering to download more content for playback.
  internal static var watchBuffering: String { return L10n.tr("Localizable", "watch_buffering", fallback: "Buffering ...") }
  /// Prompt in the Apple Watch App for the controls to move to the next chapter of the podcast.
  internal static var watchChapterNext: String { return L10n.tr("Localizable", "watch_chapter_next", fallback: "Next Chapter") }
  /// Prompt in the Apple Watch App for the controls to move to the previous chapter of the podcast.
  internal static var watchChapterPrev: String { return L10n.tr("Localizable", "watch_chapter_prev", fallback: "Prev Chapter") }
  /// Title for the playback effects screen on the Apple Watch
  internal static var watchEffects: String { return L10n.tr("Localizable", "watch_effects", fallback: "Effects") }
  /// Prompt in the Apple Watch App to open episode details.
  internal static var watchEpisodeDetails: String { return L10n.tr("Localizable", "watch_episode_details", fallback: "Episode Details") }
  /// Prompt in the Apple Watch app to return to the Main Menu
  internal static var watchMainMenu: String { return L10n.tr("Localizable", "watch_main_menu", fallback: "Main Menu") }
  /// Label in the Apple Watch app informing the user that they don't have any episodes in their selected list.
  internal static var watchNoEpisodes: String { return L10n.tr("Localizable", "watch_no_episodes", fallback: "No Episodes") }
  /// Label in the Apple Watch app informing the user that they haven't configured any of their filters.
  internal static var watchNoFilters: String { return L10n.tr("Localizable", "watch_no_filters", fallback: "No Filters") }
  /// Label in the Apple Watch app informing the user that they haven't subscribed to podcasts.
  internal static var watchNoPodcasts: String { return L10n.tr("Localizable", "watch_no_podcasts", fallback: "No Podcasts") }
  /// Subtitle text used on the now playing screen in the Watch App. Indicates there is nothing palying or paused in the app. Please leave the "\
  /// \
  /// " part in there, that's a new line indicator.
  internal static var watchNothingPlayingSubtitle: String { return L10n.tr("Localizable", "watch_nothing_playing_subtitle", fallback: "Enjoy the silence, or find something new to play.\n\nHonestly both are solid choices. 🙂") }
  /// Title text used on the now playing screen in the Watch App. Indicates there is nothing palying or paused in the app.
  internal static var watchNothingPlayingTitle: String { return L10n.tr("Localizable", "watch_nothing_playing_title", fallback: "Nothing Playing") }
  /// Message detailing where the audio will play from when selecting the source on the Apple Watch
  internal static var watchSourceMsg: String { return L10n.tr("Localizable", "watch_source_msg", fallback: "Podcasts will play from the speaker that the chosen device is connected to") }
  /// Information label providing a brief explanation of Pocket Casts Plus.
  internal static var watchSourcePlusInfo: String { return L10n.tr("Localizable", "watch_source_plus_info", fallback: "Download direct to your watch and listen without your phone. Check out Pocket Casts Plus on your phone app, or on the web.") }
  /// Button that allows the user to manually trigger a refresh of their profile from the watch app.
  internal static var watchSourceRefreshAccount: String { return L10n.tr("Localizable", "watch_source_refresh_account", fallback: "Refresh Account") }
  /// Information label accompanying the Refresh Account button.
  internal static var watchSourceRefreshAccountInfo: String { return L10n.tr("Localizable", "watch_source_refresh_account_info", fallback: "If you have a Pocket Casts Plus account, refresh account to attempt to enable it") }
  /// Button that allows the user to manually trigger a refresh of their data from the watch app.
  internal static var watchSourceRefreshData: String { return L10n.tr("Localizable", "watch_source_refresh_data", fallback: "Refresh Data") }
  /// Information label informing users if they want to sign in to the Watch app they need to do that from the phone app.
  internal static var watchSourceSignInInfo: String { return L10n.tr("Localizable", "watch_source_sign_in_info", fallback: "Sign in or create an account on your phone") }
  /// Apple Watch complication prompt to tap the control to open the watch app.
  internal static var watchTapToOpen: String { return L10n.tr("Localizable", "watch_tap_to_open", fallback: "Tap to open") }
  /// Subtitle for the up next screen when a user has no episode queued up to play.
  internal static var watchUpNextNoItemsSubtitle: String { return L10n.tr("Localizable", "watch_up_next_no_items_subtitle", fallback: "You can queue episodes to play next from the episode details screen, or adding them on your phone.") }
  /// Title for the up next screen when a user has no episode queued up to play.
  internal static var watchUpNextNoItemsTitle: String { return L10n.tr("Localizable", "watch_up_next_no_items_title", fallback: "Nothing in Up Next") }
  /// Title for the announcement screen that calls out new features.
  internal static var whatsNew: String { return L10n.tr("Localizable", "whats_new", fallback: "What's New") }
  /// Text for a link that goes to our blog where people can read more about the current update
  internal static var whatsNewBlogMoreLinkText: String { return L10n.tr("Localizable", "whats_new_blog_more_link_text", fallback: "Read more about this update on our blog") }
  /// Text on the about page button to tell people's what's new in this version. %1$@ is placeholder for the version number, for example 7.1.
  internal static func whatsNewInVersion(_ p1: Any) -> String {
    return L10n.tr("Localizable", "whats_new_in_version", String(describing: p1), fallback: "What's New In %1$@")
  }
  /// What's new for 7.20 description for page one. Please leave the "\
  /// \
  /// " part in there, these are new line indicator.
  internal static var whatsNewPageOne720: String { return L10n.tr("Localizable", "whats_new_page_one_7_20", fallback: "If you love podcasts half as much as we do, you probably have a lot of them. If you're a Pocket Casts Plus subscriber, you can now sort these into folders and file them into neat groups.\n\nThanks to your support, your Home Screen has never looked better!") }
  /// Title for page one of the 7.20 what's new dialog.
  internal static var whatsNewPageOneTitle720: String { return L10n.tr("Localizable", "whats_new_page_one_title_7_20", fallback: "Folders") }
  /// What's new for 7.20 description for page two. Please leave the "\
  /// \
  /// " part in there, these are new line indicator.
  internal static var whatsNewPageTwo720: String { return L10n.tr("Localizable", "whats_new_page_two_7_20", fallback: "We now sync your Home Screen (including your sort options) across devices! And you can drag and drop in the Web Player now as well.\n\nThis means you can rest easier, knowing the hard work you put in to arranging your podcasts page is being synced to your account.") }
  /// Title for page two of the 7.20 what's new dialog.
  internal static var whatsNewPageTwoTitle720: String { return L10n.tr("Localizable", "whats_new_page_two_title_7_20", fallback: "Home Grid Syncing") }
  /// Description of a widget to launch the app
  internal static var widgetsAppIconDescription: String { return L10n.tr("Localizable", "widgets_app_icon_description", fallback: "Quickly Launch Pocket Casts") }
  /// Title of a widget that displays the app icon
  internal static var widgetsAppIconName: String { return L10n.tr("Localizable", "widgets_app_icon_name", fallback: "Icon") }
  /// Widget prompt message to direct the user to the discover tab to add new podcasts to their queue
  internal static var widgetsDiscoverPromptMsg: String { return L10n.tr("Localizable", "widgets_discover_prompt_msg", fallback: "Check out the Discover Tab") }
  /// Widget prompt title to direct the user to the discover tab to add new podcasts to their queue
  internal static var widgetsDiscoverPromptTitle: String { return L10n.tr("Localizable", "widgets_discover_prompt_title", fallback: "Ears hungry for more?") }
  /// Widget label informing the user that nothing is currently being played.
  internal static var widgetsNothingPlaying: String { return L10n.tr("Localizable", "widgets_nothing_playing", fallback: "Nothing Playing") }
  /// Description for the now playing widget.
  internal static var widgetsNowPlayingDesc: String { return L10n.tr("Localizable", "widgets_now_playing_desc", fallback: "Quickly access the currently playing episode.") }
  /// Call to action for a tap on a widget to open the Discover tab.
  internal static var widgetsNowPlayingTapDiscover: String { return L10n.tr("Localizable", "widgets_now_playing_tap_discover", fallback: "Tap to Discover") }
  /// Up Next Lock Screen Widget description
  internal static var widgetsUpNextDescription: String { return L10n.tr("Localizable", "widgets_up_next_description", fallback: "See the number of items in your Up Next queue or details about the next episode.") }
  /// Basic string used in formats like 'price / year'
  internal static var year: String { return L10n.tr("Localizable", "year", fallback: "year") }
  /// Basic string used to callout payment intervals like yearly vs monthly
  internal static var yearly: String { return L10n.tr("Localizable", "yearly", fallback: "Yearly") }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = localizedFormat(key, table, value)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
