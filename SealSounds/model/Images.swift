//
//  Images.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-11-01.
//  Copyright © 2019 Sam G. All rights reserved.
//

import UIKit.UIImage

struct Images{
    
    static var backgroundImages = ["a-seal-1504755", "amy-asher-giZJHm2m9yY-unsplash", "brian-yurasits-Vgro7u6A6rk-unsplash", "henriette-valkema-i9rzTO_qxfk-unsplash", "keith-luke-dKe9GgzS8Ek-unsplash", "pascal-mauerhofer-uObolpEZuNk-unsplash", "pascal-mauerhofer-xtlfXD3WIcI-unsplash", "ruvim-miksanskiy-8bfbEaC4YpY-unsplash", "seal-1111177_1920", "seal-2243104_1920", "steve-halama-J_mibm6IT3Y-unsplash", "thomas-lipke-3yMlp-x9yDU-unsplash", "yuriy-rzhemovskiy-G-MyqQy8v_4-unsplash", "zdenek-machacek-LJlTSTDbfTc-unsplash", "zdenek-machacek-uRQlCmfOCRg-unsplash"]
    
    static func randomImage() -> UIImage{
        let bGroundNum = Int.random(in: 0 ... backgroundImages.count-1)
        return UIImage(named: self.backgroundImages[bGroundNum])!
    }
    
}
