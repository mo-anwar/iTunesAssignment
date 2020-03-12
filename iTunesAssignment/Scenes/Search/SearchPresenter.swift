//
//  SearchPresenter.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

final class SearchPresenter {
    
    private weak var output: SearchPresenterOutputProtocol?
    
    init(output: SearchPresenterOutputProtocol) {
        self.output = output
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    
    func display(items: [SearchModel.Response]) {
        let viewModels = items.compactMap {
            SearchModel.ViewModel(
                header: $0.entity ?? "",
                resulsts: $0.results?.compactMap { SearchModel.ViewModel.Result(model: $0) } ?? []
            )
        }
        output?.display(items: viewModels)
    }
    
    func showIndicator() {
        output?.showIndicator()
    }
    
    func hideIndicator() {
        output?.hideIndicator()
    }
    
    func showError(error: Error) {
        output?.showError(error: error.localizedDescription)
    }
    
}
