//
//  LoginSuccess.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/29.
//

import Foundation

struct LoginSuccess: Codable { // 로그인 성공 여부 판단
    /*
     id: 아이디
     success: 로그인 성공 여부
     */
    
    init(id: String = "", success: Bool = false, SN: String = "") {
        self.id = id
        self.success = success
        self.SN = SN
    }
    
    var id: String
    var success: Bool
    var SN: String
}
