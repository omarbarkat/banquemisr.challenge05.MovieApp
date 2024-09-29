//
//  NowPlayingVC.swift
//  MovieApp
//
//  Created by eng.omar on 29/09/2024.
//

import UIKit


class NowPlayingVC: UIViewController {
    var viewModel: HomeViewModel!

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeViewModel()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.RegisterNib(cell: CollectionViewNibCell.self)
        fetchMovies()
    }

    private func fetchMovies() {
        viewModel.fetchMovies(for: MovieAPI.nowPlaying.url) { [weak self] movies in
            self?.viewModel.nowPlayingMovies = movies
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

extension NowPlayingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.nowPlayingMovies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewNibCell", for: indexPath) as! CollectionViewNibCell
        let movie = viewModel.nowPlayingMovies[indexPath.row]

        cell.lblMovieTitle.text = movie.title
        cell.lblReleaseDate.text = movie.releaseDate

        if let posterPath = movie.posterPath {
            cell.imgMoviePoster.loadImage(from: posterPath)
        }
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 15

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = viewModel.nowPlayingMovies[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(identifier: "MovieDetailsVC") as! MovieDetailsVC
        vc.moviID = selectedMovie.id
        navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 50, height: collectionView.bounds.height / 3.5)
    }
}
