//
//  ContentView.swift
//  MilstoneChallenge
//
//  Created by Mohanad Ramdan on 03/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State var showingSheet = false
    var body: some View {
        NavigationView{
            ZStack {
                List {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                    
                }
                PlusEdgedButton(color: .accentColor)
            }
            .navigationTitle("Image List")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlusEdgedButton: View {
    @State var color: Color
    var body: some View{
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink {
                    ImageImportView()
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .background(color.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
            }
        }
    }
}

