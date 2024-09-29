//
//  CollectionViewNibCell.swift
//  MovieApp
//
//  Created by eng.omar on 28/09/2024.
//

import UIKit

class CollectionViewNibCell: UICollectionViewCell {
    //Outlets:
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var sectionView: UIView!
    @IBOutlet weak var imgMoviePoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        sectionView.layer.cornerRadius = 15
        imgMoviePoster.layer.cornerRadius = 15
    }

}
