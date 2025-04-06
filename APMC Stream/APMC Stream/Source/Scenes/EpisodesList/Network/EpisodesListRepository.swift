//
//  EpisodesListRepository.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import Foundation

protocol EpisodesListRepositoryType {
    func fetchEpisodes() async throws -> [Episode]
}

final class EpisodesListRepository: EpisodesListRepositoryType {
    let service: APMCStreamAPIService

    init(service: APMCStreamAPIService = APMCStreamNetworkService()) {
        self.service = service
    }

    func fetchEpisodes() async throws -> [Episode] {
        return try await service.request(EpisodesListEndpoint.getAllEpisodes)
    }
}
