//
//  ContentView.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 3.06.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PostViewModel(postService: PostService())
    
    var body: some View {
        
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts, id: \.id ) { post in
                        Text(post.title)
                            .padding(.bottom, 8)

                        Divider()
                    }
                }
            }
        .padding()
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

#Preview {
    ContentView()
}
