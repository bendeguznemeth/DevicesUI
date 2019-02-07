//
//  DetailViewController.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 02. 06..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var labelOnDetail: UILabel!
    
    var stringToPresent: String?
    var deviceType: DeviceType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelOnDetail.text = stringToPresent
        
        self.addImageToNavBar()
    }
    
    private func addImageToNavBar() {
        let appleLogoImage: UIImage?
        
        guard let deviceType = deviceType else {
            return
        }
        
        switch deviceType {
        case .phone:
            appleLogoImage = UIImage(named: "iphone_icon")
        case .watch:
            appleLogoImage = UIImage(named: "apple_watch_icon")
        case .unknown:
            return
        }
        
        let appleLogoImageView = UIImageView(image: appleLogoImage)

        appleLogoImageView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = appleLogoImageView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
