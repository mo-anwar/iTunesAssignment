//
//  SearchInteractor.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//
import Foundation

final class SearchInteractor {
    
    var output: SearchInteractorOutputProtocol!
    var worker: SearchWorkerProtocol!
    private var error: Error?
    private var results = SearchResultResponse()
    private var dispatchGroup = DispatchGroup()
    
    private func search(parameters: SearchModel.Request) {
        worker.search(parameters: parameters) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                if let responseResults = response.results {
                    self.results.append((parameters.entity, responseResults))
                }
            case .failure(let error):
                self.error = error
            }
            self.dispatchGroup.leave()
        }
    }
}

extension SearchInteractor: SearchViewControllerOutputProtocol {
    func search(term: String, entities: [String]) {
        results.removeAll()
        output.showIndicator()
        entities.forEach { entity in
            dispatchGroup.enter()
            search(parameters: SearchModel.Request(entity: entity, term: term))
        }
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.output.hideIndicator()
            if let error = self.error, self.results.isEmpty {
                self.output.showError(error: error)
            } else {
                self.output.display(results: self.results)
            }
        }
    }
}
