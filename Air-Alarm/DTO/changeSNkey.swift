//
//  changeSNkey.swift
//  Air-Alarm
//
//  Created by κΉνμ on 2021/10/14.
//

import Foundation

struct changeSNkey: Codable {
    
    init(id: String = "", preSN: String = "", nowSN: String = "") {
        self.id = id
        self.preSN = preSN
        self.nowSN = nowSN
    }
    
    var id: String
    var preSN: String
    var nowSN: String
}
