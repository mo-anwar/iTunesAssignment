//
//  SearchResultGridCell.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

class SearchResultGridCell: UICollectionViewCell {
    
    @IBOutlet private weak var previewImageView: UIImageView!
    @IBOutlet private weak var trackNameLabel: UILabel!
    
    func configure(model: SearchModel.ViewModel.Result) {
        previewImageView.load(url: URL(string: model.artworkUrl100))
        trackNameLabel.text = model.trackName ?? model.collectionName ?? ""
    }

}
