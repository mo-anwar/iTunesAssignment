//
//  SearchViewController.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

// MARK: View
final class SearchViewController: UIViewController, SearchViewControllerInputProtocol {
    
    // MARK: IBOutlets
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var categoriesCollectionView: UICollectionView!
    
    // MARK: Properties
    var output: SearchViewControllerOutputProtocol!
    var router: SearchRouterProtocol!
    private var viewModels = [CategoriesModel.ViewModel.Category]()

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: SetupUI
    private func setupView() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(cell: CategoryCollectionViewCell.self)
        let flowLayout = categoriesCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }
    
    // MARK: Actions
    @IBAction private func didTapShowCategoiesButton(_ sender: UIButton) {
        router.navigateToCategories(selectedCategoriesIds: viewModels.map { $0.id})
    }
    
    @IBAction private func didTapSubmitButton(_ sender: UIButton) {
        if let searchText = searchTextField.text {
            if searchText.isEmpty {
                showError(error: "Search Text is empty")
            } else if viewModels.isEmpty {
                showError(error: "Add atleast 1 Category.")
            } else {
                output.search(term: searchText, entities: viewModels.map { $0.name.lowercased()})
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        cell.configure(name: viewModels[indexPath.row].name)
        return cell
    }
}

// MARK: Connect View, Interactor, and Presenter
extension SearchViewController: SearchPresenterOutputProtocol {
    
    func display(items: [SearchModel.ViewModel]) {
        router.navigateToSearchResult(viewModels: items)
    }
    
    func showIndicator() {
        view.showActivityIndicator(isUserInteractionEnabled: false)
    }
    
    func hideIndicator() {
        view.hideActivityIndicator()
    }
    
    func showError(error: String) {
        AlertBuilder(title: "", message: error, preferredStyle: .alert)
            .addAction(title: "Okay", style: .default, handler: nil)
            .build()
            .show()
    }

}

// MARK: CategoriesViewControllerOutputDelegate
extension SearchViewController: CategoriesViewControllerOutputDelegate {
    
    func didChooseCategories(items: [CategoriesModel.ViewModel.Category]) {
        viewModels = items
        categoriesCollectionView.reloadData()
    }
}
