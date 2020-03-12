//
//  SearchResultListCell.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class SearchResultListCell: SearchResultGridCell {
    
    @IBOutlet private weak var artistNameLabel: UILabel!
    
    override func configure(model: SearchModel.ViewModel.Result) {
        super.configure(model: model)
        artistNameLabel.text = model.artistName
    }

}
