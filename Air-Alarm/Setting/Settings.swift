//
//  Settings.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct Settings: View {
    @Environment(\.presentationMode) var presentationMode
    let restApi = RestAPI()
    // 로그인 관련
    @State private var member = Login.init()    // 로그인 관련 member
    
    var body: some View {
        VStack{
            NavigationView {
                VStack{
                    List {
                        myInfofo
                        changeSNN
                        sensorInfofo
                        weatherInfofo
                        programmerInfofo
                        logout
                    }
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Text("뒤로가기")
                    }
                    .accentColor(.blue)
                }
            }
        }
    }
}

private extension Settings {
    var logout: some View {
        NavigationLink(
            destination: ContentView()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        ){
            Text("로그아웃")
                .font(.headline)
                .padding()
                .foregroundColor(.red)
                .cornerRadius(40)
        }
    }
    var myInfofo: some View {
        NavigationLink(
            destination: myInfo()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
        ) {
            Text("내 정보")
                .font(.headline)
                .padding()
        }
    }
    
    var changeSNN: some View {
        NavigationLink(
            destination: changeSN()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)

        ) {
            Text("S/N 변경")
                .font(.headline)
                .padding()
        }
    }
    
    var sensorInfofo: some View {
        NavigationLink(
            destination: sensorInfo()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
                .navigationBarTitle("센서 측정 주기 / 단위 정보")
            
        ){
            Text("센서 측정 주기 / 단위 정보")
                .font(.headline)
                .padding()
        }
    }
    
    var weatherInfofo: some View {
        NavigationLink(
            destination: WeatherInfoo()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
                .navigationBarTitle("지역 날씨 API 정보")
            
        ){
            Text("지역 날씨 API 정보")
                .font(.headline)
                .padding()
        }
    }
    
    var programmerInfofo: some View {
        NavigationLink(
            destination: programmerInfo()
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(false)
            
        ){
            Text("개발자 정보")
                .font(.headline)
                .padding()
        }
    }
}
