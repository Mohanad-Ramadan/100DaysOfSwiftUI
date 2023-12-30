//
//  TopScreenBar.swift
//  Dicey
//
//  Created by Mohanad Ramdan on 25/09/2023.
//

import SwiftUI

struct TopBarView: View {
    let totalRolled: Int
    var resetAll: (()->Void)?
    var body: some View {
        VStack{
            HStack{
                Button {
                    // more code to come
                } label: {
                    Image(systemName: "gearshape")
                        .font(.title)
                        .padding(10)
                        .background(.white.opacity(0.7))
                        .clipShape(Circle())
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Total: \(totalRolled)")
                    .font(.title3)
                    .frame(width: 100,height: 50)
                    .background(.white.opacity(0.7))
                    .clipShape(Capsule())
                Button {
                    resetAll?()
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.title)
                        .padding(10)
                        .background(.white.opacity(0.7))
                        .clipShape(Circle())
                        .foregroundColor(.black)
                }
            }
            .padding(.vertical)
            Spacer()
            
        }
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
