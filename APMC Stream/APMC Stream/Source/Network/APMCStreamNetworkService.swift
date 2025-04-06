//
//  NetworkService.swift
//  APMC Stream
//
//  Created by Thiago Santiago on 05/04/25.
//

import Foundation

protocol APMCStreamAPIService {
    func request<T: Decodable>(_ endpoint: APMCStreamApiSetupProtocol) async throws -> T?
}

class APMCStreamNetworkService: APMCStreamAPIService {
    private let baseURL: URL
    private let session: URLSession
    
    init(baseURL: URL, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func request<T: Decodable>(_ endpoint: APMCStreamApiSetupProtocol) async throws -> T? {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false) else { return nil}
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else {
            throw APMCStreamApiError.badUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.httpBody = endpoint.body
        
        endpoint.headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        do {
            let (data, response) = try await session.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APMCStreamApiError.brokenData
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw APMCStreamApiError.couldNotParseObject
                }
            case 400:
                throw APMCStreamApiError.badRequest
            case 401:
                throw APMCStreamApiError.authenticationRequired
            case 404:
                throw APMCStreamApiError.couldNotFindHost
            default:
                throw APMCStreamApiError.unknown("Received HTTP \(httpResponse.statusCode)")
            }
        } catch let urlError as URLError {
            throw APMCStreamApiError.unknown(urlError.localizedDescription)
        } catch {
            throw APMCStreamApiError.unknown(error.localizedDescription)
        }
    }
}
