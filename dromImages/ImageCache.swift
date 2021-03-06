//
//  ImageCache.swift
//  dromImages
//
//  Created by Олег Аксененко on 12.03.2022.
//

import UIKit

/// Задание №4. Кеш изображений.
/// -warning: Наверное, в проде не стоит делать переменную кеша глобальной:)

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            print("Using cached images")
            return
        }

        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .medium)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center

        URLSession.shared.dataTask(with: url!, completionHandler: { [weak self]
            data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            print("Downloading images!")

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self!.image = image
                    activityIndicator.removeFromSuperview()
                }
            }

        }).resume()
    }
}
