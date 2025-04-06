//
//  Episode.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import Foundation

struct Episode: Decodable {
    let id: String
    let title: String
    let description: String?
    let duration: TimeInterval
    let videoUrl: String
}
