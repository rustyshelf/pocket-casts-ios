import Foundation
import SwiftUI

struct EpisodeView: View {
    @Environment(\.dynamicTypeSize) var typeSize
    
    @State var episode: WidgetEpisode
    @State var topText: Text

    var body: some View {
        Link(destination: CommonWidgetHelper.urlForEpisodeUuid(uuid: episode.episodeUuid)!) {
            HStack(spacing: 12) {
                SmallArtworkView(imageData: episode.imageData)
                VStack(alignment: .leading) {
                    if typeSize <= .xxLarge {
                        topText
                            .textCase(.uppercase)
                            .font(.caption2)
                            .foregroundColor(Color.secondary)
                    }
                    Text(episode.episodeTitle)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.primary)
                        .lineLimit(1)
                    HStack(alignment: .center, spacing: 5) {
                        if typeSize >= .xxLarge {
                            topText
                                .textCase(.uppercase)
                                .font(.caption2)
                                .foregroundColor(Color.secondary)
                            Text("•")
                                .font(.caption2)
                                .foregroundColor(Color.secondary)
                        }
                        Text(episode.podcastName)
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.secondary)
                            .lineLimit(1)
                    }
                }
            }
        }
    }
}
