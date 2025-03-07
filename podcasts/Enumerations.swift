import Foundation
import PocketCastsDataModel
enum LibraryType: Int {
    case fourByFour = 1, threeByThree = 2, list = 3
}

enum BadgeType: Int {
    case off = 0, latestEpisode, allUnplayed

    var description: String {
        switch self {
        case .off:
            return L10n.off
        case .latestEpisode:
            return L10n.podcastsBadgeLatestEpisode
        case .allUnplayed:
            return L10n.podcastsBadgeAllUnplayed
        }
    }
}

enum PodcastFinishedAction: Int {
    case doNothing = 0, delete
}

enum PodcastThumbnailSize {
    case list, grid, page
}

enum PodcastLicensing: Int32 {
    case keepEpisodesAfterExpiry = 0, deleteEpisodesAfterExpiry = 1
}

enum PodcastEpisodeSortOrder: Int32, CaseIterable {
    case newestToOldest = 1, oldestToNewest, shortestToLongest, longestToShortest

    var description: String {
        switch self {
        case .newestToOldest:
            return L10n.podcastsEpisodeSortNewestToOldest.localizedCapitalized
        case .oldestToNewest:
            return L10n.podcastsEpisodeSortOldestToNewest.localizedCapitalized
        case .shortestToLongest:
            return L10n.podcastsEpisodeSortShortestToLongest
        case .longestToShortest:
            return L10n.podcastsEpisodeSortLongestToShortest
        }
    }
}

enum LibrarySort: Int, CaseIterable {
    case dateAddedNewestToOldest = 1, titleAtoZ = 2, episodeDateNewestToOldest = 5, custom = 6

    var description: String {
        switch self {
        case .dateAddedNewestToOldest:
            return L10n.podcastsLibrarySortDateAdded
        case .titleAtoZ:
            return L10n.podcastsLibrarySortTitle
        case .episodeDateNewestToOldest:
            return L10n.podcastsLibrarySortEpisodeReleaseDate
        case .custom:
            return L10n.podcastsLibrarySortCustom
        }
    }
}

enum AppBadge: Int {
    case off = 0, totalUnplayed = 1, newSinceLastOpened = 2, filterCount = 10
}

enum PrimaryRowAction: Int32 {
    case stream = 0, download = 1
}

enum PrimaryUpNextSwipeAction: Int32 {
    case playNext = 0, playLast = 1
}

enum PlaylistIcon: Int32 {
    case redPlaylist = 0, bluePlaylist, greenPlaylist, purplePlaylist, yellowPlaylist,
         redmostPlayed, bluemostPlayed, greenmostPlayed, purplemostPlayed, yellowmostPlayed,
         redRecent, blueRecent, greenRecent, purpleRecent, yellowRecent,
         redDownloading, blueDownloading, greenDownloading, purpleDownloading, yellowDownloading,
         redUnplayed, blueUnplayed, greenUnplayed, purpleUnplayed, yellowUnplayed,
         redAudio, blueAudio, greenAudio, purpleAudio, yellowAudio,
         redVideo, blueVideo, greenVideo, purpleVideo, yellowVideo,
         redTop, blueTop, greenTop, purpleTop, yellowTop
}

enum PlayerAction: Int, CaseIterable {
    case effects = 1, sleepTimer, routePicker, starEpisode, shareEpisode, goToPodcast, markPlayed, archive

    func title(episode: BaseEpisode? = nil) -> String {
        switch self {
        case .effects:
            return L10n.playerActionTitleEffects
        case .sleepTimer:
            return L10n.playerActionTitleSleepTimer
        case .routePicker:
            return L10n.playerActionTitleOutputOptions
        case .starEpisode:
            if episode?.keepEpisode ?? false {
                return L10n.playerActionTitleUnstarEpisode
            } else {
                return L10n.starEpisode
            }
        case .shareEpisode:
            return L10n.share
        case .goToPodcast:
            if episode is UserEpisode {
                return L10n.playerActionTitleGoToFile
            } else {
                return L10n.goToPodcast
            }
        case .markPlayed:
            return L10n.markPlayed
        case .archive:
            if episode is UserEpisode {
                return L10n.delete
            } else {
                return L10n.archive
            }
        }
    }

    func subtitle() -> String? {
        switch self {
        case .starEpisode, .shareEpisode:
            return L10n.playerActionSubtitleHidden
        case .archive:
            return L10n.playerActionSubtitleDelete
        default:
            return nil
        }
    }

    func iconName(episode: BaseEpisode?) -> String {
        switch self {
        case .effects:
            return "effects-off"
        case .sleepTimer:
            return "sleep-menu"
        case .routePicker:
            return "route_picker"
        case .starEpisode:
            return (episode?.keepEpisode ?? false) ? "player_star_filled" : "player_star_empty"
        case .shareEpisode:
            return "podcast-share"
        case .goToPodcast:
            return "gotoarrow"
        case .markPlayed:
            return "episode-markasplayed"
        case .archive:
            return episode is UserEpisode ? "delete-red" : "episode-archive"
        }
    }

    func largeIconName(episode: BaseEpisode?) -> String {
        switch self {
        case .effects:
            return "effects-off"
        case .sleepTimer:
            return "sleep-menu"
        case .routePicker:
            return ""
        case .starEpisode:
            return (episode?.keepEpisode ?? false) ? "player_star_filled" : "player_star_empty"
        case .shareEpisode:
            return "shelf_share"
        case .goToPodcast:
            return "shelf_gotoarrow"
        case .markPlayed:
            return "shelf_played"
        case .archive:
            return episode is UserEpisode ? "shelf_delete" : "shelf_archive"
        }
    }

    func canBePerformedOn(episode: BaseEpisode) -> Bool {
        switch self {
        case .starEpisode, .shareEpisode:
            return episode is Episode
        default:
            return true
        }
    }
}

enum MultiSelectAction: Int32, CaseIterable {
    case playLast = 1, playNext, download, archive, markAsPlayed, star, moveToTop, moveToBottom, removeFromUpNext, unstar, unarchive, removeDownload, markAsUnplayed, delete

    func title() -> String {
        switch self {
        case .playLast:
            return L10n.playLast
        case .playNext:
            return L10n.playNext
        case .download:
            return L10n.download
        case .archive:
            return L10n.archive
        case .markAsPlayed:
            return L10n.markPlayed
        case .star:
            return L10n.multiSelectStar
        case .moveToTop:
            return L10n.moveToTop
        case .moveToBottom:
            return L10n.moveToBottom
        case .removeFromUpNext:
            return L10n.remove
        case .unstar:
            return L10n.multiSelectUnstar
        case .unarchive:
            return L10n.unarchive
        case .removeDownload:
            return L10n.removeDownload
        case .markAsUnplayed:
            return L10n.multiSelectRemoveMarkUnplayed
        case .delete:
            return L10n.delete
        }
    }

    func iconName() -> String {
        switch self {
        case .playLast:
            return "playlast"
        case .playNext:
            return "playnext"
        case .download:
            return "player-download"
        case .archive:
            return "episode-archive"
        case .markAsPlayed:
            return "episode-markasplayed"
        case .star:
            return "profile-star"
        case .moveToTop:
            return "upnext-movetotop"
        case .moveToBottom:
            return "upnext-movetobottom"
        case .removeFromUpNext:
            return "episode-removenext"
        case .unstar:
            return "episode-unstar"
        case .unarchive:
            return "episode-unarchive"
        case .markAsUnplayed:
            return "episode-markunplayed"
        case .removeDownload:
            return "episode-remove-download"
        case .delete:
            return "episode-delete"
        }
    }
}
