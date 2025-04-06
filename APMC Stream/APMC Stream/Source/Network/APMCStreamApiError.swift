//
//  APMCStreamApiError.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 05/04/25.
//

import Foundation

enum APMCStreamApiError: Error {
    case badUrl
    case authenticationRequired
    case brokenData
    case couldNotFindHost
    case couldNotParseObject
    case badRequest
    case unknown(String)

    var localizedDescription: String {
        switch self {
        case .badUrl: return "Bad URL request"
        case .authenticationRequired: return "Authentication is required."
        case .brokenData: return "The received data is broken."
        case .couldNotFindHost: return "The host was not found."
        case .badRequest: return "This is a bad request."
        case .couldNotParseObject: return "Can't convert the data to the object entity."
        case let .unknown(message): return message
        }
    }
}

extension APMCStreamApiError: Equatable {}
