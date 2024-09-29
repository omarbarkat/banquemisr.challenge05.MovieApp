//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by eng.omar on 29/09/2024.
//

import Foundation

class MovieDetailsViewModel {
    var networkService: NetworkService!
    var movieDetails: MovieDetailsModel?
    var videoKey: String?

    
    init() {
        networkService = NetworkService()
    }
    func convertMinutesToHoursAndMinutes(minutes: Int) -> (hours: Int, minutes: Int) {
        let hours = minutes / 60
        let remainingMinutes = minutes % 60
        return (hours, remainingMinutes)
    }
    func getMovieDetails(movieID: Int, ComplectionHandler: @escaping () -> Void) {
        let endPoint = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=26eb897c657afb488d46bb17c384e8d9"
        networkService.request(endPoint, method: .GET, parameters: nil, headers: nil) { (result:Result<MovieDetailsModel, Error>) in
            print(result)
            switch result {
            case .success(let response):
                self.movieDetails = response
                ComplectionHandler()
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func getMovieTrailer(movieID: Int, completionHandler: @escaping () -> Void) {
          let endPoint = "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=26eb897c657afb488d46bb17c384e8d9"
          
        networkService.request(endPoint, method: .GET, parameters: nil, headers: nil) { (result:Result<VideoResponseModel, Error>) in
            print(result)
            switch result {
            case .success(let response):
                if let trailer = response.results.first(where: { $0.type == "Trailer" && $0.site == "YouTube"}) {
                                 self.videoKey = trailer.key
                             }
                             completionHandler()
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
      }
}
