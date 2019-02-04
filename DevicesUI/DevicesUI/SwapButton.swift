//
//  SwapButton.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 02. 04..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class SwapButton: UIButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setupButton()
    }
    
    private func setupButton() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(red:0.01, green:0.62, blue:0.89, alpha:1.0).cgColor, UIColor(red:0.00, green:0.40, blue:0.70, alpha:1.0).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.cornerRadius = 20
        self.layer.insertSublayer(gradient, at: 0)
        
        self.setTitleColor(.white, for: .normal)
        self.setTitle("SWAP", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.layer.cornerRadius = 20
    }

}
