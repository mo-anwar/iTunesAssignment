//
//  SearchResultsInteractor.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//
//  Template generated by Savvycom
//

class SearchResultsInteractor/*: SearchResultsViewControllerDataSource */ {
    var output: SearchResultsInteractorOutputProtocol!
    var worker: SearchResultsWorker = SearchResultsWorker()
}

extension SearchResultsInteractor: SearchResultsViewControllerOutputProtocol {

}

