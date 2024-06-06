//
//  HomeViewModel.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 4.06.2024.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let movieService: MovieServiceInterface
    @Published var movies: [MovieResult] = []
    @Published var page: Int = 1
    @Published var positionId: Int = 20
    
    init(movieService: MovieServiceInterface) {
        self.movieService = movieService
    }
    
    func fetchMovies() {
        movieService.getMovies()
            .receive(on: RunLoop.main)
            .sink { data in
            } receiveValue: { [weak self] data in
                self?.movies = data.results ?? []
            }
            .store(in: &cancellables)
    }
    
    func fetchOtherPages() {
        page += 1
        movieService.getOtherPage(to: page)
            .receive(on: RunLoop.main)
            .sink { data in
                
            } receiveValue: { [weak self] data in
                self?.movies.insert(contentsOf: data.results!, at: 0)
            }
            .store(in: &cancellables)

    }
}
