//
//  RestAPI.swift
//  Air-Alarm
//
//  Created by air-alarm on 2021/08/14.
//
import Foundation

class RestAPI {
    let sync_que = DispatchQueue.global()
    let sync_group = DispatchGroup.init()
    
    // 실시간 센서 정보 가져오기
    func GET_Dust() -> DustInfo {
        var db = DustInfo.init()
        
        if let url = URL(string: "http://api.air-alarm.site:5000/get") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // get
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(DustInfo.self, from: data) {
                    db = json
                }
            }.resume()
        }
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
    
    // 실시간 센서 정보 가져오기
    func GET_Weather() -> WeatherInfo {
        var db = WeatherInfo.init()
        
        if let url = URL(string: "http://api.air-alarm.site:5000/weather") {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // get
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(WeatherInfo.self, from: data) {
                    db = json
                }
            }.resume()
        }
        
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
    
    // 회원가입 정보 보내고 성공 여부 리턴하기
    func GET_Signup(member: SignUpMember) -> SignUpSuccess {
        var db = SignUpSuccess.init()
        if let url = URL(string: "http://api.air-alarm.site:4999/signup_confirm?" +
                        "id=" + member.id +
                        "&pwd=" + member.pwd +
                        "&SN=" + member.SN) {
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // get
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(SignUpSuccess.self, from: data) {
                    db = json
                }
            }.resume()
        }
        
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
    
    // 로그인 성공 여부 리턴
    func GET_Login(member: Login) -> LoginSuccess {
        var db = LoginSuccess.init()
        if let url = URL(string: "http://api.air-alarm.site:4999/login_confirm?" +
                            "id=" + member.id +
                            "&pwd=" + member.pwd){
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            DispatchQueue.global().sync {
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    guard let data = data else { return }

                    
                    // get
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(LoginSuccess.self, from: data) {
                        db = json
                        print("1", db)
                    }
                }.resume()
            }
        }
        
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
    
//    // id 입력시 SN 반환
    func GET_SN(member: getSN) -> getSNSuccess {
        var db = getSNSuccess.init()
        if let url = URL(string: "http://api.air-alarm.site:4999/data?" +
                            "id=" + member.id ){
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            DispatchQueue.global().sync {
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    guard let data = data else { return }


                    // get
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(getSNSuccess.self, from: data) {
                        db = json
                        print("1", db)
                    }
                }.resume()
            }
        }

        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.3)
        return db
    }
    
    //
    func GET_changeSN(member: changeSNkey) -> changeSuccess {
        var db = changeSuccess.init()
        if let url = URL(string: "http://api.air-alarm.site:4999/change?" +
                            "id=" + member.id +
                            "&presn=" + member.preSN +
                            "&nowsn=" + member.nowSN ){
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            DispatchQueue.global().sync {
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    guard let data = data else { return }


                    // get
                    let decoder = JSONDecoder()
                    if let json = try? decoder.decode(changeSuccess.self, from: data) {
                        db = json
                        print("1", db)
                    }
                }.resume()
            }
        }

        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.3)
        return db
    }
    
    // 하루 기준 시간당 평균 센서 정보 가져오기
    func GET_HourAll() -> [DustInfo] {
        var db = [DustInfo]()
        
        if let url = URL(string: "http://api.air-alarm.site:5000/hourall"){
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // get
                let decoder = JSONDecoder()
                if let json = try? decoder.decode([DustInfo].self, from: data) {
                    db = json
                }
            }.resume()
        }
        
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
    
    // 월 기준 시간당 평균 센서 정보 가져오기
    func GET_DayAll() -> [DustInfo] {
        var db = [DustInfo]()
        
        if let url = URL(string: "http://api.air-alarm.site:5000/dayall"){
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // get
                let decoder = JSONDecoder()
                if let json = try? decoder.decode([DustInfo].self, from: data) {
                    db = json
                }
            }.resume()
        }
        
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
    
    // 월 기준 시간당 평균 센서 정보 가져오기
    func GET_Week() -> [DustInfo] {
        var db = [DustInfo]()
        
        if let url = URL(string: "http://api.air-alarm.site:5000/weak"){
            var request = URLRequest.init(url: url)

            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else { return }

                // get
                let decoder = JSONDecoder()
                if let json = try? decoder.decode([DustInfo].self, from: data) {
                    db = json
                }
            }.resume()
        }
        
        // wait 0.5 sec
        Thread.sleep(forTimeInterval: 0.5)
        return db
    }
}
