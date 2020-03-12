//
//  SearchPresenter.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

final class SearchPresenter {
    weak var output: SearchPresenterOutputProtocol!
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func display(results: SearchResultResponse) {
        var viewModels = SearchResultViewModel()
        results.forEach {
            viewModels.append(($0.0, $0.1.map { SearchModel.ViewModel.Result(model: $0)}))
        }
        output.display(results: viewModels)
    }
    
    func showIndicator() {
        output.showIndicator()
    }
    
    func hideIndicator() {
        output.hideIndicator()
    }
    
    func showError(error: Error) {
        if error as? ErrorHandler == .noAvailableData {
            output.showError(error: "No Available Data")
        } else {
            output.showError(error: error.localizedDescription)
        }
    }
    
}
