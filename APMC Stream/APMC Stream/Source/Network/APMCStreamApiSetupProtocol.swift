//
//  APMCStreamApiSetupProtocol.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 05/04/25.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol APMCStreamApiSetupProtocol {
    var body: Data? { get }
    var path: String { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var parameters: [URLQueryItem]? { get }
    var headers: [String : String] { get }
}

extension APMCStreamApiSetupProtocol {
    var headers: [String : String] {
        return [:]
    }

    var parameters: [URLQueryItem]? {
        return nil
    }

    var body: Data? {
        return nil
    }
}
