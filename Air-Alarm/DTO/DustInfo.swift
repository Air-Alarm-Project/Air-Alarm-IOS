//
//  DustInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/29.
//

import Foundation

struct DustInfo: Codable {
    /*
     id: DB 키값
     time: 시간
     CO2: 이산화탄소
     dust: 먼지
     humidity: 습기
     temperature: 온도
     */
    
    init(time: String = "", CO2: Double = 0.0, dust: Double = 0.0, humidity: Double = 0.0, temperature: Double = 0.0) {
        self.time = time
        self.CO2 = CO2
        self.dust = dust
        self.humidity = humidity
        self.temperature = temperature
    }
    
    var time: String
    var CO2: Double
    var dust: Double
    var humidity: Double
    var temperature: Double
}
