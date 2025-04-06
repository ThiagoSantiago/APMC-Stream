//
//  EpisodesListView.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import SwiftUI

struct EpisodesListView: View {
    typealias Strings = L10n.EpisodesListView
    
    let episodes: [Episode] = [
        Episode(id: "1", title: "Introduction to SwiftUI", description: "This is the first sample video.", duration: 596, videoUrl: ""),
        Episode(id: "2", title: "Understanding State and Binding", description: "This is the first sample video.", duration: 872, videoUrl: ""),
        Episode(id: "3", title: "Building Custom Components", description: "This is the first sample video.", duration: 743, videoUrl: "")
        ]

        var body: some View {
            NavigationStack {
                List {
                    ForEach(episodes, id: \.id) { episode in
                        ZStack {
                            // TODO: Implement the navigation to the deailView

                            EpisodeListItemCardView(episode: episode, showsIndicator: true)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle(Strings.title)
            }
        }
}

#if DEBUG
#Preview {
    EpisodesListView()
}
#endif
