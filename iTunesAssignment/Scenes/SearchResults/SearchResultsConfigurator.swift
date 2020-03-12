//
//  SearchResultsConfigurator.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class SearchResultsConfigurator {
    
    // MARK: Configuration
    class func viewcontroller(viewModels: [SearchModel.ViewModel]) -> SearchResultsViewController {
        let viewController = SearchResultsViewController(viewModels: viewModels)
        
        let router = SearchResultsRouter()
        router.viewController = viewController
        viewController.router = router
        return viewController
    }
}

// MARK: Router
protocol SearchResultsRouterProtocol {
    func navigateToResultDetails(model: SearchModel.ViewModel.Result)
}
