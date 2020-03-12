//
//  CategoriesConfigurator.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class CategoriesConfigurator {
    
    // MARK: Configuration
    class func viewcontroller(outputDelegate: CategoriesViewControllerOutputDelegate, selectedCategoriesIds: [Int]) -> CategoriesViewController {
        let viewController = CategoriesViewController()
        
        let presenter = CategoriesPresenter()
        presenter.output = viewController
        
        let interactor = CategoriesInteractor(selectedCategoriesIds: selectedCategoriesIds)
        interactor.output = presenter
        
        let router = CategoriesRouter()
        router.viewController = viewController

        viewController.output = interactor
        viewController.router = router
        viewController.outputDelegate = outputDelegate
        return viewController
    }
}

// MARK: View Interface
protocol CategoriesViewControllerOutputProtocol {
    func getItems()
    func didSelectRow(at indexPath: IndexPath)
}

// MARK: Interactor Interface
protocol CategoriesInteractorOutputProtocol {
    func dispaly(items: [CategoriesModel.ViewModel.Category])
}

// MARK: Presenter Interface
protocol CategoriesPresenterOutputProtocol: class {
    func dispaly(items: [CategoriesModel.ViewModel.Category])
}

// MARK: Router
protocol CategoriesRouterProtocol {

}

// MARK: View OutputDelegate
protocol CategoriesViewControllerOutputDelegate: class {
    func didChooseCategories(items: [CategoriesModel.ViewModel.Category])
}
