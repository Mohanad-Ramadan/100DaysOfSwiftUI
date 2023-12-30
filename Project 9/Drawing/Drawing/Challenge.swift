//
//  Challenge.swift
//  Drawing
//
//  Created by Mohanad Ramdan on 24/07/2023.
//

import SwiftUI

struct Arrow: Shape{

    
//    var animatableData: Double {
//        get { insetPath }
//        set { insetPath = newValue }
//    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        
        path.move(to: CGPoint(x: rect.minX, y: 100))
        path.addLine(to: CGPoint(x: rect.minX, y: 100))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: 100))
        path.addLine(to: CGPoint(x: rect.maxX, y: 200))
        path.addLine(to: CGPoint(x: rect.midX + 60, y: 30 + 100  ))
        path.addLine(to: CGPoint(x: rect.midX + 60, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - 60, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - 60, y: 30 + 100 ))
        path.addLine(to: CGPoint(x: rect.minX, y: 200))
        path.addLine(to: CGPoint(x: rect.minX, y: 100))
        
        return path
    }
}

struct Challenge: View {
    @State var color = 0.0
    @State var thick :CGFloat = 1
    
    var body: some View {
        VStack{
            Spacer()
            Arrow()
                .stroke(style: StrokeStyle(lineWidth: thick,lineCap: .round,lineJoin: .round))
                .frame(width: 300, height: 400)
                .padding()
                .foregroundColor(Color(hue: color, saturation: 1 , brightness: 0.7))
            Spacer()
            Group{
                VStack {
                    CapsuleText(text:"Color hue")
                    Slider(value: $color, in: 0...1 ,step: 0.001)
                }
                VStack {
                    CapsuleText(text:"Bigger")
                    Slider(value: $thick, in: 1...40)
                }
            }
            .padding(.horizontal, 40)
            Spacer()
        }
    }
}

struct Challenge_Previews: PreviewProvider {
    static var previews: some View {
        Challenge()
    }
}

struct CapsuleText: View {
    
    @State var text : String
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 120, height: 30)
                .foregroundColor(Color(UIColor(red: 220/255.0, green: 219/255.0, blue: 218/255.0, alpha: 1.000)))
            Text(text)
                .foregroundColor(.black)
                .bold()
        }
    }
}
