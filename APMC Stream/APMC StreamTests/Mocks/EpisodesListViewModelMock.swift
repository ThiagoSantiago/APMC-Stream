//
//  EpisodesListViewModelMock.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 06/04/25.
//

import Foundation
@testable import APMC_Stream

class EpisodesListViewModelMock: EpisodesListViewModel {
    init(episodes: [Episode], isLoading: Bool = false, errorMessage: String? = nil) {
        super.init(repository: EpisodesListRepositoryMock(episodes: episodes))
        self.episodes = episodes
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
    
    override func loadEpisodes() async {}
}
