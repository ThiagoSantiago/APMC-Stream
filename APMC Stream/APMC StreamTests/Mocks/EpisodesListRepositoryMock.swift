//
//  EpisodesListRepositoryMock.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 06/04/25.
//

import Foundation
@testable import APMC_Stream

class EpisodesListRepositoryMock: EpisodesListRepositoryType {
    private let episodes: [Episode]

    init(episodes: [Episode]) {
        self.episodes = episodes
    }

    func fetchEpisodes() async throws -> [Episode] {
        return episodes
    }
}
