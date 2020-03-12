//
//  SearchRouterSpy.swift
//  iTunesAssignmentTests
//
//  Created by Mohamed anwar on 3/12/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
@testable import iTunesAssignment

final class SearchRouterSpy: SearchRouterProtocol {
    
    var passedSelectedCategoriesIds: [Int]!
    var passedViewModels = [SearchModel.ViewModel]()
    var passedCategories = [CategoriesModel.ViewModel.Category]()
    var passedItems = [SearchModel.ViewModel]()
    
    var navigateToCategoriesCallCount = 0
    var navigateToSearchResultCallCount = 0

    func navigateToCategories(selectedCategoriesIds: [Int]) {
        passedSelectedCategoriesIds = selectedCategoriesIds
        navigateToCategoriesCallCount += 1
    }
    
    func navigateToSearchResult(viewModels: [SearchModel.ViewModel]) {
        navigateToSearchResultCallCount += 1
        passedViewModels = viewModels
    }
}
