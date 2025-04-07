//
//  EpisodeDetailsView.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 07/04/25.
//

import SwiftUI
import AVKit

struct EpisodeDetailsView: View {
    typealias Strings = L10n.EpisodeDetailsView
    typealias Colors = Asset.Colors
    let episode: Episode
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            let player = AVPlayer(url: URL(string: episode.videoUrl)!)
            VStack(alignment: .leading, spacing: 16) {
                
                // Video player
                VideoPlayer(player: player)
                    .frame(height: 220)
                    .cornerRadius(12)
                    .shadow(
                        color: Colors.cardShadow.swiftUIColor.opacity(
                            colorScheme == .dark ? 0.6 : 0.1
                        ),
                        radius: 3,
                        x: 0,
                        y: 2
                    )
                
                Divider()
                
                Text(episode.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.primary)
                
                if let description = episode.description, !description.isEmpty {
                    Text(description)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .onAppear(perform: {
                player.play()
            })
            .padding()
        }
        .navigationTitle(Strings.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#if DEBUG
#Preview {
    let episode: Episode = Episode(
        id: "1",
        title: "Test Episode",
        description: "Description",
        duration: 200,
        videoUrl: "Video URL"
    )
    
    EpisodeDetailsView(episode: episode)
}
#endif
