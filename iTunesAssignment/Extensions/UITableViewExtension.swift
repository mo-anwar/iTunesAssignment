//
//  UITableViewExtension.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
         guard let cell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else { fatalError("DequeueReusableCell failed while casting") }
        return cell
    }
    
    func register<T: UITableViewCell>(cell: T.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.className)
    }
    
    func register<T: UITableViewHeaderFooterView>(headerFooter: T.Type) {
        register(headerFooter.nib, forHeaderFooterViewReuseIdentifier: headerFooter.className)
    }
}
