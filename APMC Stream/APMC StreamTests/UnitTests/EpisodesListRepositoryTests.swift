//
//  EpisodesListRepositoryTests.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 06/04/25.
//

import XCTest
@testable import APMC_Stream

final class EpisodesListRepositoryTests: XCTestCase {

    func test_fetchEpisodes_success() async throws {
        // Given
        let expectedEpisodes = [Episode(id: "1", title: "Test", description: "Desc", duration: 120, videoUrl: "video")]
        let mockService = APMCStreamNetworkServiceMock(result: .success(expectedEpisodes))
        let repository = EpisodesListRepository(service: mockService)

        // When
        let episodes = try await repository.fetchEpisodes()

        // Then
        XCTAssertEqual(episodes.count, 1)
        XCTAssertEqual(episodes.first?.title, "Test")
    }

    func test_fetchEpisodes_failure() async {
        // Given
        let mockService = APMCStreamNetworkServiceMock(result: .failure(APMCStreamApiError.badRequest))
        let repository = EpisodesListRepository(service: mockService)

        do {
            _ = try await repository.fetchEpisodes()
            XCTFail("Expected error not thrown")
        } catch let error as APMCStreamApiError {
            // Then
            XCTAssertEqual(error, .badRequest)
        } catch {
            XCTFail("Unexpected error thrown")
        }
    }
}
