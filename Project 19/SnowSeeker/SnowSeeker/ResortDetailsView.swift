//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Mohanad Ramdan on 27/09/2023.
//

import SwiftUI

struct ResortDetailsView: View {
    let resorts: Resort
    
    var price: String {
        String(repeating: "$", count: resorts.price)
    }
    
    var size: String {
        switch resorts.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    }
    
    var body: some View {
        Group {
                VStack(spacing: 4) {
                    Text("Size:")
                        .font(.caption.bold())
                    Text(size)
                        .font(.headline)
                        .foregroundColor(.primary.opacity(0.5))
                }
                
                VStack(spacing: 4) {
                    Text("Price:")
                        .font(.caption.bold())
                    Text(price)
                        .font(.headline)
                        .foregroundColor(.primary.opacity(0.5))
                }
            }
            .frame(maxWidth: .infinity)
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resorts: Resort.example)
    }
}
