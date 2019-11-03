//
//  SoundBoardView.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-10-18.
//  Copyright © 2019 Sam G. All rights reserved.
//

import Foundation
import UIKit

class SoundBoardView: UIView{
    var outerView: UIStackView
    var firstButton = UIButton()
    var buttons = [UIButton]()
    var soundBoard: SoundBoard!
    
    init(frame: CGRect, numberOfButtons: Int, insideStackView outerView: UIStackView){
        self.outerView = outerView
        super.init(frame: frame)
        var buttonStack = UIStackView()
        buttonStack.addArrangedSubview(firstButton)
        var buttonCount = 2
        for _ in 1...numberOfButtons{
            let button = UIButton()
            buttonStack.addArrangedSubview(button)
            buttonCount += 1
            self.buttonConstraints(button: button)
            if buttonCount == 3{
                buttonCount = 1
                outerView.addArrangedSubview(buttonStack)
                buttonStack = UIStackView()
            }
        }
        if buttonCount > 1{
            while(buttonCount < 3){
                let button = UIButton()
                button.isHidden = true
                buttonStack.addArrangedSubview(button)
                self.buttonConstraints(button: button)
                buttonCount += 1
            }
            outerView.addArrangedSubview(buttonStack)
        }
    }
    
    @objc func touchButton(_ sender: UIButton) {
        let soundNumber = buttons.firstIndex(of: sender)!   //The index of the button
        soundBoard.playSound(at: soundNumber)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonConstraints(button: UIButton){
        let wCon = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: self.firstButton, attribute: .width, multiplier: 1, constant: 0)
        let hCon = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: self.firstButton, attribute: .height, multiplier: 1, constant: 0)
        self.addConstraints([wCon, hCon])
    }
    
}
