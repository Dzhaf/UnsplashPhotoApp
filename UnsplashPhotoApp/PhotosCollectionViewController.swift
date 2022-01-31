//
//  PhotosCollectionViewController.swift
//  UnsplashPhotoApp
//
//  Created by Jafar on 31.01.2022.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .orange
        setUpNavigationBar()
        setUpCollectionView()
        
        
        }
    
    
    private func setUpCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    private func setUpNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "PHOTOS"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .blue
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        
        cell.backgroundColor = .red
        return cell
    }
}
