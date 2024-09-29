//
//  ImageLoader.swift
//  MovieApp
//
//  Created by eng.omar on 28/09/2024.
//

import Foundation
import UIKit

//extension UIImageView {
//    func loadImage(from urlString: String) {
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL string: \(urlString)")
//            return
//        }
//        DispatchQueue.global().async {
//            if let data = try? Data(contentsOf: url) {
//                // Convert data to UIImage
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self.image = image
//                    }
//                } else {
//                    print("Invalid image data")
//                }
//            } else {
//                print("Failed to load data from URL")
//            }
//        }
//    }
//}

extension UIImageView {
    func loadImage(from posterPath: String) {
        let imgURL = imgParameters.imgHeader.rawValue + imgParameters.imgSize.rawValue + posterPath
        print(imgURL)
        guard let url = URL(string: imgURL) else {
            print("Invalid URL string: \(imgURL)")
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } else {
                    print("Invalid image data")
                }
            } else {
                print("Failed to load data from URL")
            }
        }
    }
}
