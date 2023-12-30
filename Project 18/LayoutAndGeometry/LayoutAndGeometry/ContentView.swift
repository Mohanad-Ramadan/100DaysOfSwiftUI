//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Mohanad Ramdan on 21/09/2023.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    @State var isAtTheTop = false
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        withAnimation {
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(colors[index % 7])
                                .scaleEffect()
                                .opacity(geo.frame(in: .global).minY < fullView.size.height / 2.5
                                         ? Double(geo.frame(in: .global).minY / (fullView.size.height / 2.5))
                                         : 1 )
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .padding()
                        }
                    }
                    .frame(height: 30)
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
