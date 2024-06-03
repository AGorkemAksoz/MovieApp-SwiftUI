//
//  PostService.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 3.06.2024.
//

import Combine
import Foundation

protocol PostServiceInterface {
    func getPosts() -> AnyPublisher<[Post], Error>
}

class PostService: PostServiceInterface {
    
    let apiClient = APIClient<UserEndpoint>()
    
    func getPosts() -> AnyPublisher<[Post], Error> {
        return apiClient.request(.getUsers)
    }
}
