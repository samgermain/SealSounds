//
//  PremiumButton.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-10-19.
//  Copyright © 2019 Sam G. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PremiumButton: UIView{
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var premiumButton: UIButton!
    @IBOutlet weak var premiumTextLabel: UILabel!
    
    var delegate: PremiumButtonDelegate?
    
    @IBAction func getPremium(_ sender: UIButton) {
        delegate?.buyPremium()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PremiumButton", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
