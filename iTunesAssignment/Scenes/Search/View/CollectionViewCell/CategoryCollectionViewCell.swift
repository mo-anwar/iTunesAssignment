//
//  CategoryCollectionViewCell.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryNameLabel: UILabel!

    func configure(name: String) {
        categoryNameLabel.text = name
    }
}
