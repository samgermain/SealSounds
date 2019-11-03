//
//  SoundButton.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-11-01.
//  Copyright © 2019 Sam G. All rights reserved.
//

import UIKit.UIButton

class SoundButton: UIButton{
    
    override init(frame: CGRect){
        super.init(frame:frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.titleLabel?.font = self.titleLabel?.font.withSize(17)
        self.layer.cornerRadius = 5
        
    }
    
}
