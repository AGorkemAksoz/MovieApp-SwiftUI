//
//  Post.swift
//  MovieApp-SwiftUI
//
//  Created by Gorkem on 3.06.2024.
//

import Foundation

// MARK: - PostElement
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
