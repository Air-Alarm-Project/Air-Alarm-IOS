//
//  ChartsData.swift
//  Air-Alarm
//
//  Created by Jinhee on 2021/09/10.
//

import SwiftUI
import SwiftUICharts

struct Data {
    static let title0 = "온도"
    static let title1 = "습도"
    static let title2 = "미세먼지"
    static let title3 = "이산화탄소"
    
    static let legend0 = "온도"
    static let legend1 = "습도"
    static let legend2 = "미세먼지"
    static let legend3 = "이산화탄소"
}

// 일 그래프
class GetData{
    let restAPI = RestAPI()
    private var data: [DustInfo]
    init(){
        data = restAPI.GET_HourAll()
    }
    public func temhour() -> [Double]{
        var tem:[Double] = []
        for index in data {
            tem.append(index.temperature)
        }
        return tem
    }
    
    public func humhour() -> [Double]{
        var hum:[Double] = []
        for index in data {
            hum.append(index.humidity)
        }
        return hum
    }
    
    public func dusthour() -> [Double]{
        var dust:[Double] = []
        for index in data {
            dust.append(index.dust)
        }
        return dust
    }
    
    public func co2hour() -> [Double]{
        var co2:[Double] = []
        for index in data {
            co2.append(index.CO2)
        }
        return co2
    }
}

// 주 그래프
class WeekData{
    let restAPI = RestAPI()
    private var data: [DustInfo]
    init(){
        data = restAPI.GET_Week()
    }
    public func temweek() -> [Double]{
        var tem:[Double] = []
        for index in data {
            tem.append(index.temperature)
        }
        return tem
    }
    
    public func humweek() -> [Double]{
        var hum:[Double] = []
        for index in data {
            hum.append(index.humidity)
        }
        return hum
    }
    
    public func dustweek() -> [Double]{
        var dust:[Double] = []
        for index in data {
            dust.append(index.dust)
        }
        return dust
    }
    
    public func co2week() -> [Double]{
        var co2:[Double] = []
        for index in data {
            co2.append(index.CO2)
        }
        return co2
    }
}

// 월 그래프
class DayData{
    let restAPI = RestAPI()
    private var data: [DustInfo]
    init(){
        data = restAPI.GET_DayAll()
    }
    public func temday() -> [Double]{
        var tem:[Double] = []
        for index in data {
            tem.append(index.temperature)
        }
        return tem
    }
    
    public func humday() -> [Double]{
        var hum:[Double] = []
        for index in data {
            hum.append(index.humidity)
        }
        return hum
    }
    
    public func dustday() -> [Double]{
        var dust:[Double] = []
        for index in data {
            dust.append(index.dust)
        }
        return dust
    }
    
    public func co2day() -> [Double]{
        var co2:[Double] = []
        for index in data {
            co2.append(index.CO2)
        }
        return co2
    }
}
