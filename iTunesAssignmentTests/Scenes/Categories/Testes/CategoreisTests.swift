//
//  CategoreisTests.swift
//  iTunesAssignmentTests
//
//  Created by Mohamed anwar on 3/13/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import XCTest
@testable import iTunesAssignment

final class CategoreisTests: XCTestCase {
    
    var interactor: CategoriesInteractor!
    var presenter: CategoriesPresenter!
    var viewSpy: CategoriesViewSpy!
    var routerSpy: CategoriesRouterSpy!
    var searchViewSpy: SearchViewSpy!
    var viewModels: [CategoriesModel.ViewModel.Category]!
    
    
    override func setUp() {
        viewSpy = CategoriesViewSpy()
        routerSpy = CategoriesRouterSpy()
        presenter = CategoriesPresenter(output: viewSpy)
        interactor = CategoriesInteractor(selectedCategoriesIds:[], output: presenter)
        viewSpy.output = interactor
        viewSpy.router = routerSpy
        searchViewSpy = SearchViewSpy()
        viewSpy.outputDelegate = searchViewSpy
        viewModels = [
            .init(id: 1, name: "Album"),
            .init(id: 2, name: "Artist"),
            .init(id: 3, name: "Book"),
            .init(id: 4, name: "Movie"),
            .init(id: 5, name: "Music Video"),
            .init(id: 6, name: "Podcast"),
            .init(id: 7, name: "Song")
        ]
    }
    
    override func tearDown() {
        interactor = nil
        presenter = nil
        routerSpy = nil
        viewSpy = nil
        searchViewSpy = nil
        viewModels = nil
    }
    
    func testsFeatchCategoriesSuccess() {
        // When
        viewSpy.output.getItems()
        
        // Then
        XCTAssertEqual(viewSpy.dispalyItemsCallCount, 1)
        XCTAssertEqual(viewSpy.passedDispalyItems.count, viewModels.count)
    }
    
    func testDidTapDoneButton() {
        // Given
        viewModels = [
            .init(id: 1, name: "Album", isSelected: true),
            .init(id: 2, name: "Artist", isSelected: true),
            .init(id: 3, name: "Book", isSelected: true),
            .init(id: 4, name: "Movie", isSelected: true),
            .init(id: 5, name: "Music Video"),
            .init(id: 6, name: "Podcast"),
            .init(id: 7, name: "Song")
        ]
        // When
        viewSpy.output.getItems()
        viewSpy.outputDelegate?.didChooseCategories(items: viewModels.filter { $0.isSelected })
        viewSpy.router.pop()
        
        // Then
        XCTAssertEqual(viewSpy.dispalyItemsCallCount, 1)
        XCTAssertEqual(viewSpy.passedDispalyItems.count, viewModels.count)
        XCTAssertEqual(searchViewSpy.passedCategories.count, viewModels.filter { $0.isSelected }.count)
        XCTAssertEqual(searchViewSpy.displayCategoriesCallCount, 1)
        XCTAssertEqual(routerSpy.popCallCount, 1)
    }
    
    func testDidSelectRow() {
        // Given
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        viewSpy.output.getItems()
        viewSpy.output.didSelectRow(at: indexPath)
        
        // Then
        XCTAssertEqual(viewSpy.dispalyItemsCallCount, 2)
        XCTAssertEqual(viewSpy.passedDispalyItems.count, viewModels.count)
        XCTAssertTrue(viewSpy.passedDispalyItems[indexPath.row].isSelected)
    }
    
}
