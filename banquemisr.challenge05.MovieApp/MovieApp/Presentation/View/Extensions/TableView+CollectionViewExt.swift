//
//  TableView+CollectionViewExt.swift
//  MovieApp
//
//  Created by eng.omar on 28/09/2024.
//

import Foundation
import UIKit

extension  UITableView {
    
    func RegisterNib<cell : UITableViewCell>(cell : cell.Type){
        
        
        let nibName = String(describing : cell.self)
        
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
        
        
    }
    
    
    func dequeue<cell : UITableViewCell>() -> cell{
        
        let identifier = String(describing: cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? cell else {
            fatalError("error in cell")
        }
        
        return cell
    }
    
}
extension UICollectionView {
    
    func RegisterNib<cell : UICollectionViewCell>(cell : cell.Type){
           
           
           let nibName = String(describing : cell.self)
           
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
           
           
       }
       
       
       
    
}
