//
//  ContentView.swift
//  iQuestion
//
//  Created by Mohanad Ramdan on 05/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var userAnswer = 0
    @State var multiplicationTable = 2
    
    
    var body: some View {
        NavigationView{
            Form {
                VStack {
                        Stepper("Multiplication Table Of: \(multiplicationTable)", value: $multiplicationTable, in: 2...12, step: 1)
                }
                
            }
            .navigationTitle("I Queastion:")
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
