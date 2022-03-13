//
//  GalleryCollectionView.swift
//  dromImages
//
//  Created by Олег Аксененко on 13.03.2022.
//

import UIKit

enum ErrorGallery: Error {
    case WTF
}

class GalleryCollectionView: UICollectionView,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource,
                             UICollectionViewDelegateFlowLayout {
    
    var cells = [CarModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .red
        delegate = self
        dataSource = self
        register(GalleryCollectionViewCell.self,
                 forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cells: [CarModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.setupCarImageView(carImageView: cells[indexPath.row].carImage)
        cell.layer.borderWidth = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! GalleryCollectionViewCell
        
        UIView.animate(withDuration: 1, animations: {
            cell.frame = cell.frame.offsetBy(dx: -cell.frame.width, dy: 0)
        }, completion: nil)
        
        cells.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
        collectionView.reloadData()
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        imageCache.removeAllObjects()
        cells.removeAll()
        reloadData()
        cells = CarModel.fetchCars()
        refreshControl.endRefreshing()
    }
    
}
