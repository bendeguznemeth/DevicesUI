//
//  ViewContent.swift
//  DevicesUI
//
//  Created by Németh Bendegúz on 2019. 02. 05..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

struct ViewContent {

    struct Section<T> {
        let header: String
        let rows: [T]
    }
    
    let phones: Section<DeviceTableViewCellContent>
    let watches: Section<DeviceTableViewCellContent>
    
}
