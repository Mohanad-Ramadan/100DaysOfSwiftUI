//
//  ContentView.swift
//  Wesplitioi
//
//  Created by Mohanad Ramdan on 15/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var baseUnit = "m"
    @State private var inputNumb = 0.0
    @State private var baseOutUnit = "m"
    let units = ["m", "Km", "feet", "yard", "Miles"]
    
    var inputToBase:Double {
        switch baseUnit {
        case "Km":
            return inputNumb * 1000
        case "feet":
            return inputNumb * 0.3048
        case "yard":
            return inputNumb * 0.9144
        case "Miles":
            return inputNumb * 1609.34
        default:
            return inputNumb
        }
    }
    
    var outputValue:Double {
        switch baseOutUnit {
        case "Km":
            return inputToBase / 1000
        case "feet":
            return inputToBase / 0.3048
        case "yard":
            return inputToBase / 0.9144
        case "Miles":
            return inputToBase / 1609.34
        default:
            return inputToBase
        }
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the number", value: $inputNumb, format: .number)
                        .keyboardType(.decimalPad)
                    Picker ("Unit Select", selection: $baseUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                        
                    }
                    .pickerStyle(.segmented)

                } header: {
                    Text("from:")
                        .bold()
                }
                Section {
                    Text("\(outputValue.formatted())")
                    Picker ("Unit Select", selection: $baseOutUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }header: {
                    Text("To:")
                        .bold()
                }
                Section {
                    
                    
                }
            }
            .navigationTitle("Distance Converter:")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
