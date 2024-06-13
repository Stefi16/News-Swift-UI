//
//  PostData.swift
//  news
//
//  Created by Stefka Krachunova on 13.06.24.
//

import Foundation

struct PostData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    
    let points: Int
    let title: String
    let url: String?
    let objectID: String
}
