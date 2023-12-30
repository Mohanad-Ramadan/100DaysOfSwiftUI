//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Mohanad Ramdan on 27/09/2023.
//

import SwiftUI

struct SkiDetailsView: View {
    let resorts: Resort
    
    var body: some View {
        Group {
            VStack(spacing: 4) {
                Text("Elevation:")
                    .font(.caption.bold())
                
                Text("\(resorts.elevation)m")
                    .font(.headline)
                    .foregroundColor(.primary.opacity(0.5))
            }

            VStack(spacing: 4) {
                Text("Snow:")
                    .font(.caption.bold())
                Text("\(resorts.snowDepth)cm")
                    .font(.headline)
                    .foregroundColor(.primary.opacity(0.5))
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resorts: Resort.example)
    }
}
