//
//  WeatherInfoo.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/10/12.
//

import SwiftUI

struct WeatherInfoo: View {
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("공공데이터포털 미세먼지 API")
                        .fontWeight(.black)
                        .padding()
                    Spacer()
                }
                Text("한국환경공단_에어코리아_대기오염정보")
                Text("시도별 실시간 측정정보 조회")
                Link(destination: URL(string: "https://www.data.go.kr/data/15073861/openapi.do")!, label: {
                    Text("조회")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: 1)
                                .frame(width: 70, height: 40)
                        )
                })
            }
            VStack {
                Text("갱신주기")
                    .fontWeight(.black)
                Text("매시간마다 갱신")
            }.padding()
            VStack {
                Text("받아오는 데이터 정보")
                    .fontWeight(.black)
                Text("대기오염정보(Co2(ppm)\n 미세먼지(㎍/㎥)\n 초미세먼지(㎍/㎥))")
            }.padding()
            
            VStack {
                HStack {
                Text("공공데이터포털 기상청 API")
                    .fontWeight(.black)
                    .padding()
                    Spacer()
                }
                Text("기상청_단기예보 조회서비스")
                Text("초단기예보조회")
            Link(destination: URL(string: "https://www.data.go.kr/data/15000415/openapi.do")!, label: {
                Text("조회")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 1)
                            .frame(width: 70, height: 40)
                    )
            })
            }
            VStack {
                Text("갱신주기")
                    .fontWeight(.black)
                Text("매시간마다 갱신")
            }.padding()
            VStack {
                Text("받아오는 데이터 정보")
                    .fontWeight(.black)
                HStack {
                    Text("대기오염정보(온도('C) \n 습도(%))")
                }
            }.padding()
            //            .background(Color.white)
            //            .navigationBarHidden(false)
            //            .navigationBarBackButtonHidden(false)
        }
    }
}
struct WeatherInfo_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoo()
    }
}
