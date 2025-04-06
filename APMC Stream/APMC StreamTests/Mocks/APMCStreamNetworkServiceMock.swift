//
//  APMCStreamAPIServiceMock.swift
//  APMC StreamTests
//
//  Created by Thiago Santiago on 06/04/25.
//

import Foundation

@testable import APMC_Stream

class APMCStreamNetworkServiceMock: APMCStreamAPIService {
    var result: Result<Any, Error>

    init(result: Result<Any, Error>) {
        self.result = result
    }

    func request<T>(_ endpoint: APMCStreamApiSetupProtocol) async throws -> T where T : Decodable {
        switch result {
        case .success(let data):
            return data as! T
        case .failure(let error):
            throw error
        }
    }
}
