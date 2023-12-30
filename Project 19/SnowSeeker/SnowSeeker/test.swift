//
//  test.swift
//  SnowSeeker
//
//  Created by Mohanad Ramdan on 03/10/2023.
//

import SwiftUI

struct TextFieldPopupView: View {
    @State private var text = ""
    @State private var isON = false

    var body: some View {
        Form {
            Text("Hello")
            TextField("Hello", text: $text).textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Button1"){
                print("Button1")
            }.buttonStyle(BorderlessButtonStyle())

            Text("Button2").foregroundColor(.blue)
                .onTapGesture {
                    print("Button2")
                }

            Button("Button3"){}
                .onTapGesture {
                    print("Button3")
                }

            Toggle(isOn: $isON, label: {
                Text("Toggle")
            })
        }
        .onTapGesture {
            print("---> Form")
        }
    }

}

#Preview {
    TextFieldPopupView()
}
