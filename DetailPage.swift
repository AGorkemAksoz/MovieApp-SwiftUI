//
//  DetailPage.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 5.06.2024.
//

import SwiftUI

struct DetailPage: View {
    let movie: MovieResult
    var body: some View {
        Text(movie.originalTitle!)
    }
}

//#Preview {
////    DetailPage(movie: <#MovieResult#>)
//}
