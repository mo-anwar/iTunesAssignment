//
//  CategoriesRouter.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class CategoriesRouter {
    weak var viewController: CategoriesViewController!
}

extension CategoriesRouter: CategoriesRouterProtocol {
   
    // MARK: Navigation
    func pop() {
        viewController.pop()
    }
}
