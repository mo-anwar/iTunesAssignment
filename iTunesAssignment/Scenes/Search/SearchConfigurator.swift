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
        let viewController = SearchViewController()
        
        let presenter = SearchPresenter()
        presenter.output = viewController
        
        let interactor = SearchInteractor()
        interactor.output = presenter
        interactor.worker = SearchWorker()
        
        let router = SearchRouter()
        router.viewController = viewController

        viewController.output = interactor
        viewController.router = router
        
        return viewController
    }
}

// MARK: View Interface
protocol SearchViewControllerOutputProtocol {
    func search(term: String, entities: [String])
}

// MARK: Interactor Interface
typealias SearchResultResponse = [(String, [SearchModel.Response.Result])]
protocol SearchInteractorOutputProtocol {
    func showIndicator()
    func hideIndicator()
    func showError(error: Error)
    func display(results: SearchResultResponse)
}

// MARK: Presenter Interface
typealias SearchResultViewModel = [(String, [SearchModel.ViewModel.Result])]
protocol SearchPresenterOutputProtocol: class {
    func showIndicator()
    func hideIndicator()
    func showError(error: String)
    func display(results: SearchResultViewModel)
}

// MARK: Router
protocol SearchRouterProtocol {

}

// MARK: Worker
typealias SearchResult = Result<SearchModel.Response, Error>

protocol SearchWorkerProtocol: class {
    func search(parameters: SearchModel.Request, completionHandler: @escaping (SearchResult) -> Void)
}
