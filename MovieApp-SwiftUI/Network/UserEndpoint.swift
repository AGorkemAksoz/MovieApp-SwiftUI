//
//  UserEndpoint.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 3.06.2024.
//

import Foundation

enum UserEndpoint: APIEndpoint {
    case getUsers
    
    var baseURL: URL {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com") else { return URL(string: "https://google.com")! }
        return url
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/posts"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUsers:
            return nil
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getUsers:
            return nil
        }
    }
    
}
