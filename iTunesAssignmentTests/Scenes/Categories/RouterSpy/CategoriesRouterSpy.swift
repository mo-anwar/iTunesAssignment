//
//  CategoriesRouterSpy.swift
//  iTunesAssignmentTests
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
@testable import iTunesAssignment

final class CategoriesRouterSpy: CategoriesRouterProtocol {
    
    var popCallCount = 0
    
    func pop() {
        popCallCount += 1
    }
    

}
