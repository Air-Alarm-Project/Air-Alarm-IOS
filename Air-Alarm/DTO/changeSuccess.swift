//
//  changeSuccess.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/14.
//

import Foundation

struct changeSuccess: Codable {
    
    init(id: String = "", preSN: String = "", nowSN: String = "", success: Bool = false) {
        self.id = id
        self.preSN = preSN
        self.success = success
        self.nowSN = nowSN
    }
    
    var id: String
    var preSN: String
    var success: Bool
    var nowSN: String
}
