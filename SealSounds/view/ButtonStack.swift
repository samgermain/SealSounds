//
//  ButtonStack.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-11-01.
//  Copyright © 2019 Sam G. All rights reserved.
//

import UIKit

class ButtonStack: UIStackView{
    init(withOrientation axis: NSLayoutConstraint.Axis){
        let rect = CGRect(origin: CGPoint(x: 0,y: 0), size: CGSize(width: 1, height: 1))
        super.init(frame:rect)
        self.axis = axis
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fillEqually
        self.spacing = 10
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
