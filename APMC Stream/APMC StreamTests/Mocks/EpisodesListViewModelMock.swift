//
//  EpisodesListViewModelMock.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 06/04/25.
//

import Foundation
@testable import APMC_Stream

class EpisodesListViewModelMock: EpisodesListViewModel {
    init(episodes: [Episode]) {
        super.init(repository: EpisodesListRepositoryMock(episodes: episodes))
        self.episodes = episodes
    }

    override func loadEpisodes() {}
}
