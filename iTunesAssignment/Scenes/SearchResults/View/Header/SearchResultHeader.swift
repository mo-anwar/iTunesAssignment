//
//  SearchResultHeader.swift
//  iTunesAssignment
//
//  Created by Mohamed anwar on 3/12/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class SearchResultHeader: UICollectionReusableView {

    @IBOutlet private weak var headerNameLabel: UILabel!
    
    func configure(name: String) {
        headerNameLabel.text = name.capitalized
    }
}
