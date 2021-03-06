//
//  SearchResultsViewController.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/11/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import UIKit

// MARK: View
final class SearchResultsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var searchResultsCollectionView: UICollectionView!
    
    // MARK: Properties
    var router: SearchResultsRouterProtocol!
    private var layoutType = LayoutType.grid { didSet { reloadCollectionViewWithAnimation() }}
    private var viewModels = [SearchModel.ViewModel]()
    
    private enum LayoutType {
        case grid, list
    }
    
    init(viewModels: [SearchModel.ViewModel]) {
        self.viewModels = viewModels
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: SetupUI
    private func setupView() {
        title = "Search Results"
        setupCollectionView()
        setupNavigationBarButtons()
    }
    
    private func setupCollectionView() {
        searchResultsCollectionView.dataSource = self
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.register(cell: SearchResultListCell.self)
        searchResultsCollectionView.register(cell: SearchResultGridCell.self)
        searchResultsCollectionView.register(reusableView: SearchResultHeader.self, for: .header)
    }
    
    private func setupNavigationBarButtons() {
        let gridBarItem = UIBarButtonItem(image: UIImage(named: "ic_grid_view"), style: .plain, target: self, action: #selector(didTapGridLayoutButton(_:)))
        let listBarItem = UIBarButtonItem(image: UIImage(named: "ic_list"), style: .plain, target: self, action: #selector(didTapListLayoutButton))
        navigationItem.rightBarButtonItems = [gridBarItem, listBarItem]
    }
    
    @objc private func didTapGridLayoutButton(_ sender: UIButton) {
        layoutType = .grid
    }
    
    @objc private func didTapListLayoutButton(_ sender: UIButton) {
        layoutType = .list
    }
    
    private func reloadCollectionViewWithAnimation() {
        UIView.transition(with: searchResultsCollectionView, duration: 0.5, options: layoutType == .grid ? .transitionFlipFromLeft : .transitionFlipFromRight, animations: {
            self.searchResultsCollectionView.reloadData()
        }, completion: nil)
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegate
extension SearchResultsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModels.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels[section].resulsts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch layoutType {
        case .grid:
            let cell: SearchResultGridCell = collectionView.dequeueCell(for: indexPath)
            cell.configure(model: viewModels[indexPath.section].resulsts[indexPath.row])
            return cell
        case .list:
            let cell: SearchResultListCell = collectionView.dequeueCell(for: indexPath)
            cell.configure(model: viewModels[indexPath.section].resulsts[indexPath.row])
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView: SearchResultHeader = collectionView.dequeueHeader(for: indexPath)
        headerView.configure(name: viewModels[indexPath.section].header)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router.navigateToResultDetails(model: viewModels[indexPath.section].resulsts[indexPath.row])
    }
    
}

// MARK: UICollectionViewFlowLayout
extension SearchResultsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width: CGFloat
        var height: CGFloat
        if layoutType == .grid {
            width = (collectionView.frame.width - 30) / 3
            height = (view.frame.height) / 5
        } else {
            width = (collectionView.frame.width - 10)
            height = (view.frame.height - 70) / 7
        }
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
