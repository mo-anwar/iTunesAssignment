//
//  CategoryTableViewCell.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var categoryNameLabel: UILabel!
    
    func configure(model: CategoriesModel.ViewModel.Category) {
        categoryNameLabel.text = model.name
        accessoryType = model.isSelected ? .checkmark : .none
    }
}
