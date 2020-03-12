//
//  UICollectionViewCellExtensions.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    class var cellId: String {
        return "\(self)"
    }
}

extension UICollectionReusableView {
    class var headerId: String {
        return "\(self)"
    }
}
