//
//  ContentView.swift
//  GussTheFlag
//
//  Created by Mohanad Ramdan on 20/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var removedFlages = [String]()
    @State var wrongAlert = false
    @State var winningAlert = false
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State var scoreTotaleValue = 0
    @State var flagName = 0
    @State var selectedFlag = 3
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 50){
                VStack {
                    Text("tap the flag")
                        .foregroundColor(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.secondary)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                            .rotation3DEffect(.degrees(selectedFlag == number ? 360 : 0), axis: (x:0,y:1,z:0))
                            .animation(.default, value: selectedFlag)
                    }
                }
                Text("Score: \(scoreTotaleValue)/3")
                    .foregroundStyle(.secondary)
                    .font(.title.bold())
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.thinMaterial.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
        }
        
        //Wrong Alart
        
        .alert("Wrong", isPresented: $wrongAlert) {
            Button("Continue", action: reset)
        } message: {
            Text("Wrong! That’s the flag of \(countries[flagName])")
        }
        
        //Winning Alart
        
        .alert("You Win", isPresented: $winningAlert) {
            Button("Continue", action: reset)
        } message: {
            Text("Your score is \(scoreTotaleValue)/3")
        }
        
    }

    func flagTapped(_ number:Int){
        flagName = number
        selectedFlag = number
        
        if scoreTotaleValue==2 {
            winningAlert = true
            scoreTotaleValue+=1
        }
        else if number == correctAnswer{
            scoreTotaleValue+=1
            continuee()
        }
        else {
            wrongAlert = true
        }
    }
    
    
    func continuee() {
        
        removedFlages.append(countries[correctAnswer])
        countries.remove(at: correctAnswer)
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
    func reset() {
        scoreTotaleValue = 0
        continuee()
        countries += removedFlages
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
