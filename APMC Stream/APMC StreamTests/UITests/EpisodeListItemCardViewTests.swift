//
//  EpisodeListItemCardViewTests.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 06/04/25.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import APMC_Stream

@MainActor
final class EpisodeListItemCardViewTests: XCTestCase {

    func test_episodeListItemCardView_snapshot() {
        // Given
        let episode: Episode = Episode(
            id: "1",
            title: "Test Episode",
            description: "Description",
            duration: 200,
            videoUrl: "Video URL"
        )
        
        let view = EpisodeListItemCardView(episode: episode)

        let sut = UIHostingController(rootView: view)
        sut.view.frame = CGRect(x: 0, y: 0, width: 375, height: 150)
        
        // Then
        assertSnapshot(of: sut, as: .image(precision:0.9))
    }
}
