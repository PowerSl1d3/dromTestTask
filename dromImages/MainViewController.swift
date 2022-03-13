//
//  mainViewController.swift
//  dromImages
//
//  Created by Олег Аксененко on 12.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var galleryCollectionView = GalleryCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Drom.ru\u{1F697}"
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        view.addSubview(galleryCollectionView)
        
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        galleryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        galleryCollectionView.set(cells: CarModel.fetchCars())
    }

}
