//
//  DiceView.swift
//  Dicey
//
//  Created by Mohanad Ramdan on 24/09/2023.
//

import SwiftUI

struct DiceAndRollsView: View{
    let dice1: Int
    let dice2: Int
    let totalRolled: Int
    
    var body: some View{
        HStack {
            VStack {
                DiceView(diceNum: dice1)
                    .padding([.top,.horizontal])
                Spacer(minLength: 20)
                Text("Dice: 1")
                    .bold()
                    .frame(width: 80,height: 25)
                    .background(.white.opacity(0.7))
                    .clipShape(Capsule())
                RoundedRectangle(cornerRadius: 50)
                    .frame(height: 1)
                    .foregroundColor(.white.opacity(0.5))
                    .frame(width: 60)
                HStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 2)
                        .foregroundColor(.white.opacity(0.8))
                        .frame(height: 20)
                    Spacer(minLength: 4)
                    
                    // code to come
                    // make it appear after first roll
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<5){_ in
                                Text("\(totalRolled)")
                                    .font(.subheadline)
                                    .frame(width: 25,height: 25)
                                    .background(.white.opacity(0.7))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                .frame(width: 110,height: 30)
                Spacer()
                
            }
            VStack {
                DiceView(diceNum: dice2)
                    .padding([.top,.horizontal])
                Spacer(minLength: 20)
                Text("Dice: 1")
                    .bold()
                    .frame(width: 80,height: 25)
                    .background(.white.opacity(0.7))
                    .clipShape(Capsule())
                RoundedRectangle(cornerRadius: 50)
                    .frame(height: 1)
                    .foregroundColor(.white.opacity(0.5))
                    .frame(width: 60)
                HStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 2)
                        .foregroundColor(.white.opacity(0.8))
                        .frame(height: 20)
                    Spacer(minLength: 4)
                    
                    // code to come
                    // make it appear after first roll
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<5){_ in
                                Text("\(totalRolled)")
                                    .font(.subheadline)
                                    .frame(width: 25,height: 25)
                                    .background(.white.opacity(0.7))
                                    .clipShape(Capsule())
                            }
                        }
                    }
                }
                .frame(width: 110,height: 30)
                Spacer()
            }
        }
    }
}

struct DiceAndRollsView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

struct DiceView: View {
    let diceNum: Int
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 17)
                .foregroundColor(.white)
                .shadow(radius: 10)
            
            if diceNum == 0 {
                Text("Roll")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }else{
                Image("\(diceNum)")
                    .resizable()
            }
            
        }
        .frame(width: 150, height: 150)
    }
}
