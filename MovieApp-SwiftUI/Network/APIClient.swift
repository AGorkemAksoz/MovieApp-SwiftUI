//
//  APIClient.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 3.06.2024.
//

import Combine
import Foundation

protocol APIClientInterface {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}


class APIClient<EndpointType: APIEndpoint>: APIClientInterface {
    func request<T>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> where T : Decodable {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach{ request.addValue($0.value, forHTTPHeaderField: $0.key)}
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else { throw APIError.invalidResponse}
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
}
