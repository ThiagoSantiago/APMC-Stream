//
//  EpisodesListView.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import SwiftUI

struct EpisodesListView: View {
    typealias Strings = L10n.EpisodesListView
    @StateObject private var viewModel: EpisodesListViewModel
    
    init(viewModel: EpisodesListViewModel = EpisodesListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.episodes, id: \.id) { episode in
                    ZStack {
                        // TODO: Implement the navigation to the deailView
                        
                        EpisodeListItemCardView(episode: episode, showsIndicator: true)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(Strings.title)
            .task {
                viewModel.loadEpisodes()
            }
            .alert(Strings.Alert.title,
                   isPresented: .constant(viewModel.errorMessage != nil),
                   actions: { Button(Strings.Alert.buttonTitle, role: .cancel)
                { viewModel.errorMessage = nil }
            },
                   message: { Text(viewModel.errorMessage ?? "") }
            )
        }
    }
}

#if DEBUG
#Preview {
    EpisodesListView()
}
#endif
