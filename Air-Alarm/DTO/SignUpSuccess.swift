//
//  SignUpSuccess.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/29.
//


import Foundation

struct SignUpSuccess: Codable {
    /*
     id: 아이디
     success: 회원가입 성공 여부
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
