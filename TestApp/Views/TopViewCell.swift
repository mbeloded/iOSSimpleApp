//
//  TopViewCell.swift
//  TestApp
//
//  Created by Michael Beloded on 14.07.2022.
//

import Foundation
import UIKit
import Kingfisher

class TopViewCell: UICollectionViewCell {
    
    struct Constants {
        let borderColor = UIColor.orange.cgColor
        let onlineStatusColor = UIColor.green
        let awayStatusColor = UIColor.orange
        let borderWidth = CGFloat(1.0)
        let borderRadius = CGFloat(4.0)
    }
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var statusView: UIView!
    
    var data: TopCell?  {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let constants = Constants()
        
        self.layer.borderColor = constants.borderColor
        self.layer.borderWidth = constants.borderWidth
        self.layer.cornerRadius = constants.borderRadius
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bgImage.image = nil
        statusView.isHidden = true
    }
    
    func updateUI() {
        if let imageUrlString = data?.picture.thumbnail, let imageUrl = URL.init(string: imageUrlString) {
            self.bgImage?.kf.setImage(with: imageUrl,
                                                options: [
                                                    .scaleFactor(UIScreen.main.scale),
                                                    .transition(.fade(1)),
                                                    .cacheOriginalImage
                ])
        }
        
        statusView.isHidden = false
        statusView.backgroundColor = Constants().awayStatusColor
    }
}
