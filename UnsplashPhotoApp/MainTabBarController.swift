//
//  MainTabBarController.swift
//  UnsplashPhotoApp
//
//  Created by Jafar on 31.01.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        
        
        
        viewControllers = [
            generateNavigarionController(rootViewController: photosVC, title: "Photos", image: UIImage(systemName: "photo")!),
            generateNavigarionController(rootViewController: ViewController(), title: "Favourites", image: UIImage(systemName: "heart")!)
        ]
        
    }
    
    
    private func generateNavigarionController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigaionVC = UINavigationController(rootViewController: rootViewController)
        navigaionVC.tabBarItem.title = title
        navigaionVC.tabBarItem.image = image
        return navigaionVC
    }
    
}
