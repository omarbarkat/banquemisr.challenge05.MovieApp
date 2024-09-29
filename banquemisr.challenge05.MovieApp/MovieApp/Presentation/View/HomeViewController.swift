//
//  ViewController.swift
//  MovieApp
//
//  Created by eng.omar on 27/09/2024.
//

import UIKit

class HomeViewController: UIViewController, MovieSelectionDelegate {
    func didSelectMovie(_ movieID: Int) {
        let vc = storyboard?.instantiateViewController(identifier: "MovieDetailsVC") as! MovieDetailsVC
        vc.moviID = movieID
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Variable:
    var viewModel: HomeViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.RegisterNib(cell: TopRateNibCell.self)
        viewModel = HomeViewModel()
        homeSetupUI()
    }
    func homeSetupUI() {
        viewModel.fetchMovies(for: MovieAPI.topRated.url) { [weak self] movies in
            self?.viewModel.topRateMovies = movies
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        viewModel.fetchMovies(for: MovieAPI.nowPlaying.url) { [weak self] movies in
            self?.viewModel.nowPlayingMovies = movies
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        viewModel.fetchMovies(for: MovieAPI.popular.url) { [weak self] movies in
            self?.viewModel.popularMovies = movies
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        viewModel.fetchMovies(for: MovieAPI.upcoming.url) { [weak self] movies in
            self?.viewModel.upcomingMovies = movies
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopRateNibCell", for: indexPath) as! TopRateNibCell
        switch indexPath.row {
        case 0:
            cell.lblSectionTitle.text = "Top Rate"
            cell.delegate = self
            cell.btnSeeMore.isHidden = true
            cell.configure(with: viewModel.topRateMovies, for: indexPath)
        case 1:
            cell.lblSectionTitle.text = "Now Playing"
            cell.delegate = self
            cell.btnSeeMore.isHidden = false

            cell.seeMore = { [weak self] in
                let vc = self?.storyboard?.instantiateViewController(withIdentifier: "NowPlayingVC") as! NowPlayingVC
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            cell.configure(with: viewModel.nowPlayingMovies, for: indexPath)

        case 2:
            cell.lblSectionTitle.text = "Popular"
            cell.delegate = self
            cell.btnSeeMore.isHidden = false

            cell.seeMore = { [weak self] in
                let vc = self?.storyboard?.instantiateViewController(withIdentifier: "PopularVC") as! PopularVC
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            cell.configure(with: viewModel.popularMovies, for: indexPath)

        case 3:
            cell.lblSectionTitle.text = "Upcoming Movies"
            cell.delegate = self
            cell.btnSeeMore.isHidden = false

            cell.seeMore = { [weak self] in
                let vc = self?.storyboard?.instantiateViewController(withIdentifier: "UpcomingMoviesVC") as! UpcomingMoviesVC
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            cell.configure(with: viewModel.upcomingMovies, for: indexPath)

        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
