//
//  UnderLineTextFieldView.swift
//  Air-Alarm
//
//  Created by 김하은 on 2021/08/28.
//

import SwiftUI

struct UnderlineTextFieldView<TextFieldView>: View where TextFieldView: View {

     @Binding var text: String
     let textField: TextFieldView
     let placeholder: String

     var body: some View {
          HStack {
               underlineTextFieldView
          }
     }
}

extension UnderlineTextFieldView {
     private var underlineTextFieldView: some View {
          VStack {
               ZStack(alignment: .leading) {
                    if text.isEmpty {
                        Text(placeholder)
                             .foregroundColor(.gray)
                             .padding(.leading, 16)
                             .opacity(0.5)
                    }

               textField
                    .padding(.trailing, 16)
                    .padding(.leading, 30)
               }

            Rectangle()
                .frame(height: 1)
                .foregroundColor(.blue)
                .padding(.trailing, 16)
                .padding(.leading, 16)
          }
     }
}

