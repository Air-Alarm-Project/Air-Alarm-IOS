//
//  ContentLogin.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/29.
//

import SwiftUI

class getUserInfo: ObservableObject {
    @Published var userid: String = ""
    @Published var userSN: String = ""

}

struct ContentLogin: View {

    let restApi = RestAPI()
    // 로그인 관련
    @State private var member = Login.init()    // 로그인 관련 member
    @State private var showError = false        // 로그인 관련 메시지
    @Binding var signInSuccess: Bool
    // 회원가입 관련
    @State var showingSignUp = false
    //SN키 반환 관련
    @ObservedObject var getUser = getUserInfo()
//    @AppStorage("id") var userIID: String = ""
//    @State var useriddd = UserDefaults.standard.string(forKey: "id")
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) //전체화면 색상
            
            VStack{
                Image("icon")
                    .resizable()
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                    .padding()
                TextField("아이디/Email", text: $member.id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
//                myInfo(userId: $member.id)
                SecureField("비밀번호", text: $member.pwd)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack{
                    Button(action: {
                        var trigger = self.restApi.GET_Login(member: self.member)
                        print("trigger info >> ", trigger)
                        getUser.userid += trigger.id
                        print("user info >> ", getUser.userid)
//
//                        UserDefaults.standard.setValue($member.id, forKey: "id")
                        
                        if trigger.success {
                            self.signInSuccess = true
                        }else{
                            self.showError = true
                        }
                        }) {
                            Text("로그인")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                                        .frame(width: 90, height: 50)
                                )
                        }.padding()

                    Button(action: {
                        self.showingSignUp.toggle()
                    }) {
                        Text("회원가입")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(40)
                    }.sheet(
                        isPresented: $showingSignUp,
                        content: {
                            Signup(showingSignUp: self.$showingSignUp)
                        }
                    )
                    .padding()
                }
                    if showError {
                        Text("아이디 또는 비밀번호를 잘못 입력했습니다.")
                            .foregroundColor(Color.red)
                    }
            }
            .frame(maxWidth: 320)
            .padding(.horizontal)
        }
    }
}
