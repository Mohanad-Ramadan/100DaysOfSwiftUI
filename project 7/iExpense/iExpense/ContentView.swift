//
//  ContentView.swift
//  iExpense
//
//  Created by Mohanad Ramdan on 09/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAddExpense = false
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                Section{
                    ForEach(expenses.itemsPersonal) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            if item.amount<10 {
                                Text(item.amount, format: .currency(code: Locale.current.identifier))
                                    .foregroundColor(.green)
                            }
                            else if item.amount<100 {
                                Text(item.amount, format: .currency(code: Locale.current.identifier))
                                    .foregroundColor(.orange)
                            }
                            else {
                                Text(item.amount, format: .currency(code: Locale.current.identifier))
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                Section{
                    ForEach(expenses.itemsBusiness) { item in
                        
                        HStack {
                            Text(item.name)
                            Spacer()
                            if item.amount<10 {
                                Text(item.amount, format: .currency(code: Locale.current.identifier))
                                    .foregroundColor(.green)
                            }
                            else if item.amount<100 {
                                Text(item.amount, format: .currency(code: Locale.current.identifier))
                                    .foregroundColor(.orange)
                            }
                            else {
                                Text(item.amount, format: .currency(code: Locale.current.identifier))
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense:")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.itemsBusiness.remove(atOffsets: offsets)
        expenses.itemsPersonal.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
