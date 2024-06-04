//
//  PostViewModel.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 4.06.2024.
//

import Combine
import Foundation

class PostViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let postService: PostServiceInterface
    @Published var posts: [Post] = []
    
    init(postService: PostServiceInterface) {
        self.postService = postService
    }
    
    func fetchPosts() {
        postService.getPosts()
            .receive(on: RunLoop.main)
            .sink { data in
                
            } receiveValue: { [ weak self] data in
                self?.posts = data
//                print(self?.posts)
            }
            .store(in: &cancellables)

    }
}
