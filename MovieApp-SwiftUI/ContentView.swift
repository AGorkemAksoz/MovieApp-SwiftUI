//
//  ContentView.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 3.06.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var postViewModel = PostViewModel(postService: PostService())
    @StateObject var viewModel = HomeViewModel(movieService: MovieService())
    
    var body: some View {
        
        VStack {
            Text("Placeholder")
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.movies, id: \.id ) { movie in
                        Text(movie.originalTitle!)
                            .padding(.bottom, 8)

                        Divider()
                    }
                }
            }
        .padding()
        }
        .onAppear {
            viewModel.fetchMovies()
        }
    }
}

#Preview {
    ContentView()
}
