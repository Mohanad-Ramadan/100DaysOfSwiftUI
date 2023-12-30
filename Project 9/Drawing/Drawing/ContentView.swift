//
//  ContentView.swift
//  Drawing
//
//  Created by Mohanad Ramdan on 16/05/2023.
//

import SwiftUI

struct ContentView: View {
    struct Arc: Shape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
            
            return path
        }
    }
    
    @State private var changeArc = 0.0
    
    var body: some View {
        VStack{
            Arc(startAngle: .degrees(changeArc), endAngle: .degrees(-changeArc), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
                .padding()
            Slider(value: $changeArc , in: 0...180 )
                .padding()
        }
    }
    
    func changeAutomatic(){
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
