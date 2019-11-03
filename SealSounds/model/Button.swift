//
//  Card.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-03-21.
//  Copyright © 2019 Sam G. All rights reserved.
//

import Foundation
import AVFoundation

struct Button{
    
    var sound: AVAudioPlayer?
    var text: String
    var index: Int
    var pathToSounds = "./Sounds/"
    
    func getSound() -> AVAudioPlayer {
        return sound!
    }
    
    func getText() -> String {
        return text
    }
    
    init(text: String, index: Int){
        self.index = index
        self.text = text
        let soundName = pathToSounds + text
        let url = Bundle.main.url(forResource: soundName, withExtension: "aif")!
        do {
            try self.sound = AVAudioPlayer(contentsOf: url)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
