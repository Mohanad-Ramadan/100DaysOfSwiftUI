//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Mohanad Ramdan on 28/09/2023.
//

import Foundation

class Favorites: ObservableObject{
    private var resorts: Set<String>
    
    private let saveKey = "Favorities"
    
    init() {
        if let savedItem = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedItem = try? JSONDecoder().decode(Set<String>.self, from: savedItem) {
                resorts = decodedItem
                return
            }
        }
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }else{
            fatalError("Couldn't encode favorite resorts")
        }
    }
}
