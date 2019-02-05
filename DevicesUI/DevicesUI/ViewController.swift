//
//  ViewController.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 01. 31..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var devicesTableView: UITableView!
    
    //    var viewContent: ViewContent
    
    var phones = [DeviceTableViewCellContent]()
    var watches = [DeviceTableViewCellContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.devicesTableView.dataSource = self
        self.devicesTableView.delegate = self
        
        let nib = UINib(nibName: "CustomHeaderView", bundle: nil)
        self.devicesTableView.register(nib, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        self.getDevices()
    }
    
    private func getDevices() {
        let devices = DeviceParser.getDevices()
        
        phones = devices.filter({ $0.type == .phone }).compactMap({ (device) -> DeviceTableViewCellContent in
            return self.getCellContent(from: device)
        })
        
        watches = devices.filter({ $0.type == .watch }).compactMap({ (device) -> DeviceTableViewCellContent in
            return self.getCellContent(from: device)
        })
    }
    
    private func getCellContent(from device: Device) -> DeviceTableViewCellContent {
        let imageName = self.getImageName(from: device)
        
        let swap = device.swap
        let name = device.name.displayName()
        let simType = device.simType.displayName()
        
        let blocked = device.blocked ? "SIM blocked" : ""
        
        return DeviceTableViewCellContent.init(deviceImageName: imageName, swap: swap, name: name, simType: simType, blocked: blocked)
    }
    
    private func getImageName(from device: Device) -> String {
        switch device.name {
        case .iphone_5s:
            return "iphone_5s"
        case .iphone_7:
            return "iphone_7"
        case .iphone_xs:
            return "iphone_xs"
        case .apple_watch_4:
            return "apple_watch_4"
        case .unknown:
            return ""
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return phones.count
        case 1:
            return watches.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceTableViewCell") as? DeviceTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.displayContent(phones[indexPath.row])
        case 1:
            cell.displayContent(watches[indexPath.row])
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as? CustomSectionHeaderView else {
            return nil
        }
        
        switch section {
        case 0:
            header.sectionHeaderLabel.text = "iPhones"
        case 1:
            header.sectionHeaderLabel.text = "Apple Watches"
        default:
            break
        }
        
        return header
    }
}
