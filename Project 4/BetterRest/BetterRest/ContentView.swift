//
//  ContentView.swift
//  BetterRest
//
//  Created by Mohanad Ramdan on 24/04/2023.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var calculateBedtime : String {
         var message = ""
        do {
            let config = MLModelConfiguration()
            let model = try SleepAI(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            message = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            message = "Sorry, there was a problem calculating your bedtime."
        }
         return message
    }
    
    static var defaultTime: Date {
        var component = DateComponents()
        component.hour = 7
        component.minute = 0
        return Calendar.current.date(from: component) ?? Date.now
    }
    
    var body: some View {
        NavigationView() {
            Form {
                Section {
                    DatePicker("Please pick a Time:", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                } header: {
                    Text("When do you want to wake up?")
                        .bold()
                }
                Section {
                    Stepper("\(sleepAmount.formatted()) houers", value: $sleepAmount, in: 4...10 , step: 0.25)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .center)
                } header: {
                    Text("Desired amount of sleep:")
                        .bold()
                }
                Section {
                    Picker ("Number of cups", selection: $coffeeAmount){
                        ForEach(1..<21){
                            Text($0 == 1 ? "1 cup" : "\($0) cups")
                        }
                    }
                } header: {
                    Text("Desired amount of coffees:")
                        .bold()
                }
                Section{
                    Text(calculateBedtime)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.gray)
                } header: {
                    Text("The Recommended bedtime is:")
                        .bold()
                }
            }
            .navigationTitle("BetterRest:")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
