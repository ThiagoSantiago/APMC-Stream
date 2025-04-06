//
//  EpisodesListViewModel.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import SwiftUI

@MainActor
class EpisodesListViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var errorMessage: String?

    private let repository: EpisodesListRepositoryType

    init(repository: EpisodesListRepositoryType = EpisodesListRepository()) {
        self.repository = repository
    }

    func loadEpisodes() {
        Task {
            do {
                episodes = try await repository.fetchEpisodes()
            } catch let error as APMCStreamApiError {
                errorMessage = error.localizedDescription
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
