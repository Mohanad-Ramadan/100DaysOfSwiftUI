//
//  PersonInfo.swift
//  CodableChallenge
//
//  Created by Mohanad Ramdan on 24/08/2023.
//

import SwiftUI

struct PersonInfo: View {
    
    let person: User
    
    var body: some View {
        Form{
            Section("Name:"){
                Text(person.name)
            }
            Section("Details:"){
                Text("Age: \(person.age)")
                Text("Company: \(person.company)")
            }
            Section("About:"){
                Text(person.about)
                    .multilineTextAlignment(.leading)
            }
            Section("friends:"){
                ForEach(person.friends, id: \.id){friend in
                    Text(friend.name)
                }
            }
            
        }
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct PersonInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonInfo()
//    }
//}
