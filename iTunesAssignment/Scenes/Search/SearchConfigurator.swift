//
//  SearchConfigurator.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class SearchConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> SearchViewController {
        let viewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        
        let presenter = SearchPresenter()
        presenter.output = viewController
        
        let interactor = SearchInteractor()
        interactor.output = presenter
        
        let router = SearchRouter()
        router.viewController = viewController

        viewController.output = interactor
        viewController.router = router
        
        return viewController
    }
}

// MARK: View Interface
protocol SearchViewControllerOutputProtocol {

}

// MARK: Interactor Interface
protocol SearchInteractorOutputProtocol {

}

// MARK: Presenter Interface
protocol SearchPresenterOutputProtocol: class {
    
}

// MARK: Router
protocol SearchRouterProtocol {

}
