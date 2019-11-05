//
//  Products.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-11-05.
//  Copyright © 2019 Sam G. All rights reserved.
//

import Foundation

public struct Products{

    public static let premium = "1985162691"
    
    private static let productIdentifiers: Set<ProductIdentifier> = [Products.premium]
    
    public static let store = IAPHelper(productIds: Products.productIdentifiers)
    
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
  return productIdentifier.components(separatedBy: ".").last
}
