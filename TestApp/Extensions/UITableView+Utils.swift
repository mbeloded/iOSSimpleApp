//
//  UITableView+Utils.swift
//  TestApp
//
//  Created by Michael Beloded on 19.07.2022.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell(_ cellClass: UITableViewCell.Type) {
        register(UINib(nibName: "\(cellClass)", bundle: nil), forCellReuseIdentifier: "\(cellClass)")
    }
    
    func registerHeaderFooterView(_ cellClass: UITableViewHeaderFooterView.Type) {
        register(UINib(nibName: "\(cellClass)", bundle: nil), forHeaderFooterViewReuseIdentifier: "\(cellClass)")
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: "\(type)", for: indexPath) as! T
    }
    
    func dequeueReusableHeaderView<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: "\(type)") as! T
    }
}
