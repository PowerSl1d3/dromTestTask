//
//  CarModel.swift
//  dromImages
//
//  Created by Олег Аксененко on 13.03.2022.
//

import UIKit

struct CarModel {
    
    var carImage: UIImageView
    
    static func fetchCars() -> [CarModel] {
        
        var returnedCars = [CarModel]()
        
        for i in 0..<6 {
            let downloadCar = UIImageView()
            downloadCar.loadImageUsingCache(withUrl: imageURLsToLoad[i])
            returnedCars.append(CarModel(carImage: downloadCar))
        }
        
        return returnedCars
    }
    
    private static let imageURLsToLoad = [
        "https://s.auto.drom.ru/photo/xITHib0ncz9NNBlWwCTx7z75oaiviW2bICDrCua5XO868zoDw6hMdxvgEet2azf18tPzqOQlYZPuQcFFDv7bR2djzn9l.jpg",
        "https://s.auto.drom.ru/photo/LEM02-h9HQ5vGf_odSFgeXP5S8imAAKItwxpPgrsVgWse58tlpE0BgRyc3Y3ApHsnlm3A6EeE4rB6LuT32GLMkbxaLsa.jpg",
        "https://s.auto.drom.ru/photo/zL60UuAIQpORos7ezB8Gge7RxytqFk8gctzNEKhIj-gC1_1IOj-ziXbkgZaQ4mHZ9wz6vIEgSnoWFXAwioMf_K90sD0e.jpg",
        "https://s.auto.drom.ru/photo/iy4sTgP9My6FiXpkTn2YZII6FtBUXOaGCTaNCPRYQZyqRnNCDCP0OhCwO6mGLsjFXV6wp4Zw2YxBTBIdd-hD1oXlpwaZ.jpg",
        "https://s.auto.drom.ru/photo/Jnnbp8agZ7a1pVpGmMZkxmtftCyubd83E3TVb5B1w3vytHFM8IO3jRRaysnTs2GjROH26uWGa0anWjua5V2j1_VCTWCX.jpg",
        "https://s.auto.drom.ru/photo/y7_acebPSnyVBJp_Jw7h7LHdqy0qQzp95foQIqXyPc-oXDMNppB58xYDlfZjLeheaTor_p6aeSM0J0Dq7mbTY_WREAqu.jpg"
    ]
}
