//
//  SearchInteractor.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

final class SearchInteractor/*: SearchViewControllerDataSource */ {
    var output: SearchInteractorOutputProtocol!
    var worker: SearchWorker = SearchWorker()
}

extension SearchInteractor: SearchViewControllerOutputProtocol {

}

