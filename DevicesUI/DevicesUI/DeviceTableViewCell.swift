//
//  DeviceTableViewCell.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 01. 31..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

protocol DeviceCellDelegate {
    func didTapSwap(stringToPresent: String?, deviceType: DeviceType?)
}

struct DeviceTableViewCellContent {
    
    let deviceImageName: String
    let swap: Bool
    let name: String
    let simType: String
    let blocked: String
    
}

class DeviceTableViewCell: UITableViewCell {

    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var swapButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var simTypeLabel: UILabel!
    @IBOutlet weak var blockedLabel: UILabel!
    @IBOutlet weak var innerView: UIView!
    
    var deviceType: DeviceType?
    
    var delegate: DeviceCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.innerView.layer.cornerRadius = 15
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func displayContent(_ content: DeviceTableViewCellContent, for deviceType: DeviceType) {
        self.deviceType = deviceType
        
        if let image = UIImage(named: content.deviceImageName) {
            self.deviceImageView.isHidden = false
            self.deviceImageView.image = image
        } else {
            self.deviceImageView.isHidden = true
        }
        
        self.nameLabel.text = content.name
        self.simTypeLabel.text = content.simType
        self.blockedLabel.text = content.blocked
        
        self.swapButton.isHidden = !content.swap
    }
    
    @IBAction func swapTapped(_ sender: UIButton) {
        self.delegate?.didTapSwap(stringToPresent: self.swapButton.titleLabel?.text, deviceType: self.deviceType)
    }
}
