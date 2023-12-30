//
//  Main.swift
//  Dicey
//
//  Created by Mohanad Ramdan on 24/09/2023.
//

import SwiftUI

struct MainView: View {
    @State private var dice1 = 0
    @State private var dice2 = 0
    @State private var totalRolled = 0
    @State private var activateTimer = false
    @State private var counter = 1.0
    @State private var timer = Timer.publish(every: 0.1,on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader {geo in
            ZStack {
                // Background Image
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                // the bar contain (retry-setting-total)
                TopBarView(totalRolled: totalRolled,resetAll: resetAll)

                // Dice and Previous rolls views
                DiceAndRollsView(dice1: dice1, dice2: dice2, totalRolled: totalRolled)
                    .frame(maxHeight: geo.size.height * 0.73)
                    
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .onReceive(timer){ time in
            guard activateTimer else {return}
            print(counter)
            if counter>0{
                counter-=0.1
                rolling()
            }else{
                activateTimer = false
                stopTimer()
                counter = 1.0
                // Total rolled for every dice
                loadTotal()
            }
            
        }
        .onTapGesture{begainRoll()}
        .contentShape(Rectangle())
        .onAppear(perform: stopTimer)
    }
    
    func stopTimer() {
        timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        timer = Timer.publish(every: 0.1,on: .main, in: .common).autoconnect()
    }
    
    func begainRoll(){
        startTimer()
        activateTimer = true
    }
    
    func rolling() {
        var diceArray1 = Array(1...6)
        var diceArray2 = Array(1...6)
        
        let lastDice1 = dice1
        let lastDice2 = dice2
        
        if dice1 != 0{
            diceArray1.remove(at: lastDice1-1)
            diceArray2.remove(at: lastDice2-1)
        }
        
        dice1 = diceArray1.randomElement() ?? 6
        dice2 = diceArray2.randomElement() ?? 2
        
        
        
        diceArray1 = Array(1...6)
        diceArray2 = Array(1...6)
    }
    
    func loadTotal() {
        totalRolled += dice1 + dice2
    }
    
    func resetAll() {
        dice1 = 0
        dice2 = 0
        totalRolled = 0
        activateTimer = false
        stopTimer()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
