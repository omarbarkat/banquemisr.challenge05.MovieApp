//
//  APIConstants.swift
//  MovieApp
//
//  Created by eng.omar on 28/09/2024.
//

import Foundation
enum Parameters {
    static func apiKeyParameter() -> [String: Any] {
        return [
            "api_key": "95a89943de5af0ccb83f6a10a3c30c21"
        ]
    }
}

enum MovieAPI {
    case topRated
    case nowPlaying
    case popular
    case upcoming
    
    var url: String {
        switch self {
        case .topRated:
            return "https://api.themoviedb.org/3/movie/top_rated?api_key=26eb897c657afb488d46bb17c384e8d9"
        case .nowPlaying:
            return "https://api.themoviedb.org/3/movie/now_playing?api_key=26eb897c657afb488d46bb17c384e8d9"
        case .popular:
            return "https://api.themoviedb.org/3/movie/popular?api_key=26eb897c657afb488d46bb17c384e8d9"
        case .upcoming:
            return "https://api.themoviedb.org/3/movie/upcoming?api_key=26eb897c657afb488d46bb17c384e8d9"
        }
    }
}
