//
//  SearchRouter.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class SearchRouter {
    
    private weak var viewController: SearchViewController?
    
    init(viewController: SearchViewController) {
        self.viewController = viewController
    }
    
}

extension SearchRouter: SearchRouterProtocol {
    
    // MARK: Navigation
    func navigateToCategories(selectedCategoriesIds: [Int]) {
        let categoriesViewController = CategoriesConfigurator.viewcontroller(outputDelegate: viewController, selectedCategoriesIds: selectedCategoriesIds)
        viewController?.navigationController?.pushViewController(categoriesViewController, animated: true)
    }
    
    func navigateToSearchResult(viewModels: [SearchModel.ViewModel]) {
        let searchResultViewController = SearchResultsConfigurator.viewcontroller(viewModels: viewModels)
        viewController?.navigationController?.pushViewController(searchResultViewController, animated: true)
    }
}
