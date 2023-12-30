//
//  EditCards.swift
//  Flashzilla
//
//  Created by Mohanad Ramdan on 18/09/2023.
//

import SwiftUI

struct EditCards: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = [Card]()
    @State private var showEditSheet = false
    @State private var promptText = ""
    @State private var answerText = ""
    
    let saveKey = "SaveUserDefaults"

    var body: some View {
        NavigationStack {
            List{
                Section {
                    TextField("Create new prompt", text: $promptText)
                    TextField("It's Answer", text: $answerText)
                }
                
                Button("Create", action: createCard)
                    .frame(maxWidth: .infinity)
                    .disabled(promptText.trimmingCharacters(in: .whitespaces).isEmpty || answerText.trimmingCharacters(in: .whitespaces).isEmpty)
                
                if !cards.isEmpty {
                    Section("Cards:") {
                        ForEach(cards) { card in
                            Text(card.prompt) + Text(" : ") + Text(card.answer)
                        }
                        .onDelete(perform: deleteCard)
                    }
                }else{
                    Section{
                        Text("No cards yet")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.secondary)
                            .opacity(0.6)
                    }
                    .listRowBackground(EmptyView())
                }
            }
            .navigationTitle("Add Cards:")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        
                    } label: {
                        Text("Edit")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
            .onAppear(perform: loadCards)
        }
    }
    
    func save(){
        do {
            let data = try JSONEncoder().encode(cards)
            UserDefaults.standard.set(data, forKey: saveKey)
        } catch {
            print("Unable to save data.")
        }
    }
    func createCard(){
        let newCard = Card(prompt: promptText, answer: answerText)
        cards.insert(newCard, at: 0)
        save()
        promptText = ""
        answerText = ""
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
    
    func deleteCard(at offsets: IndexSet){
        cards.remove(atOffsets: offsets)
        save()
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
