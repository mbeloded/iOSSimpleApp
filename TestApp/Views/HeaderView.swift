//
//  HeaderCell.swift
//  TestApp
//
//  Created by Michael Beloded on 19.07.2022.
//

import Foundation
import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    struct Constants {
        let viewHeight = CGFloat(120.0)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [TopCell]? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.registerCell(TopViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateUI() {
        collectionView.reloadData()
    }
}

extension HeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: TopViewCell.self, for: indexPath)
        cell.data = data?[indexPath.row]
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
}
