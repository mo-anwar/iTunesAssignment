//
//  CategoriesViewSpy.swift
//  iTunesAssignmentTests
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit
@testable import iTunesAssignment

final class CategoriesViewSpy: CategoriesViewControllerInputProtocol, CategoriesPresenterOutputProtocol {
    
    var output: CategoriesViewControllerOutputProtocol!
    var outputDelegate: CategoriesViewControllerOutputDelegate?
    var router: CategoriesRouterProtocol!
    
    var dispalyItemsCallCount = 0
    var passedDispalyItems = [CategoriesModel.ViewModel.Category]()
    
    func dispaly(items: [CategoriesModel.ViewModel.Category]) {
        dispalyItemsCallCount += 1
        passedDispalyItems = items
    }
}
