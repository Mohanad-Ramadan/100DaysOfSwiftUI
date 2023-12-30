//
//  CoreDataLearnApp.swift
//  CoreDataLearn
//
//  Created by Mohanad Ramdan on 22/08/2023.
//

import SwiftUI

@main
struct CoreDataLearnApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
