//
//  AList.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/06.
//

import SwiftUI

struct AListView: View {
    let restAPI = RestAPI()
    @State var db = DustInfo.init()
    @State var refresh = Refresh(started: false, released: false)
    @State var json :  String = "아래로 당겨서 새로고침"
    
    func update() {
        self.db = restAPI.GET_Dust()
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
                            Text("온도 :  " + " " + String(db.temperature) + " °C")
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("습도 :  " + " " + String(db.humidity) + " %")
                                .padding()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Text("CO₂ :  " + String(db.CO2) + " ppm")
                                .padding()
                            if(db.CO2 == 0) { // 대기
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.gray)
                                    .cornerRadius(15)
                            }
                            else if(db.CO2 >= 350 && db.CO2 <= 450) { // 좋음
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.blue)
                                    .cornerRadius(15)
                            }
                            else if(db.CO2 > 450 && db.CO2 <= 1000) { // 약간 나쁨
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.yellow)
                                    .cornerRadius(15)
                            }
                            else if(db.CO2 > 1000 && db.CO2 <= 2000) { // 나쁨
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
                            Text("PM10 :  " + String(db.dust) + " ㎍/m³")
                                .padding()
                            if(db.dust == 0) { // 대기
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.gray)
                                    .cornerRadius(15)
                            }
                            else if(db.dust <= 30 && db.dust > 0) { // 좋음
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.blue)
                                    .cornerRadius(15)
                            }
                            else if(db.dust >= 31 && db.dust <= 80) { // 보통
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.green)
                                    .cornerRadius(15)
                            }
                            else if(db.dust >= 81 && db.dust <= 120) { // 약간 나쁨
                                Rectangle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.yellow)
                                    .cornerRadius(15)
                            }
                            else if(db.dust >= 121 && db.dust <= 200) { // 나쁨
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
                            Spacer()
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
            HStack {
                Rectangle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.red)
                    .cornerRadius(15)
                Text(": 매우 나쁨")
                Rectangle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.orange)
                    .cornerRadius(15)
                Text(": 나쁨")
                Rectangle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.yellow)
                    .cornerRadius(15)
                Text(": 약간 나쁨")
            }
            HStack {
                Rectangle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.green)
                    .cornerRadius(15)
                Text(": 보통")
                Rectangle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.blue)
                    .cornerRadius(15)
                Text(": 좋음")
                Rectangle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.gray)
                    .cornerRadius(15)
                Text(": 대기")
            }
            Spacer()
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
struct Refresh {
    var startOffset : CGFloat = 0
    var offset : CGFloat = 0
    var started : Bool
    var released: Bool
    var invalid : Bool = false
}

struct AList_Previews: PreviewProvider {
    static var previews: some View {
        AListView()
    }
}
