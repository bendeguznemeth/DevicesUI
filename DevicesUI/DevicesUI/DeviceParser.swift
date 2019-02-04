//
//  DeviceParser.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 01. 31..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import SwiftyJSON

class DeviceParser {
    
    private static let json: JSON = [
        [
            "name": "iphone 7",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "iphone xs",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "apple watch 4",
            "blocked": false,
            "type": "WATCH",
            "simType": "MAIN",
            "swap": false
        ],
        [
            "name": "iphone 5s",
            "blocked": true,
            "type": "PHONE",
            "simType": "TWIN",
            "swap": false
        ],
        [
            "name": "iphone 7",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "iphone xs",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "apple watch 4",
            "blocked": false,
            "type": "WATCH",
            "simType": "MAIN",
            "swap": false
        ],
        [
            "name": "iphone 5s",
            "blocked": true,
            "type": "PHONE",
            "simType": "TWIN",
            "swap": false
        ],
        [
            "name": "iphone 7",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "iphone xs",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "apple watch 4",
            "blocked": false,
            "type": "WATCH",
            "simType": "MAIN",
            "swap": false
        ],
        [
            "name": "iphone 5s",
            "blocked": true,
            "type": "PHONE",
            "simType": "TWIN",
            "swap": false
        ],
        [
            "name": "iphone 7",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "iphone xs",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "apple watch 4",
            "blocked": false,
            "type": "WATCH",
            "simType": "MAIN",
            "swap": false
        ],
        [
            "name": "iphone 5s",
            "blocked": true,
            "type": "PHONE",
            "simType": "TWIN",
            "swap": false
        ],
        [
            "name": "iphone 7",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "iphone xs",
            "blocked": false,
            "type": "PHONE",
            "simType": "MAIN",
            "swap": true
        ],
        [
            "name": "apple watch 4",
            "blocked": false,
            "type": "WATCH",
            "simType": "MAIN",
            "swap": false
        ],
        [
            "name": "iphone 5s",
            "blocked": true,
            "type": "PHONE",
            "simType": "TWIN",
            "swap": false
        ]
    ]
    
    static func getDevices() -> [Device] {
        return json.arrayValue.compactMap { (deviceJson) -> Device in
            let name = DeviceName(string: deviceJson["name"].string)
            let blocked = deviceJson["blocked"].boolValue
            let type = DeviceType(string: deviceJson["type"].string)
            let simType = SimType(string: deviceJson["simType"].string)
            let swap = deviceJson["swap"].boolValue
            
            return Device.init(name: name, blocked: blocked, type: type, simType: simType, swap: swap)
        }
    }
    
}
