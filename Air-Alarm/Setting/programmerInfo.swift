//
//  programmerInfo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct programmerInfo: View {
    var body: some View {
            VStack {
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
                    Section(header: Text("개발자 정보")) {
                        Link(destination: URL(string: "https://github.com/hanni66")!) {
                            HStack {
                                Text("김하은")
                                    .bold()
                                Spacer()
                                Text("iOS")
                                    .bold()
                            }
                            .foregroundColor(.black)
                        }
                        Link(destination: URL(string: "https://github.com/parkjinhee53")!) {
                            HStack {
                                Text("박진희")
                                    .bold()
                                Spacer()
                                Text("iOS")
                                    .bold()
                            }
                            .foregroundColor(.black)
                        }
                        Link(destination: URL(string: "https://github.com/kohbwoo")!) {
                            HStack {
                                Text("고병우")
                                    .bold()
                                Spacer()
                                Text("Embedded")
                                    .bold()
                            }
                            .foregroundColor(.black)
                        }
                        Link(destination: URL(string: "https://github.com/SonChangHa")!) {
                            HStack {
                                Text("손창하")
                                    .bold()
                                Spacer()
                                Text("Backend")
                                    .bold()
                            }
                            .foregroundColor(.black)
                        }
                    }.padding(10)
                    HStack {
                        Spacer()
                        Text("이름 클릭 시 Github 주소로 연결")
                        Spacer()
                    }
                }
            }
            .background(Color.white)
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(false)
    }
}

struct programmerInfo_Previews: PreviewProvider {
    static var previews: some View {
        programmerInfo()
    }
}
