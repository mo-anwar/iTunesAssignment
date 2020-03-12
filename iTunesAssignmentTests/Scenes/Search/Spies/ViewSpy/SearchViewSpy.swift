//
//  SearchViewSpy.swift
//  iTunesAssignmentTests
//
//  Created by Mohamed anwar on 3/12/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
@testable import iTunesAssignment

final class SearchViewSpy: SearchViewControllerInputProtocol, CategoriesViewControllerOutputDelegate, SearchPresenterOutputProtocol {
    
    var output: SearchViewControllerOutputProtocol!
    var router: SearchRouterProtocol!
    
    var passedError: String!
    var passedCategories = [CategoriesModel.ViewModel.Category]()
    var passedItems = [SearchModel.ViewModel]()
    
    var showIndicatorCallCount = 0
    var hideIndicatorCallCount = 0
    var showErrorCallCount = 0
    var displayItemsCallCount = 0
    var displayCategoriesCallCount = 0

    func didChooseCategories(items: [CategoriesModel.ViewModel.Category]) {
        passedCategories = items
        displayCategoriesCallCount += 1
    }
    
    func showIndicator() {
        showIndicatorCallCount += 1
    }
    
    func hideIndicator() {
        hideIndicatorCallCount += 1
    }
    
    func showError(error: String) {
        showErrorCallCount += 1
        passedError = error
    }
    
    func display(items: [SearchModel.ViewModel]) {
        displayItemsCallCount += 1
        passedItems = items
        router.navigateToSearchResult(viewModels: items)
    }
}
