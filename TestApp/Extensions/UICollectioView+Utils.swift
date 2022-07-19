//
//  UICollectioView+Utils.swift
//  TestApp
//
//  Created by Michael Beloded on 19.07.2022.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCell(_ cellClass: UICollectionViewCell.Type) {
        register(UINib(nibName: "\(cellClass)", bundle: nil), forCellWithReuseIdentifier: "\(cellClass)")
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: "\(type)", for: indexPath) as! T //TODO: unsafe should be changed to optional later
    }
}
