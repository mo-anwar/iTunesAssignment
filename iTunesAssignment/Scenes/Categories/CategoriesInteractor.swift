//
//  CategoriesInteractor.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//
import Foundation

final class CategoriesInteractor {
    private var output: CategoriesInteractorOutputProtocol?
    private var selectedCategoriesIds: [Int]
    private var items: [CategoriesModel.ViewModel.Category] = [
        .init(id: 1, name: "Album"),
        .init(id: 2, name: "Artist"),
        .init(id: 3, name: "Book"),
        .init(id: 4, name: "Movie"),
        .init(id: 5, name: "Music Video"),
        .init(id: 6, name: "Podcast"),
        .init(id: 7, name: "Song")
    ]
    
    init(selectedCategoriesIds: [Int], output: CategoriesInteractorOutputProtocol) {
        self.selectedCategoriesIds = selectedCategoriesIds
        self.output = output
    }
}

extension CategoriesInteractor: CategoriesViewControllerOutputProtocol {
    
    func didSelectRow(at indexPath: IndexPath) {
        items[indexPath.row].isSelected.toggle()
        output?.dispaly(items: items)
    }
    
    func getItems() {
        for index in items.indices {
            if selectedCategoriesIds.contains(items[index].id) {
                items[index].isSelected = true
            }
        }
        output?.dispaly(items: items)
    }
}
