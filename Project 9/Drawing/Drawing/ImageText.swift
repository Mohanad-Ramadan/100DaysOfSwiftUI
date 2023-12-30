//
//  SwiftUIView.swift
//  Drawing
//
//  Created by Mohanad Ramdan on 23/07/2023.
//

import SwiftUI

struct ImageTest: View {
    var body: some View {
        VStack{
            Image("me")
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 450)
                .border(Color(.cyan))
        }
    }
}

struct ImageTest_Previews: PreviewProvider {
    static var previews: some View {
        ImageTest()
    }
}
