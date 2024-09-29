//
//  MovieSelectionDelegation.swift
//  MovieApp
//
//  Created by eng.omar on 29/09/2024.
//

import Foundation
protocol MovieSelectionDelegate: AnyObject {
    func didSelectMovie(_ movieID: Int)
}
