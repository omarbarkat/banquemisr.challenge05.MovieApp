//
//  VideoResponseModel.swift
//  MovieApp
//
//  Created by eng.omar on 29/09/2024.
//

import Foundation

import Foundation

struct VideoResponseModel: Codable {
    let id: Int
    let results: [Video]
}

struct Video: Codable {
    let name: String
    let key: String
    let site: String
    let type: String
}
