//
//  ViewController.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-03-18.
//  Copyright © 2019 Sam G. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate, PremiumButtonDelegate {
    
    
    //This whole class is our controller, the storyboard is the view
    var products: [SKProduct] = []
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var innerStackView: UIStackView!
    @IBOutlet var bannerView: GADBannerView!        //Admob Ad banner
    @IBOutlet weak var background: UIImageView!     //The image displayed in the background of the app
    var firstButton: PremiumButton!
    var soundBoard: SoundBoard!
    var soundButtons = [UIButton]()
    var premiumButtons = [PremiumButton]()
    
    @objc func touchButton(sender: UIButton) {
        let soundNumber = soundButtons.firstIndex(of: sender)!   //The index of the button
        soundBoard.playSound(at: soundNumber)
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        reload()
    }
    
    @objc func reload() {
      products = []
      
      
      Products.store.requestProducts{ [weak self] success, products in
        guard let self = self else { return }
        if success {
          self.products = products!
        }
        }
    }
    
    func buyPremium() {
        for prod in self.products{
          if prod.productIdentifier == Products.premium{
            if Products.store.isProductPurchased(prod.productIdentifier){
              Products.store.restorePurchases()
            }else if IAPHelper.canMakePayments(){
              Products.store.buyProduct(prod)
            }else{
              let alert = UIAlertController(title: "Cannot make payments", message: "You are not authorized to make payments on this device", preferredStyle: .alert )
              let action = UIAlertAction(title: "OK", style: .default, handler: nil)
              alert.addAction(action)
              self.present(alert, animated: true)
            }
          }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        innerStackView.spacing = 30
        var sounds: [String]
        switch self.restorationIdentifier {
        case "weddell":
            sounds = Filenames.weddellSounds
        case "harp":
            sounds = Filenames.harpSounds
        case "grey":
            sounds = Filenames.greySounds
        default:
            return
        }
        
        self.createSoundBoardView(numberOfButtons: sounds.count)
        soundBoard = SoundBoard(sounds: sounds, soundButtons: soundButtons)
        
        for button in self.premiumButtons{
            let sound = button.button.titleLabel!.text!
            if !Filenames.premiumSounds.contains(sound) || Products.store.isProductPurchased("1985162691"){
                button.premiumLabel.removeFromSuperview()
            }
        }
        print(Products.store.purchasedProductIdentifiers)
        
        background.image = Images.randomImage()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.load(GADRequest())
        
    }

    //override func viewWillLayoutSubviews() {
        //self.innerStackConstraints()
        //for button in self.soundButtons{
        //    self.buttonConstraints(for: button)
        //}
    //}
    
    func createSoundBoardView(numberOfButtons: Int){

        var buttonStack = self.buttonStack()
        self.firstButton = createButton()
        buttonStack.addArrangedSubview(firstButton)
    //self.firstButton.premiumLabel.removeFromSuperview()
        var buttonCount = 2
        for _ in 1..<numberOfButtons{
            let button = self.createButton()
            buttonStack.addArrangedSubview(button)
            buttonCount += 1
            if buttonCount > 3{
                buttonCount = 1
                innerStackView.addArrangedSubview(buttonStack)
                buttonStack = ButtonStack(withOrientation: .horizontal)
            }
        }
        if buttonCount != 2{
            while(buttonCount <= 3){
                let button = self.createButton()

                buttonStack.addArrangedSubview(button)
                button.isHidden = true

                buttonCount += 1
            }
            innerStackView.addArrangedSubview(buttonStack)
        }
        

    }
    
    func buttonStack() -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }
    
    func innerStackConstraints(){
        let wCon = NSLayoutConstraint(item: innerStackView, attribute: .width, relatedBy: .equal, toItem: outerView, attribute: .width, multiplier: 1, constant: 0)
        outerView.addConstraints([wCon])
    }
    
    func buttonConstraints(for button: UIButton){
        let hCon = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 45)
        innerStackView.addConstraints([hCon])
    }
    
    func createButton() -> PremiumButton{
        let pButton = PremiumButton()
        pButton.delegate = self
        premiumButtons.append(pButton)
        
        if let button = pButton.button{
            soundButtons.append(button)
            button.addTarget(self, action: #selector(touchButton(sender:)), for: .touchUpInside)
        }

        
        return pButton
    }
    
}
