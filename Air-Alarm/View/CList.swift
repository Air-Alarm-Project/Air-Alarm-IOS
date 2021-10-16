//
//  AList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

struct CList: View {
    let restAPI = RestAPI()
    @State var db = WeatherInfo.init()
    @State var refresh = Refreshh(started: false, released: false)
    @State var json :  String = "아래로 당겨서 새로고침"
    
    func update() {
        self.db = restAPI.GET_Weather()
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                
                GeometryReader{reader -> AnyView in
                    
                    DispatchQueue.main.async{
                        
                        if refresh.startOffset == 0{
                            refresh.startOffset = reader.frame(in: .global).minY
                        }
                        refresh.offset = reader.frame(in: .global).minY
                        
                        if refresh.offset - refresh.startOffset > 80 && !refresh.started{
                            
                            refresh.started = true
                        }
                        
                        if refresh.startOffset == refresh.offset && refresh.started && !refresh.released{
                            
                            withAnimation(Animation.linear){refresh.released = true}
                            updateData()
                        }
                        // 유효하지 않은지 확인
                        if refresh.startOffset == refresh.offset && refresh.started && refresh.released && refresh.invalid{
                            
                            refresh.invalid = false
                            updateData()
                        }
                    }
                    
                    return AnyView(Color.black.frame(width: 0, height: 0))
                }
                .frame(width: 0, height: 0)
                
                ZStack (alignment: Alignment(horizontal: .center, vertical:
                    .top)){
                    
                    if refresh.started && refresh.released{
                        ProgressView()
                            .offset(y: -35)
                    }
                    
                    VStack {
                        HStack {
                            Spacer()
                            Text("지역 :  " + String(db.Location))
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("PM2.5 (10):  " + String(db.dust10) + " ㎍/m³")
                                .padding()
                            if(db.dust10 == 0) { // 대기
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.gray)
                                    .cornerRadius(15)
                            }
                            else if(db.dust10 <= 30 && db.dust10 > 0) { // 좋음
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.blue)
                                    .cornerRadius(15)
                            }
                            else if(db.dust10 >= 31 && db.dust10 <= 80) { // 보통
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.green)
                                    .cornerRadius(15)
                            }
                            else if(db.dust10 >= 81 && db.dust10 <= 120) { // 약간 나쁨
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.yellow)
                                    .cornerRadius(15)
                            }
                            else if(db.dust10 >= 121 && db.dust10 <= 200) { // 나쁨
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.orange)
                                    .cornerRadius(15)
                            }
                            else { // 매우 나쁨
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.red)
                                    .cornerRadius(15)
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("PM2.5 (25):  " + String(db.dust25) + " ㎍/m³")
                                .padding()
                            if(db.dust25 == 0) { // 대기
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.gray)
                                    .cornerRadius(15)
                            }
                            else if(db.dust25 <= 30 && db.dust25 > 0) { // 좋음
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.blue)
                                    .cornerRadius(15)
                            }
                            else if(db.dust25 >= 31 && db.dust25 <= 80) { // 보통
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.green)
                                    .cornerRadius(15)
                            }
                            else if(db.dust25 >= 81 && db.dust25 <= 120) { // 약간 나쁨
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.yellow)
                                    .cornerRadius(15)
                            }
                            else if(db.dust25 >= 121 && db.dust25 <= 200) { // 나쁨
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.orange)
                                    .cornerRadius(15)
                            }
                            else { // 매우 나쁨
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.red)
                                    .cornerRadius(15)
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("습도 :  " + String(db.humidity) + " %")
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("온도 :  " + String(db.temperature) + " °C")
                                .padding()
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            Text("측정시간")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 16))
                            Text(db.time)
                                .foregroundColor(Color.gray)
                                .font(.system(size: 16))
                        }
                        
                        Text("\(json)")//웹에서 받아온 내용이 여기 저장됨
                            .padding()
                        
                    }
                    .background(Color.white)
                }
                .offset(y: refresh.released ? 40 : -10)
            })
        }
    }
    func updateData(){
        
        print("update Data")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear){
                
                if refresh.startOffset == refresh.offset{
                    update()
                    refresh.released = false
                    refresh.started = false
                }
                else{
                    refresh.invalid = true
                }
            }
        }
    }
}

//새로고침
struct Refreshh {
    var startOffset : CGFloat = 0
    var offset : CGFloat = 0
    var started : Bool
    var released: Bool
    var invalid : Bool = false
}

struct CList_Previews: PreviewProvider {
    static var previews: some View {
        CList()
    }
}
