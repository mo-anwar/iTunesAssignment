//
//  ResultDetailsConfigurator.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/12/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

final class ResultDetailsConfigurator {
    
    // MARK: Configuration
    class func viewcontroller(model: SearchModel.ViewModel.Result) -> ResultDetailsViewController {
        let viewController = ResultDetailsViewController(model: model)
        return viewController
    }
}
