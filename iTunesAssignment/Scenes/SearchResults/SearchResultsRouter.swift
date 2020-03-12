//
//  SearchResultsRouter.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class SearchResultsRouter {
    weak var viewController: SearchResultsViewController!
}

extension SearchResultsRouter: SearchResultsRouterProtocol {
    
    func navigateToResultDetails(model: SearchModel.ViewModel.Result) {
       viewController.navigationController?.pushViewController(ResultDetailsConfigurator.viewcontroller(model: model), animated: true)
   }
    
}
