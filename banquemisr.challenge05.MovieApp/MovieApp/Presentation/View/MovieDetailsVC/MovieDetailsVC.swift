//
//  MovieDetailsVC.swift
//  MovieApp
//
//  Created by eng.omar on 28/09/2024.
//

import UIKit
import WebKit

class MovieDetailsVC: UIViewController {
    //Variables:
    var viewModel: MovieDetailsViewModel!
    var moviID = 0
    //Outlets:
    //UIView:
    @IBOutlet weak var trailerWebView: WKWebView!
    @IBOutlet weak var headerView: UIView!
    //UIImage:
    @IBOutlet weak var imgMoviePoster: UIImageView!
    @IBOutlet weak var imgMovieBackground: UIImageView!
    //UILabel:
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieOverView: UILabel!
    @IBOutlet weak var lblMovieRate: UILabel!
    @IBOutlet weak var lblMovieGender2: UILabel!
    @IBOutlet weak var lblMovieGender1: UILabel!
    @IBOutlet weak var lblMovieTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MovieDetailsViewModel()
        imgMoviePoster.layer.cornerRadius = 15
        trailerWebView.layer.cornerRadius = 15
        getMovieDetails()
        getMovieTrailer()
        headerView.backgroundColor = headerView.backgroundColor?.withAlphaComponent(0.7)
    }
    //Actions:
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    //Methods:
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        let movie = viewModel.movieDetails
        lblMovieRate.text = "\(movie?.voteAverage ?? 0)/ 10 from TMDb"
        lblMovieTitle.text = movie?.title
        lblMovieGender1.text = movie?.genres[0].name
        lblMovieGender2.text = movie?.genres[1].name
        lblMovieOverView.text = movie?.overview
        lblMovieTime.text =  "\(viewModel.convertMinutesToHoursAndMinutes(minutes: movie?.runtime ?? 0))"
        if (movie?.posterPath) != nil {
            imgMoviePoster.loadImage(from: (movie?.posterPath)!)
            imgMovieBackground.loadImage(from: (movie?.backdropPath)!)
        }
     }
    private func loadTrailer(videoKey: String) {
           let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoKey)")!
           let request = URLRequest(url: youtubeURL)
           trailerWebView.load(request)
       }
    private func getMovieDetails() {
        viewModel.getMovieDetails(movieID: moviID) {
            DispatchQueue.main.async { [weak self] in
                self?.setupUI()
            }
        }
    }
    private func getMovieTrailer() {
        viewModel.getMovieTrailer(movieID: moviID) { [weak self] in
                if let videoKey = self?.viewModel.videoKey {
                    DispatchQueue.main.async {
                        self?.loadTrailer(videoKey: videoKey)
                    }
                }
            }
    }
    }
