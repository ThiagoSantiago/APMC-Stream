//
//  APMC_StreamTests.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 02/04/25.
//
import XCTest
import SnapshotTesting
import SwiftUI

@testable import APMC_Stream

final class ContentViewSnapshotTests: XCTestCase {

    func testContentViewSnapshot() {
        let view = ContentView()

        let sut = UIHostingController(rootView: view)
        sut.view.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
        
        assertSnapshot(of: sut, as: .image(precision:0.9))
    }
}
