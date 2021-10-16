//
//  ContentView.swift
//  Air-Alarm
//
//  Created by byungwoo on 2021/08/06.
//

import SwiftUI

struct ContentView: View {
    
    @State var restApi = RestAPI()
    @State var signInSuccess = false
    
    
    var body: some View {
        // 로그인 조건
        return Group {
            if signInSuccess {
                MainTabView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            }
            else {
                ContentLogin(signInSuccess: $signInSuccess)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
