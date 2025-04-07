//
//  EpisodesListViewModelTests.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 06/04/25.
//

import XCTest
@testable import APMC_Stream

final class EpisodesListViewModelTests: XCTestCase {

    func test_loadEpisodes_success() async {
        // Given
        let expectation = XCTestExpectation(description: "Load Episodes Successfully")
        let expectedEpisodes = [
            Episode(id: "1", title: "Test Episode", description: "Description", duration: 200, videoUrl: "Video URL")
        ]
        let mockService = APMCStreamNetworkServiceMock(result: .success(expectedEpisodes))
        let repository = EpisodesListRepository(service: mockService)
        let viewModel = EpisodesListViewModel(repository: repository)

        // When
        await viewModel.loadEpisodes()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Then
            XCTAssertEqual(viewModel.episodes.count, 1)
            XCTAssertEqual(viewModel.episodes.first?.title, "Test Episode")
            XCTAssertNil(viewModel.errorMessage)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_loadEpisodes_failure() async {
        // Given
        let expectation = XCTestExpectation(description: "Load Episodes Failure")
        let mockService = APMCStreamNetworkServiceMock(result: .failure(APMCStreamApiError.badUrl))
        let repository = EpisodesListRepository(service: mockService)
        let viewModel = EpisodesListViewModel(repository: repository)

        // When
        await viewModel.loadEpisodes()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Then
            XCTAssertEqual(viewModel.episodes.count, 0)
            XCTAssertEqual(viewModel.errorMessage, APMCStreamApiError.badUrl.localizedDescription)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
