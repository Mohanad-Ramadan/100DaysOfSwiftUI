//
//  ContentView.swift
//  CoreDataLearn
//
//  Created by Mohanad Ramdan on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State var nameFilter = "A"
    
    var body: some View {
        VStack {
            FilterData(filter: nameFilter){ (home:Home) in
                Section(home.person){
                    Text("Use a Phone from \(home.hisPhone) compeny")
                }
            }
            Divider()
            HStack {
                Button {
                    let mohanad = Home(context: moc)
                    mohanad.unrappedPerson = "Mohanad"
                    mohanad.unrappedHisPhone = "Apple"
                    let amr = Home(context: moc)
                    amr.unrappedPerson = "Amr"
                    amr.unrappedHisPhone = "Apple"
                    let mama = Home(context: moc)
                    mama.unrappedPerson = "Randa"
                    mama.unrappedHisPhone = "Oppo"
                    
                } label: {
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(15)
                }
                Button {
                    do{
                        try moc.save()
                    }catch{
                        print("Can't save coreData: \(error)")
                    }
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(15)
                }
            }
            HStack{
                Button{
                    nameFilter = "a"
                } label: {
                    Text("Filter 1")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                }

                Button{
                    nameFilter = "r"
                } label: {
                    Text("Filter 2")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .cornerRadius(15)
                }
            }
        }
        .padding()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
