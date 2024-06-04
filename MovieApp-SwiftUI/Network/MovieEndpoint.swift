//
//  MovieEndpoint.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 4.06.2024.
//

import Foundation

enum MovieEndpoint: APIEndpoint {
    case getMovies
    
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/movie/popular"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getMovies:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMovies:
            return nil
        }
    }
    
    var url: URL? {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        switch self {
        case .getMovies:
            components.queryItems = [
                URLQueryItem(name: "api_key", value: "1f4cd44a27f52e7c527fa1a39efc8c2d"),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "1")
            ]
        }
        return components.url!
    }
}
