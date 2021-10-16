//
//  Member.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/29.
//


import Foundation

struct Member: Codable {
    /*
     id: 아이디
     pwd: 패스워드
     */
    
    init(id: String = "", pwd: String = "") {
        self.id = id
        self.pwd = pwd
    }
    
    var id: String
    var pwd: String
}
