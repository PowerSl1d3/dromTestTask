//
//  GalleryCollectionView.swift
//  dromImages
//
//  Created by Олег Аксененко on 13.03.2022.
//

import UIKit

class GalleryCollectionView: UICollectionView,
                             UICollectionViewDelegate,
                             UICollectionViewDataSource,
                             UICollectionViewDelegateFlowLayout {
    
    var cells = CarModel.fetchCars()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    /// Задание №3. Загрузка картинок по мере необходимости
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cells[indexPath.row].loadImageUsingCacheFor(index: indexPath.row)
        cell.setupCarImageView(carImageView: cells[indexPath.row].carImage!)
        cell.layer.borderWidth = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.isHidden = false
    }
    
    /// Задание №5. Анимация покидания картинки рабочей области приложения
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! GalleryCollectionViewCell
        
        let duration: TimeInterval = 0.5
        UIView.animate(withDuration: duration, animations: {
            cell.frame = cell.frame.offsetBy(dx: cell.frame.width, dy: 0)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                cell.isHidden = true
                self.cells.remove(at: indexPath.row)
                collectionView.deleteItems(at: [indexPath])
                self.reloadData()
            }
            
        }, completion: nil)
    }
    
    /// Задание №6. Pull to refresh
    @objc func refresh(refreshControl: UIRefreshControl) {
        imageCache.removeAllObjects()
        collectionViewLayout.invalidateLayout()
        cells = CarModel.fetchCars()
        reloadData()
        refreshControl.endRefreshing()
    }
    
}
