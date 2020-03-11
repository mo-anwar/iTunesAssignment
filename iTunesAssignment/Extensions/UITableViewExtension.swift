//
//  UITableViewExtension.swift
//  Dubai Police
//
//  Created by Vortex on 10/21/19.
//  Copyright © 2019 Vortex. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }
    
    func register<T: UITableViewCell>(cell: T.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.className)
    }
    
    func register<T: UITableViewHeaderFooterView>(headerFooter: T.Type) {
        register(headerFooter.nib, forHeaderFooterViewReuseIdentifier: headerFooter.className)
    }
}
