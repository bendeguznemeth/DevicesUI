//
//  SwapButton.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 02. 04..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class SwapButton: UIButton {

    private var gradient = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupButton()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setFrame()
    }
    
    private func setupButton() {
        self.gradient.colors = [UIColor(red:0.01, green:0.62, blue:0.89, alpha:1.0).cgColor, UIColor(red:0.00, green:0.40, blue:0.70, alpha:1.0).cgColor]
        self.gradient.startPoint = CGPoint(x: 0, y: 0)
        self.gradient.endPoint = CGPoint(x: 1, y: 0)
        self.gradient.cornerRadius = 20
        self.layer.insertSublayer(gradient, at: 0)
        
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.lightGray, for: .highlighted)
        self.setTitle("SWAP", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.layer.cornerRadius = 20
    }
    
    private func setFrame() {
        self.gradient.frame = self.bounds
    }

}
