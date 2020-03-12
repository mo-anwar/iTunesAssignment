//
//  SearchTests.swift
//  iTunesAssignmentTests
//
//  Created by Mohamed anwar on 3/12/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import XCTest
@testable import iTunesAssignment

final class SearchTests: XCTestCase {
    
    var interactor: SearchInteractor!
    var worker: SearchWorkerStub!
    var presenter: SearchPresenter!
    var viewSpy: SearchViewSpy!
    var routerSpy: SearchRouterSpy!

    override func setUp() {
        viewSpy = SearchViewSpy()
        routerSpy = SearchRouterSpy()
        worker = SearchWorkerStub()
        presenter = SearchPresenter(output: viewSpy)
        interactor = SearchInteractor(output: presenter, worker: worker)
        viewSpy.output = interactor
        viewSpy.router = routerSpy
    }
    
    override func tearDown() {
        interactor = nil
        worker = nil
        presenter = nil
        routerSpy = nil
        viewSpy = nil
    }
    
    func testSearchSuccess() {
        // Given
        let response = SearchModel.response()
        let searchQuery = "Micheal Jackson"
        let entities = ["Album"]
        worker.searchResultToBeReturned = .success(response)
        
        // When
        viewSpy.output.search(term: searchQuery, entities: entities)
        
        // Then
        let expectation = XCTestExpectation(description: "All albums downloaded")
        DispatchQueue.main.async {
            XCTAssertEqual(self.viewSpy.showIndicatorCallCount, 1)
            XCTAssertEqual(self.viewSpy.hideIndicatorCallCount, 1)
            XCTAssertEqual(self.viewSpy.displayItemsCallCount, 1)
            XCTAssertEqual(self.viewSpy.passedItems.first?.resulsts.count, response.results?.count)
            XCTAssertEqual(self.routerSpy.navigateToSearchResultCallCount, 1)
            XCTAssertEqual(self.routerSpy.passedViewModels.first?.resulsts.count, response.results?.count)
            XCTAssertEqual(self.routerSpy.passedViewModels.first?.header, entities.first!)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testSearchFail() {
        // Given
        let error = NetworkError.noDataAvailable
        let searchQuery = "Micheal Jackson"
        let entities = ["Album"]
        worker.searchResultToBeReturned = .failure(error)
        
        // When
        interactor.search(term: searchQuery, entities: entities)
        
        // Then
        let expectation = XCTestExpectation(description: "All albums downloaded")
        DispatchQueue.main.async {
            XCTAssertEqual(self.viewSpy.showIndicatorCallCount, 1)
            XCTAssertEqual(self.viewSpy.hideIndicatorCallCount, 1)
            XCTAssertEqual(self.viewSpy.showErrorCallCount, 1)
            XCTAssertEqual(self.viewSpy.passedError, error.localizedDescription)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testsDidTapShowCategoiesButton() {
        // Given
        let selectedIds = Array(1...5)
        
        // When
        viewSpy.router.navigateToCategories(selectedCategoriesIds: selectedIds)
        
        // Then
        XCTAssertEqual(routerSpy.navigateToCategoriesCallCount, 1)
        XCTAssertEqual(routerSpy.passedSelectedCategoriesIds, selectedIds)
    }
}
