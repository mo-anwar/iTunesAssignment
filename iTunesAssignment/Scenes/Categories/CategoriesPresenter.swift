//
//  CategoriesPresenter.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

class CategoriesPresenter {
    weak var output: CategoriesPresenterOutputProtocol!
    
}

extension CategoriesPresenter: CategoriesInteractorOutputProtocol {
    
    func dispaly(items: [CategoriesModel.ViewModel.Category]) {
        output.dispaly(items: items)
    }
}
