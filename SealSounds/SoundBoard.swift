//
//  Concentration.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-03-21.
//  Copyright © 2019 Sam G. All rights reserved.
//
//This is our model


import Foundation
import AVFoundation
import UIKit.UIButton

class SoundBoard{

    var buttons = [Button]()
    
    func playSound(at index: Int){
        buttons[index].getSound().play()
    }
    
    init(sounds: [String], soundButtons: [UIButton]){
        //Assign noise and text to all the buttons
        for buttonNum in 0..<soundButtons.count {
            let button = Button(text: sounds[buttonNum], index: buttonNum)
            buttons.append(button)
            soundButtons[buttonNum].setTitle(sounds[buttonNum], for: .normal)
        }
    }
    
}
