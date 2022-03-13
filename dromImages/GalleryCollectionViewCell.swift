//
//  GalleryCollectionViewCell.swift
//  dromImages
//
//  Created by Олег Аксененко on 13.03.2022.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell,
                                UICollectionViewDelegate {
    
    static let reuseId = "GalleryCollectionViewCell"
    var imageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCarImageView(carImageView: UIImageView) {
        imageView = carImageView
        addSubview(carImageView)
        carImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        carImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        carImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        carImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
