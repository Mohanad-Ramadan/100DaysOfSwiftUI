//
//  DataControlled.swift
//  CodableChallenge
//
//  Created by Mohanad Ramdan on 25/08/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "Cache")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
}
