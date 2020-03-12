//
//  SearchWorkerStub.swift
//  iTunesAssignmentTests
//
//  Created by Mohamed anwar on 3/12/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit
@testable import iTunesAssignment

final class SearchWorkerStub: SearchWorkerProtocol {
    
    var parameters: SearchModel.Request!
    var searchResultToBeReturned: SearchResult!
    
    func search(parameters: SearchModel.Request, completionHandler: @escaping (SearchResult) -> Void) {
        self.parameters = parameters
        completionHandler(searchResultToBeReturned)
    }
}
