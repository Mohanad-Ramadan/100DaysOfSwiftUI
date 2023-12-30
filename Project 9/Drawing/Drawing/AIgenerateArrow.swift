//
//  AIgenerateArrow.swift
//  Drawing
//
//  Created by Mohanad Ramdan on 24/07/2023.
//

import SwiftUI

struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width
        let height = rect.size.height
        
        let startPoint = CGPoint(x: width * 0.25, y: 0)
        let tipPoint = CGPoint(x: width * 0.5, y: height * 0.5)
        let endPoint = CGPoint(x: width * 0.75, y: 0)
        
        path.move(to: startPoint)
        path.addLine(to: tipPoint)
        path.addLine(to: endPoint)
        
        return path
    }
}

struct ArrowAI: View {
    var body: some View {
        ArrowShape()
            .fill(Color.red)
            .frame(width: 300, height: 200)
    }
}

struct ArrowAI_Previews: PreviewProvider {
    static var previews: some View {
        ArrowAI()
    }
}
