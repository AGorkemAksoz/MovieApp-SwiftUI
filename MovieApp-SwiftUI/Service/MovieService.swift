//
//  MovieService.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 4.06.2024.
//

import Combine
import Foundation

protocol MovieServiceInterface {
    
    func getMovies() -> AnyPublisher<Movie, Error>
}

class MovieService: MovieServiceInterface {
    let apiClient = APIClient<MovieEndpoint>()
    
    func getMovies() -> AnyPublisher<Movie, Error> {
        return apiClient.request(.getMovies)
    }
    
}
