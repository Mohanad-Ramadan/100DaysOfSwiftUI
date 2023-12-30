//
//  AddView.swift
//  iExpense
//
//  Created by Mohanad Ramdan on 10/05/2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView(){
            Form{
                TextField ("Name", text: $name)
                    
                Picker("Expenses Type:", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField ("amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Expenses:")
            .toolbar {
                Button("Save"){
                    if type == "Personal" {
                        let itemPersonal = ExpenseItem(name: name,type: type, amount: amount)
                        expenses.itemsPersonal.append(itemPersonal)
                        dismiss()
                    }else {
                        let itemBusiness = ExpenseItem(name: name,type: type, amount: amount)
                        expenses.itemsBusiness.append(itemBusiness)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
