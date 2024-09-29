//
//  TopRateNibCell.swift
//  MovieApp
//
//  Created by eng.omar on 28/09/2024.
//

import UIKit

class TopRateNibCell: UITableViewCell {
    // Variables:
    var movies: [Movie] = []
    var sectionIndex: Int = 0
    weak var delegate: MovieSelectionDelegate?
    
    
    //Outlets:
    @IBOutlet weak var btnSeeMore: UIButton!
    @IBOutlet weak var lblSectionTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.RegisterNib(cell: CollectionViewNibCell.self)
    }
    //Actions:
    @IBAction func btnSeeMore(_ sender: Any) {
        seeMoreBtn()
    }
    var seeMore: (() -> ())?
    func seeMoreBtn(){
        seeMore?()
        
    }
    func configure(with movies: [Movie], for indexPath: IndexPath) {
        self.movies = movies
        self.sectionIndex = indexPath.row
        collectionView.reloadData()
    }
}

extension TopRateNibCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewNibCell", for: indexPath) as! CollectionViewNibCell
        let movie = movies[indexPath.row]
        
        if let posterPath = movie.posterPath {
//            print(posterPath)
            cell.imgMoviePoster.loadImage(from: posterPath)
            
        }
        
        cell.lblMovieTitle.text = movie.title
        cell.lblReleaseDate.text = movie.releaseDate
        cell.layer.cornerRadius = 15
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch sectionIndex {
          case 0:
              return CGSize(width: collectionView.bounds.width - 40, height: collectionView.bounds.height - 25)
          case 1:
              return CGSize(width: collectionView.bounds.width / 2 - 20, height: collectionView.bounds.height - 25)
          case 2:
              return CGSize(width: collectionView.bounds.width - 10, height: collectionView.bounds.height - 25)
          case 3:
              return CGSize(width: collectionView.bounds.width / 2 - 20, height: collectionView.bounds.height - 25)
        default:
            print("ok")
        }
        return CGSize(width: 10, height: 10)
      }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ok")
//        let stroyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = stroyBoard.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsVC
        let movieID = movies[indexPath.row].id
        delegate?.didSelectMovie(movieID)
        
    }
}



//class TopRateNibCell: UITableViewCell {
//    //Variables:
//    var movies: [Movie] = []
//    var viewModel: HomeViewModel!
//    var img: UIImageView?
//    @IBOutlet weak var lblSectionTitle: UILabel!
//    @IBOutlet weak var collectionView: UICollectionView!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        viewModel = HomeViewModel()
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.RegisterNib(cell: CollectionViewNibCell.self)
//        
//        viewModel.getTopRateData { [weak self] in
//            DispatchQueue.main.async {
//                self?.collectionView.reloadData()
//            }
//            
//        }
//
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
//    
//}
//extension TopRateNibCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return movies.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewNibCell", for: indexPath) as! CollectionViewNibCell
////        guard let img = viewModel.arrTopRate[indexPath.row].posterPath else { return cell }
////        cell.imgMoviePoster.loadImage(from: img)
//        let movie = movies[indexPath.row]
//        if let posterPath = movies[indexPath.row].posterPath {
//            // كون الرابط الكامل للصورة
//            let imgURL = "https://image.tmdb.org/t/p/w500" + posterPath
//            
//            // استخدم الدالة `loadImage` لتحميل الصورة
//            cell.imgMoviePoster.loadImage(from: posterPath)
//        }
//        cell.lblMovieTitle.text = movie.title
//        cell.lblReleaseDate.text = movie.releaseDate
//        cell.layer.cornerRadius = 15
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width - 40, height: collectionView.bounds.height - 25)
//    }
//    
//}
