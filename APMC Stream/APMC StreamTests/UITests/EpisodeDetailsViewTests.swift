//
//  EpisodeDetailsViewTests.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 07/04/25.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import APMC_Stream

@MainActor
final class EpisodeDetailsViewTests: XCTestCase {

    func test_episodeDetailsView_snapshot() {
        // Given
        let episode: Episode = Episode(
            id: "1",
            title: "Test Episode",
            description: "Description",
            duration: 200,
            videoUrl: "Video URL"
        )
        
        let view = EpisodeDetailsView(episode: episode)

        let sut = UIHostingController(rootView: view)
        sut.view.frame = UIScreen.main.bounds
        
        // Then
        assertSnapshot(of: sut, as: .image(precision:0.9))
    }
}
