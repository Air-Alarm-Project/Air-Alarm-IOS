//
//  Charts2.swift
//  Air-Alarm
//
//  Created by Jinhee on 2021/09/22.
//

import SwiftUI
import SwiftUICharts

struct Charts2: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: BList()) {
                        Text("일")
                            .padding(.horizontal, 28.0)
                    }
                    NavigationLink(destination: Charts1()) {
                        Text("주")
                            .padding(.horizontal, 28.0)
                    }
                    NavigationLink(destination: Charts2()) {
                        Text("월")
                            .padding(.horizontal, 28.0)
                            .foregroundColor(.red)
                    }
                }
                .padding(.horizontal,10.0)
                Divider()
                Spacer()
//                ScrollView {
//                    LineView(data: Data.data2, title: Data.title, legend: Data.legend0, style: Style.metoring)
//                        .padding()
//                        .frame(width: 360, height: 365)
//                    LineView(data: Data.data1, title: Data.title, legend: Data.legend1, style: Style.metoring)
//                        .padding()
//                        .frame(width: 360, height: 365)
//                    LineView(data: Data.data0, title: Data.title, legend: Data.legend2, style: Style.metoring)
//                        .padding()
//                        .frame(width: 360, height: 365)
//                    LineView(data: Data.data3, title: Data.title, legend: Data.legend3, style: Style.metoring)
//                        .padding()
//                        .frame(width: 360, height: 365)
//                    Spacer()
//                }
                .padding()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct Charts2_Previews: PreviewProvider {
    static var previews: some View {
        Charts2()
    }
}
