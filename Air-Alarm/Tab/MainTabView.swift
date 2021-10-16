//
//  MainTabView.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

// 하단 Tab2
struct MainTabView: View {
    var body: some View {
        HeaderTabView()
        TabView {
            AListView()
                .tabItem{ Label( "", systemImage: "thermometer")  }
                .navigationBarHidden(false)
            BList()
                .tabItem{ Label( "", systemImage: "chart.xyaxis.line") }
                .navigationBarHidden(false)
            CList()
                .tabItem{ Label( "", systemImage: "wind") }
                .navigationBarHidden(false)
        }
    }
}

struct HeaderTabView: View {
    // notification 관련 필드, 메소드
    @State var showingAlarm = false
    let restAPI = RestAPI()
    @State var db = DustInfo.init()
    @State var dbb = WeatherInfo.init()
    
    func updatedb() {
        self.db = restAPI.GET_Dust()
        self.dbb = restAPI.GET_Weather()
        
    }
    
    func setNotification() { // 알림
        let manager = LocalNotificationManager()
        manager.requestPermission()
        manager.addNotification(title: "이산화 탄소량이 높습니다.")     // 출력할 content
        manager.scheduleNotifications()        // 시간 트리거를 준 메소드
        self.showingAlarm.toggle()
        print("notification start")
    }
    
    // settings 관련 필드
    @State var showingSettings = false
    
    var body: some View {
        HStack {
            Image("icon")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .padding(10)
            Spacer()
            Text("Air Alarm")
                .foregroundColor(Color.blue)
            Spacer()
            Button(action: {
                self.showingSettings.toggle()
            })
            {
                Image(systemName: "gearshape")
            }.fullScreenCover(isPresented: $showingSettings,content: { Settings() })
            Button(action: {
                updatedb()
                self.setNotification()
                if (Int(db.dust) > dbb.dust10 + 50) {
                    self.setNotification()
                }
                else if (db.dust > 100){
                    self.setNotification()
                }
                else if (db.CO2 > 1000) {
                    self.setNotification()
                }
            }
            ){
                Image(systemName: "bell")
            }.sheet(isPresented: $showingAlarm) {
                Alarm()
            }
            .padding(10)
        }
    }
}
