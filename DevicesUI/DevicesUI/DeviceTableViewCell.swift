//
//  DeviceTableViewCell.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 01. 31..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

//struct ViewContent {
//    let sections: [Section]
//
//    struct Section {
//        let Rows: [DeviceTableViewCellContent]
//    }
//}

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.innerView.layer.cornerRadius = 15
        self.swapButton.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayContent(_ content: DeviceTableViewCellContent) {
        self.deviceImageView.image = UIImage(named: content.deviceImageName)
        self.nameLabel.text = content.name
        self.simTypeLabel.text = content.simType
        self.blockedLabel.text = content.blocked
        
        if !content.swap {
            self.swapButton.isHidden = true
        }
    }
}
