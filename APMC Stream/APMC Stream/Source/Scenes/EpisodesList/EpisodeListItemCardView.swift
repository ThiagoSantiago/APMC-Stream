//
//  EpisodeListItemCardView.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import SwiftUI

struct EpisodeListItemCardView: View {
    typealias Strings = L10n.EpisodeListItemCardView
    typealias Colors = Asset.Colors
    
    @Environment(\.colorScheme) var colorScheme
    
    let episode: Episode
    var showsIndicator: Bool = true

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(episode.title)
                    .font(.headline)
                    .foregroundColor(Colors.primaryTextColor.swiftUIColor)
                
                if let description = episode.description, !description.isEmpty {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondaryText)
                        .lineLimit(2)
                }

                HStack {
                    Text(Strings.duration)
                        .font(.caption)
                        .bold()
                        .foregroundColor(Colors.secondaryTextColor.swiftUIColor)
                    Text(episode.duration.toHourMinAndSec())
                        .font(.caption)
                        .foregroundColor(Colors.secondaryTextColor.swiftUIColor)
                }
            }
            
            Spacer()
            
            if showsIndicator {
                Image(systemName: Strings.Indicator.imageName)
                    .foregroundColor(Colors.secondaryTextColor.swiftUIColor)
            }
        }
        .padding()
        .background(Colors.cardBackground.swiftUIColor)
        .cornerRadius(12)
        .shadow(
            color: Colors.cardShadow.swiftUIColor.opacity(
                colorScheme == .dark ? 0.6 : 0.1
            ),
            radius: 3,
            x: 0,
            y: 2
        )
    }
}

#if DEBUG
#Preview {
    EpisodeListItemCardView(episode: Episode(id: "1", title: "Introduction to SwiftUI", description: "This is the first sample video.", duration: 596, videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"))
}
#endif
