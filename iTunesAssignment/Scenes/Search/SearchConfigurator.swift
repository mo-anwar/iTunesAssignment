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
        let presenter = SearchPresenter(output: viewController)
        let interactor = SearchInteractor(output: presenter, worker: SearchWorker())
        let router = SearchRouter(viewController: viewController)
        
        viewController.output = interactor
        viewController.router = router
        
        return viewController
    }
}

// MARK: View Interface
protocol SearchViewControllerInputProtocol {
    var output: SearchViewControllerOutputProtocol! { get }
    var router: SearchRouterProtocol! { get }
}

protocol SearchViewControllerOutputProtocol {
    func search(term: String, entities: [String])
}

// MARK: Interactor Interface

protocol SearchInteractorOutputProtocol {
    func showIndicator()
    func hideIndicator()
    func showError(error: Error)
    func display(items: [SearchModel.Response])
}

// MARK: Presenter Interface
protocol SearchPresenterOutputProtocol: class {
    func showIndicator()
    func hideIndicator()
    func showError(error: String)
    func display(items: [SearchModel.ViewModel])
}

// MARK: Router
protocol SearchRouterProtocol {
    func navigateToCategories(selectedCategoriesIds: [Int])
    func navigateToSearchResult(viewModels: [SearchModel.ViewModel])
}

// MARK: Worker
typealias SearchResult = Result<SearchModel.Response, Error>

protocol SearchWorkerProtocol: class {
    func search(parameters: SearchModel.Request, completionHandler: @escaping (SearchResult) -> Void)
}
