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
    class func viewcontroller(results: SearchResultViewModel) -> SearchResultsViewController {
        let viewController = SearchResultsViewController(results: results)
        
        let router = SearchResultsRouter()
        router.viewController = viewController
        viewController.router = router
        return viewController
    }
}

// MARK: View Interface
protocol SearchResultsViewControllerOutputProtocol {

}

// MARK: Router
protocol SearchResultsRouterProtocol {

}
