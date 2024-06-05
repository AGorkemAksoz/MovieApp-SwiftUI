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
                self?.movies.append(contentsOf: data.results!)
            }
            .store(in: &cancellables)

    }
}
