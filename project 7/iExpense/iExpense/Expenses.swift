//
//  Expenses.swift
//  iExpense
//
//  Created by Mohanad Ramdan on 09/05/2023.
//

import Foundation

class Expenses: ObservableObject {
    
    @Published var itemsPersonal = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(itemsPersonal) {
                UserDefaults.standard.set(encoded, forKey: "Personal")
            }
        }
    }
    
    @Published var itemsBusiness = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(itemsBusiness) {
                UserDefaults.standard.set(encoded, forKey: "Business")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Personal") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                itemsPersonal = decodedItems
                return
            }
        } else if let savedItems = UserDefaults.standard.data(forKey: "Business") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                itemsBusiness = decodedItems
                return
            }
        } else {
            itemsBusiness = []
            itemsPersonal = []
        }
    }
}
