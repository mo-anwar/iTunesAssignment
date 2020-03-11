//
//  UICollectionViewExtension.swift
//  Dubai Police
//
//  Created by Vortex on 10/21/19.
//  Copyright © 2019 Vortex. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as! T
    }
    
    func register<T: UICollectionViewCell>(cell: T.Type) {
        register(cell.nib, forCellWithReuseIdentifier: cell.className)
    }
}
