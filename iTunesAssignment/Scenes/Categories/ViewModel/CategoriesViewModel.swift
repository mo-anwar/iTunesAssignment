//
//  CategoriesViewModel.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.

import Foundation

struct CategoriesModel {

    struct ViewModel {
        var categories: [Category]

        struct Category {
            let id: Int
            let name: String
            var isSelected: Bool = false
        }
    }
}
