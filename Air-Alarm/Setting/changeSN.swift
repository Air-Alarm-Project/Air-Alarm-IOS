//
//  changeSN.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/09/14.
//

import SwiftUI

struct changeSN: View {
    
    @State private var successText = false
    let restApi = RestAPI()
    @State private var member = changeSNkey.init()
    @State private var changeSN = ""
    
    var body: some View {
            VStack {
                
                ProfileImage(imageName: "icon")
                        .padding()
                Form {
                    Section(header: Text("SN 변경")) {
                        TextField("아이디를 입력해주세요. (Email)", text: $member.id)
                        TextField("기존 SN을 입력해주세요.(SN)", text: $member.preSN)
                        TextField("변경할 SN을 입력해주세요.(SN)", text: $member.nowSN)
                        
                    }
                    Section(){
                        Button(action:{
                            // SN_trigger에 GET_changeSN의 리턴 값을 저장해줌. (success, nowSN)
                            var SN_trigger = self.restApi.GET_changeSN(member: self.member)
                            print(SN_trigger.success)
                            
//                            changeSN += SN_trigger.nowSN // 변수에 nowSN저장
//                            print(changeSN)
                            
                            if !SN_trigger.success {
                                self.successText = true
                            }
                        }
                        ){
                            HStack{
                                Spacer()
                                Text("변경하기")
                                    .foregroundColor(.blue)
                                    .bold()
                                Spacer()
                            }
                        }
                        
                        // sn키 바꾸는 것이 성공했다는 api를 받아오면 실행할 구문
                        if successText {
                            HStack{         // 가운데 정렬 하기 위해 H스택 만들어줌
                                Spacer()
                                Text("변경되었습니다.")
                                Spacer()
                            }
                            HStack{         // 가운데 정렬 하기 위해 H스택 만들어줌
                                Spacer()
                                Text("변경된 SN : " + self.member.nowSN)
                                Spacer()
                            }
                        }
                    }
                }

            .background(Color.white)
        }
    }
}


struct changeSN_Previews: PreviewProvider {
    static var previews: some View {
        changeSN()
    }
}
