//
//  CardView.swift
//  Flashzilla
//
//  Created by Mohanad Ramdan on 16/09/2023.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var removel: (()->Void?)? = nil
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var colorBlind
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled

    @State var habtice = UINotificationFeedbackGenerator()
    @State var showAnswer = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    colorBlind
                    ?.white
                    :.white.opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    colorBlind
                    ?nil
                    :RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width>0 ? .green:.red)
                )
                .shadow(radius: 10)
            VStack {
                if voiceOverEnabled {
                    Text(showAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }else{
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                
                    if showAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 2, y: 0)
        .opacity(3 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged{ point in
                    offset = point.translation
                    habtice.prepare()
                }
                .onEnded{_ in
                    if abs(offset.width)>100{
                        if offset.width<0{
                            habtice.notificationOccurred(.error)
                        }
                        removel?()
                    } else{
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            showAnswer.toggle()
        }
        .animation(.spring(), value: offset)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
