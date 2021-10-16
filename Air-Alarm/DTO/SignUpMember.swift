//
//  SignUpMember.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/29.
//

import Foundation

struct SignUpMember: Codable {
    /*
     id: 아이디
     pwd: 패스워드
     SN: 시리얼 넘버
     */
    
    init(id: String = "", pwd: String = "", SN: String = "") {
        self.id = id
        self.pwd = pwd
        self.SN = SN
    }
    
    var id: String
    var pwd: String
    var SN: String
}
