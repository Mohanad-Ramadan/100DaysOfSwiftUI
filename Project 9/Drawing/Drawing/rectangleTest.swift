//
//  rectangleTest.swift
//  Drawing
//
//  Created by Mohanad Ramdan on 24/07/2023.
//

import SwiftUI

struct Trapzoid: Shape{
    var insetPath : Double
    
    var animatableData: Double {
        get { insetPath }
        set { insetPath = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetPath, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetPath, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct rectangleTest: View {
    @State var insetPath = 50.0
    
    var body: some View {
        Trapzoid(insetPath: insetPath)
            .frame(width: 200,height: 200)
            .onTapGesture {
                withAnimation{
                    insetPath = Double.random(in: 0...90)
                }
            }
            
    }
}

struct rectangleTest_Previews: PreviewProvider {
    static var previews: some View {
        rectangleTest()
    }
}
