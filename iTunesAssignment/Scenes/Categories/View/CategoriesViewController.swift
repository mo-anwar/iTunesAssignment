//
//  CategoriesViewController.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

// MARK: View
class CategoriesViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private weak var categoriesTableView: UITableView!
    
    // MARK: Properties
    var output: CategoriesViewControllerOutputProtocol!
    weak var outputDelegate: CategoriesViewControllerOutputDelegate?
    var router: CategoriesRouter!
    var viewModel: CategoriesModel.ViewModel?
    private var categories = [ CategoriesModel.ViewModel.Category]()
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataOnLoad()
        setupView()
    }
    
    // MARK: Fetch Categories
    private func fetchDataOnLoad() {
        output.getItems()
    }
    
    // MARK: SetupUI
    private func setupView() {
        setupTableView()
        setupNavigationBarButton()
    }
    
    private func setupTableView() {
        categoriesTableView.register(cell: CategoryTableViewCell.self)
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
    }
    
    private func setupNavigationBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDoneButton))
    }
    
    @objc private func didTapDoneButton() {
        outputDelegate?.didChooseCategories(items: categories.filter { $0.isSelected })
        router.pop()
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.cellId) as! CategoryTableViewCell
        cell.configure(model: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectRow(at: indexPath)
    }
    
    
}

// MARK: Connect View, Interactor, and Presenter
extension CategoriesViewController: CategoriesPresenterOutputProtocol {
    
    func dispaly(items: [CategoriesModel.ViewModel.Category]) {
        categories = items
        categoriesTableView.reloadData()
    }
}
