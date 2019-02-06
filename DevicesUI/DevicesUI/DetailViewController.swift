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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelOnDetail.text = stringToPresent
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
