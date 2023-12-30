//
//  DataController.swift
//  Bookworm
//
//  Created by Mohanad Ramdan on 18/08/2023.
//
import CoreData
import Foundation


class DataController:ObservableObject {
    
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
