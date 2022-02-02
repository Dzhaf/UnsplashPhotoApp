//
//  PhotosCollectionViewController.swift
//  UnsplashPhotoApp
//
//  Created by Jafar on 31.01.2022.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController, UISearchBarDelegate {
    
    var networkService = NetworkService()
    
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    }()
    
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionBarButtonTapped))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionView.backgroundColor = .orange
        setUpNavigationBar()
        setUpCollectionView()
        setupSearchBar()
        
    }
    
    //MARK: - NavigationItems action
    
    @objc private func addBarButtonTapped() {
        print(#function)
    }
    
    @objc private func actionBarButtonTapped() {
        print(#function)
    }
    
    
    // MARK: - Setup UI Elements
    private func setUpCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    private func setUpNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        
        navigationItem.rightBarButtonItems = [actionBarButtonItem, addBarButtonItem]
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    // MARK: - UICollectionVIewDataSource, UICollectionViewDelegate
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        
        cell.backgroundColor = .red
        return cell
    }
}

extension PhotosCollectionViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        networkService.request(searhTerm: searchText) { (_, _) in
            print("123")
            
            }
        }
}
                               
