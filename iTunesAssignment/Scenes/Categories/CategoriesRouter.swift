//
//  CategoriesRouter.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class CategoriesRouter: CategoriesRouterProtocol {
    
    private weak var viewController: CategoriesViewController!
    
    init(viewController: CategoriesViewController) {
        self.viewController = viewController
    }
    
    // MARK: Navigation
    func pop() {
        viewController.pop()
    }
}
