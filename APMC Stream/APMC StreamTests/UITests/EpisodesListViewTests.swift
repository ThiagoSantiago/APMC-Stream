//
//  EpisodesListViewTests.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 06/04/25.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import APMC_Stream

@MainActor
final class EpisodesListViewTests: XCTestCase {

    func test_episodesListView_snapshot() {
        // Given
        let episodes = [
            Episode(id: "1",
                    title: "Introduction to SwiftUI",
                    description: "This is the first sample video.",
                    duration: 596,
                    videoUrl: "Video URL"),
            
            Episode(id: "2",
                    title: "Understanding State and Binding",
                    description: "This is the first sample video.",
                    duration: 872,
                    videoUrl: "Video URL"),
            
            Episode(id: "3",
                    title: "Building Custom Components",
                    description: "This is the first sample video.",
                    duration: 743,
                    videoUrl: "Video URL")
        ]

        let mockViewModel = EpisodesListViewModelMock(episodes: episodes)
        let view = EpisodesListView(viewModel: mockViewModel)

        let sut = UIHostingController(rootView: view)
        sut.view.frame = UIScreen.main.bounds
        
        // Then
        assertSnapshot(of: sut, as: .image(precision:0.9))
    }
}
