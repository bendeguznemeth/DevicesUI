//
//  Device.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 01. 31..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

enum DeviceName: String {
    case iphone_5s = "iphone 5s"
    case iphone_7 = "iphone 7"
    case iphone_xs = "iphone xs"
    case apple_watch_4 = "apple watch 4"
    case unknown
    
    init(string: String?) {
        guard let string = string else {
            self = .unknown
            return
        }
        
        self = DeviceName(rawValue: string) ?? .unknown
    }
    
    func displayName() -> String {
        switch self {
        case .iphone_5s:
            return "iPhone 5s"
        case .iphone_7:
            return "iPhone 7"
        case .iphone_xs:
            return "iPhone Xs, iPhone Xs, iPhone Xs, iPhone Xs"
        case .apple_watch_4:
            return "Apple Watch 4"
        case .unknown:
            return "Unknown"
        }
    }
}

enum DeviceType: String {
    case phone = "PHONE"
    case watch = "WATCH"
    case unknown
    
    init(string: String?) {
        guard let string = string else {
            self = .unknown
            return
        }
        
        self = DeviceType(rawValue: string) ?? .unknown
    }
}

enum SimType: String {
    case main = "MAIN"
    case twin = "TWIN"
    case unknown
    
    init(string: String?) {
        guard let string = string else {
            self = .unknown
            return
        }
        
        self = SimType(rawValue: string) ?? .unknown
    }
    
    func displayName() -> String {
        switch self {
        case .main:
            return "Main SIM, Main SIM, Main SIM, Main SIM"
        case .twin:
            return "Twin SIM"
        case .unknown:
            return "Unknown"
        }
    }
}

struct Device {
    
    let name: DeviceName
    let blocked: Bool
    let type: DeviceType
    let simType: SimType
    let swap: Bool
}
