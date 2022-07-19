//
//  MainViewCell.swift
//  TestApp
//
//  Created by Michael Beloded on 14.07.2022.
//

import Foundation
import UIKit

class MainViewCell: UITableViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var likesBtn: UIButton!
    @IBOutlet weak var commentsBtn: UIButton!
    
    struct Constants {
        let height = CGFloat(384.0)
        let bgCornerRadius = CGFloat(12.0)
    }
    
    var data: MainCell? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.lightGray
        
        self.bgView.layer.cornerRadius = Constants().bgCornerRadius
        self.bgView.layer.masksToBounds = true
        
        self.selectionStyle = .none
        
        self.updateConstraintsIfNeeded()
    }
    
    func updateUI() {
        
        name?.text = data?.name.title ?? "---"
        location?.text = data?.location.country ?? "---"
        
        if let imageUrlString = data?.picture.thumbnail, let imageUrl = URL.init(string: imageUrlString) {
            self.thumb?.kf.setImage(with: imageUrl,
                                                options: [
                                                    .scaleFactor(UIScreen.main.scale),
                                                    .transition(.fade(1)),
                                                    .cacheOriginalImage
                ])
        }
        
        if let largeUrlString = data?.picture.large, let mainImageUrl = URL.init(string: largeUrlString) {
            self.mainImg?.kf.setImage(with: mainImageUrl,
                                                options: [
                                                    .cacheOriginalImage
                ])
        }
        
        self.updateConstraintsIfNeeded()
    }
    
}
