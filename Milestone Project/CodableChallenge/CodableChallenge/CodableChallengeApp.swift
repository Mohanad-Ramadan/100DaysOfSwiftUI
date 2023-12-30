//
//  CodableChallengeApp.swift
//  CodableChallenge
//
//  Created by Mohanad Ramdan on 24/08/2023.
//

import SwiftUI

@main
struct CodableChallengeApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
