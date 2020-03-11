//
//  SearchRouter.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class SearchRouter {
    weak var viewController: SearchViewController!
}

extension SearchRouter: SearchRouterProtocol {
   
    // MARK: Navigation
    func navigateToCategories(selectedCategoriesIds: [Int]) {
        viewController.navigationController?.pushViewController(CategoriesConfigurator.viewcontroller(outputDelegate: viewController, selectedCategoriesIds: selectedCategoriesIds), animated: true)
    }
}
