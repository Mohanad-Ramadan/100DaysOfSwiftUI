//
//  ContentView.swift
//  CodableChallenge
//
//  Created by Mohanad Ramdan on 24/08/2023.
//

import SwiftUI


struct ContentView: View {
    @State private var user = [User]()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name)
    ]) var cachedUser: FetchedResults<CachedUser>
    
    var body: some View {
        List(user, id:\.id){ users in
            NavigationLink{
                PersonInfo(person: users)
            } label: {
                    VStack(alignment: .leading){
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 10))
                                .foregroundColor(users.isActive ? .green : .red)
                            Text(users.name)
                        }
                        Text("- email: \(users.email)")
                            .fontWeight(.ultraLight)
                            .font(.caption)
                            .padding(.leading)
                    }
            }
        }
        .task{
            if user.isEmpty{
                await getURL()
                await MainActor.run{
                    
                }
            } else{
                return
            }
        }
        .navigationTitle("People")
    }
    
    func getURL() async  {
        let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: urlString ) else {
            fatalError()
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let recivingData = try? JSONDecoder().decode([User].self, from: data){
                user = recivingData
                
                
            }
        } catch {
            fatalError("oh shit something ocure")
        }
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            ContentView()
//        }
//    }
//}
