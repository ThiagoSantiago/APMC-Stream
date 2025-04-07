//
//  EpisodesListView.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import SwiftUI

struct EpisodesListView: View {
    typealias Strings = L10n.EpisodesListView
    typealias Colors = Asset.Colors
    
    @State private var showErrorAlert = false
    @StateObject private var viewModel: EpisodesListViewModel
    
    init(viewModel: EpisodesListViewModel = EpisodesListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    VStack {
                        Spacer()
                        ProgressView(Strings.Loading.message)
                            .progressViewStyle(CircularProgressViewStyle())
                        Spacer()
                    }
                } else {
                    if viewModel.episodes.isEmpty {
                        Text(Strings.EmptyList.message)
                            .foregroundColor(Colors.secondaryTextColor.swiftUIColor)
                    } else {
                        List {
                            ForEach(viewModel.episodes, id: \.id) { episode in
                                ZStack {
                                    NavigationLink(destination: EpisodeDetailsView(episode: episode)) {}
                                    
                                    EpisodeListItemCardView(episode: episode, showsIndicator: true)
                                }
                                .listRowSeparator(.hidden)
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
            }
            .navigationTitle(Strings.title)
            .task {
                await viewModel.loadEpisodes()
            }
            .onChange(of: viewModel.errorMessage) { newValue in
                showErrorAlert = newValue != nil
            }
            .alert(Strings.Alert.title, isPresented: $showErrorAlert) {
                Button(Strings.Alert.buttonTitle, role: .cancel) {
                    viewModel.errorMessage = nil
                }
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
    }
}

#if DEBUG
#Preview {
    EpisodesListView()
}
#endif
