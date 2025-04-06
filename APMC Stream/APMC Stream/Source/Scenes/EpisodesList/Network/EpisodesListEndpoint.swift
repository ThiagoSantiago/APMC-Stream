//
//  EpisodesListEndpoint.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 06/04/25.
//

import Foundation

enum EpisodesListEndpoint: APMCStreamApiSetupProtocol {
    case getAllEpisodes
    
    var path: String {
        switch self {
        case .getAllEpisodes:
            return "v3/2aa91a74-52d5-4a2d-8b4f-1bbd64a9cf18"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllEpisodes:
            return .get
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .getAllEpisodes:
            return ["Content-Type": "application/json"]
        }
    }
}
