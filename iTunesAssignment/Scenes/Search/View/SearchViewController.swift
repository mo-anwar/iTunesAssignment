//
//  SearchViewController.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

// MARK: View
final class SearchViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var categoriesCollectionView: UICollectionView!
    
    // MARK: Properties
    var output: SearchViewControllerOutputProtocol!
    var router: SearchRouter!
    var viewModel: SearchModel.ViewModel?
    private var categories = [ CategoriesModel.ViewModel.Category]()

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: SetupUI
    private func setupView() {
        categoriesCollectionView.dataSource =  self
        categoriesCollectionView.register(cell: CategoryCollectionViewCell.self)
    }
    
    // MARK: Actions
    @IBAction private func didTapShowCategoiesButton(_ sender: UIButton) {
        router.navigateToCategories(selectedCategoriesIds: categories.map { $0.id})
    }
    
    @IBAction private func didTapSubmitButton(_ sender: UIButton) {
        
    }
}

// MARK: UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellId, for: indexPath) as! CategoryCollectionViewCell
        cell.configure(name: categories[indexPath.row].name)
        return cell
    }
}

// MARK: Connect View, Interactor, and Presenter
extension SearchViewController: SearchPresenterOutputProtocol {
    
}

// MARK: CategoriesViewControllerOutputDelegate
extension SearchViewController: CategoriesViewControllerOutputDelegate {
    
    func didChooseCategories(items: [CategoriesModel.ViewModel.Category]) {
        categories = items
        categoriesCollectionView.reloadData()
    }
}
