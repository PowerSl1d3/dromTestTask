//
//  mainViewController.swift
//  dromImages
//
//  Created by Олег Аксененко on 12.03.2022.
//

import UIKit

/// Задание №1. Реализовать приложение, на UINavigationController'е
class MainViewController: UIViewController {
    
    /// Задание №2. В качестве view для UINavigationController'а используется UICollectionView
    private var galleryCollectionView = GalleryCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Drom.ru\u{1F697}"
        
        view.addSubview(galleryCollectionView)
        
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        galleryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}
