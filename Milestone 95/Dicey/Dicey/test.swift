//
//  test.swift
//  Dicey
//
//  Created by Mohanad Ramdan on 24/09/2023.
//

import SwiftUI

struct test: View {
    @State var test = 6
    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size
                HStack {
                    DiceView(diceNum: $test)
                        .padding()
                    DiceView(diceNum: $test)
                        .padding()

                }
                .frame(width: size.width, height: size.height)
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
