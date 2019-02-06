//
//  ViewController.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 01. 31..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section: Int {
        case phone
        case watch
        
        static let numberOfSections = 2
    }
    
    @IBOutlet weak var devicesTableView: UITableView!
    
    var viewContent: ViewContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.devicesTableView.dataSource = self
        self.devicesTableView.delegate = self
        
        let headerNib = UINib(nibName: "CustomHeaderView", bundle: nil)
        self.devicesTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        let cellNib = UINib(nibName: "DeviceTableViewCell", bundle: nil)
        self.devicesTableView.register(cellNib, forCellReuseIdentifier: "DeviceTableViewCell")
        
        self.loadViewContent()
    }
    
    private func loadViewContent() {
        let devices = DeviceParser.getDevices()
        
        let phonesSection = { () -> ViewContent.Section<DeviceTableViewCellContent> in
            let rows = devices.filter({ $0.type == .phone }).compactMap({ (device) -> DeviceTableViewCellContent in
                return self.getCellContent(from: device)
            })
            
            return ViewContent.Section<DeviceTableViewCellContent>.init(header: "iPhones", rows: rows)
        }()
        
        let watchesSection = { () -> ViewContent.Section<DeviceTableViewCellContent> in
            let rows = devices.filter({ $0.type == .watch }).compactMap({ (device) -> DeviceTableViewCellContent in
                return self.getCellContent(from: device)
            })
            
            return ViewContent.Section<DeviceTableViewCellContent>.init(header: "Apple Watches", rows: rows)
        }()
        
        self.viewContent = ViewContent.init(phones: phonesSection, watches: watchesSection)
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
        return Section.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section.init(rawValue: section), let content = self.viewContent else {
            return 0
        }
        
        switch section {
        case .phone:
            return content.phones.rows.count
        case .watch:
            return content.watches.rows.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceTableViewCell") as? DeviceTableViewCell,
            let section = Section.init(rawValue: indexPath.section),
            let content = self.viewContent else {
            return UITableViewCell()
        }
        
        switch section {
        case .phone:
            cell.displayContent(content.phones.rows[indexPath.row])
        case .watch:
            cell.displayContent(content.watches.rows[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as? CustomSectionHeaderView,
            let section = Section.init(rawValue: section),
            let content = self.viewContent else {
            return nil
        }
        
        switch section {
        case .phone:
            header.sectionHeaderLabel.text = content.phones.header
        case .watch:
            header.sectionHeaderLabel.text = content.watches.header
        }
        
        return header
    }
}
