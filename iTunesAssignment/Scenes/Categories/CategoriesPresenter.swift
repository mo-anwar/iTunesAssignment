//
//  CategoriesPresenter.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

final class CategoriesPresenter {
    
   private weak var output: CategoriesPresenterOutputProtocol?
    
    init(output: CategoriesPresenterOutputProtocol) {
        self.output = output
    }
}

extension CategoriesPresenter: CategoriesInteractorOutputProtocol {
    
    func dispaly(items: [CategoriesModel.ViewModel.Category]) {
        output?.dispaly(items: items)
    }
}
