//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by eng.omar on 28/09/2024.
//

import Foundation


class HomeViewModel {
    var networkService: NetworkService!
    var topRateMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var popularMovies: [Movie] = []
    var upcomingMovies: [Movie] = []

    init() {
        networkService = NetworkService()
    }

    func fetchMovies(for url: String, completionHandler: @escaping ([Movie]) -> Void) {
        networkService.request(url, method: .GET, parameters: nil, headers: nil) { (result: Result<TopRateModel, Error>) in
            switch result {
            case .success(let response):
                completionHandler(response.results)
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler([]) 
            }
        }
    }
}

