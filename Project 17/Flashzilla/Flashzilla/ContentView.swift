//
//  ContentView.swift
//  Flashzilla
//
//  Created by Mohanad Ramdan on 15/09/2023.
//

import SwiftUI

extension View {
    func stacked(at postion:Int,in total:Int) -> some View{
        let offset = Double(total - postion)
        return self.offset(x: 0,y: offset * 20)
    }
}

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var colorBlind
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @Environment(\.scenePhase) var scenePhase
    
    let saveKey = "SaveUserDefaults"
    
    @State private var cards = [Card]()
    @State private var activateTimer = true
    @State private var timeRemaining = 100
    @State private var showingEditScreen = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Time: \(timeRemaining)")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .background(.black.opacity(0.75))
                            .clipShape(Capsule())
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]){
                            withAnimation{
                                removeCard(at: index)
                            }
                        }
                        .stacked(at: index, in: cards.count)
                        .allowsHitTesting(index == cards.count - 1)
                        .accessibilityHidden(index < cards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .padding()
                }
            }
            if !cards.isEmpty {
                VStack{
                    HStack{
                        Button {
                            showingEditScreen = true
                        } label: {
                            Image(systemName: "plus.circle")
                                .font(.largeTitle)
                                .padding(10)
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Image(systemName: "arrow.counterclockwise")
                            .font(.largeTitle)
                            .padding(10)
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                            .foregroundColor(.white)
                            .onTapGesture(perform: resetCards)
                    }
                    .padding()
                    Spacer()
                }
            }
            
            if colorBlind || voiceOverEnabled {
                VStack{
                    Spacer()
                    HStack {
                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")

                        Spacer()

                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer){ _ in
            guard activateTimer else {return}
            if timeRemaining>0{
                timeRemaining-=1
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active && !cards.isEmpty {
                activateTimer = true
            }else {
                activateTimer = false
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)
        .onAppear(perform: resetCards)
    }
    
    func loadCards(){
        do {
            guard let savedData = UserDefaults.standard.data(forKey: saveKey) else {return}
            let decodedItem = try JSONDecoder().decode([Card].self, from: savedData)
            cards = decodedItem
        }catch{
            fatalError("Couldn't load cards")
        }
    }
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        
        if cards.isEmpty {
            activateTimer = false
        }
    }
    
    func resetCards() {
        timeRemaining = 100
        activateTimer = true
        loadCards()
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
