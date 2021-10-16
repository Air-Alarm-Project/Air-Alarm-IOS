//
//  getSN.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/14.
//

import Foundation

struct getSN: Codable {
    
    init(id: String = "", SN: String = "") {
        self.id = id
        self.SN = SN
    }
    
    var id: String
    var SN: String
}
