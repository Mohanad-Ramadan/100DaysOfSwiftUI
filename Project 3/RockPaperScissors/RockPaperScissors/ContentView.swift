//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mohanad Ramdan on 23/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack {
                Image(systemName: "scissors")
                    .scaledToFit()
                    .imageScale(.medium)
                    .foregroundColor(.accentColor)
                
            }
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
