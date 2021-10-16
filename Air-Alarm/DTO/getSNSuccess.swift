//
//  getSNSuccess.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/14.
//

import Foundation

struct getSNSuccess: Codable {
    
    init(SN: String = "") {
        self.SN = SN
    }
    
    var SN: String
}
