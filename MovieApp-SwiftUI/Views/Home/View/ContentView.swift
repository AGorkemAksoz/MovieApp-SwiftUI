//
//  ContentView.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 3.06.2024.
//

import SwiftUI
import SwiftUIIntrospect

struct ContentView: View {
    @StateObject var postViewModel = PostViewModel(postService: PostService())
    @StateObject var viewModel = HomeViewModel(movieService: MovieService())
    @ObservedObject var delegate = ScrollDelegate()
    
    var body: some View {
        
        NavigationView {
                ScrollView {
                    ScrollViewReader { scrollViewProxy in
                        LazyVStack {
                            ForEach(viewModel.movies, id: \.id ) { movie in
                                NavigationLink {
                                    DetailPage(movie: movie)
                                } label: {
                                    Text(movie.title!)
                                        .padding(.bottom, 8)
                                }

                                Divider()
                            }
                            .onAppear {
                                withAnimation {
                                    scrollViewProxy.scrollTo(viewModel.movies.last?.id, anchor: .bottom)
                                }
                            }
                        }
                    }
                }
                .introspect(.scrollView, on: .iOS(.v15, .v16, .v17), customize: { scrollView in
                    scrollView.delegate = delegate
                    delegate.viewModel = viewModel
                })
            .padding()
            .onAppear {
                viewModel.fetchMovies()
            }
            .navigationTitle("Popular Movies")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

final class ScrollDelegate: NSObject, UIScrollViewDelegate, ObservableObject {
    @ObservedObject var viewModel = HomeViewModel(movieService: MovieService())

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.y <= 60 {
            print("NEW PAGE!")
            DispatchQueue.main.async {
                self.viewModel.fetchOtherPages()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
