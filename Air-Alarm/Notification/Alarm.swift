//
//  Alarm.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/22.
//

import SwiftUI

struct Alarm: View {

    var body: some View {
        NavigationView {
            VStack {
                ProfileImage(imageName: "icon")
                Form{
                    Section(header: Text("이번 주")) {
                        Text("이산화 탄소량이 높습니다.")
                    }
                    Section(header: Text("이전 알림")) {
                        Text("미세먼지 농도가 높습니다.") 
                    }
                }
            }
        }
    }
}

struct Alarm_Previews: PreviewProvider {
    static var previews: some View {
        Alarm()
    }
}
