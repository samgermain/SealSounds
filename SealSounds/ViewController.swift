//
//  ViewController.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-03-18.
//  Copyright © 2019 Sam G. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {
    
    //This whole class is our controller, the storyboard is the view

    @IBOutlet var bannerView: GADBannerView!        //Admob Ad banner
    @IBOutlet weak var background: UIImageView!     //The image displayed in the background of the app
    var backgroundImages = ["a-seal-1504755", "amy-asher-giZJHm2m9yY-unsplash", "brian-yurasits-Vgro7u6A6rk-unsplash", "henriette-valkema-i9rzTO_qxfk-unsplash", "keith-luke-dKe9GgzS8Ek-unsplash", "pascal-mauerhofer-uObolpEZuNk-unsplash", "pascal-mauerhofer-xtlfXD3WIcI-unsplash", "ruvim-miksanskiy-8bfbEaC4YpY-unsplash", "seal-1111177_1920", "seal-2243104_1920", "steve-halama-J_mibm6IT3Y-unsplash", "thomas-lipke-3yMlp-x9yDU-unsplash", "yuriy-rzhemovskiy-G-MyqQy8v_4-unsplash", "zdenek-machacek-LJlTSTDbfTc-unsplash", "zdenek-machacek-uRQlCmfOCRg-unsplash"]  //The list of background images, only one displayed at a time
    
    //sounds excluded: "mmnghphp", "geeeehhg!!", "mnnggpbphtph"
    //brehh = bliss
    var sounds = ["AAAAAAAAAAAAAAAA", "(sneezes)", "baguette", "bliss", "d\'egff", "d\'egg", "egg!", "egg! 2", "egg", "fibsh", "fish", "geaaaagh", "gegg", "gighphbh", "guh", "l\'egg!", "l\'egg", "lligkk", "mibph", "mnnnbpbbhbhpth", "murph!"]
    var soundBoard: SoundBoard!

    @IBOutlet var soundButtons: [UIButton]! //Storyboard buttons are all identical, this program assigns sounds and text to each button and keeps track of them by the button index
    
    @IBAction func touchButton(_ sender: UIButton) {
        let soundNumber = soundButtons.index(of: sender)!   //The index of the button
        soundBoard.playSound(at: soundNumber)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        soundBoard = SoundBoard(sounds: sounds, soundButtons: soundButtons)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bGroundNum = Int.random(in: 0 ... 13)   //A random number determines which background image is used when the app is loaded
        background.image = UIImage(named: backgroundImages[bGroundNum])
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.load(GADRequest())
    }
    
    
    
}
