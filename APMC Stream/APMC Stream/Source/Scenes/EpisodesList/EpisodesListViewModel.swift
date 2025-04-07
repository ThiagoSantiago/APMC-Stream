//
//  EpisodesListViewModel.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import SwiftUI

class EpisodesListViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let repository: EpisodesListRepositoryType
    
    init(repository: EpisodesListRepositoryType = EpisodesListRepository()) {
        self.repository = repository
    }
    
    @MainActor
    func loadEpisodes() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            episodes = try await repository.fetchEpisodes()
        } catch let error as APMCStreamApiError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
