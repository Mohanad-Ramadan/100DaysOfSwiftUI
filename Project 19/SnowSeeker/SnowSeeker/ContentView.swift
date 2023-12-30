//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Mohanad Ramdan on 26/09/2023.
//

import SwiftUI

enum SortResort{
    case byName,byCountry
}

struct ContentView: View {
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var sortResorts = SortResort.byName
    @State private var searchText = ""
    
    var filterdResort: [Resort]{
        
        if searchText.trimmingCharacters(in: .whitespaces).isEmpty{
            return sortedResorts
        }else {
            return sortedResorts.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    var sortedResorts: [Resort] {
        switch sortResorts {
        case .byName:
            return resorts.sorted(by: {$0.name < $1.name})
        case .byCountry:
            return resorts.sorted(by: {$0.country < $1.country})
        }
    }
    
    var body: some View {
        NavigationStack{
            List(filterdResort){ resorts in
                NavigationLink{
                    ResortView(resorts: resorts)
                }label: {
                    HStack(spacing: 10){
                        Image(resorts.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40,height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1).opacity(0.5)
                            }
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 1,height: 30)
                            .foregroundColor(.black.opacity(0.6))
                        VStack(alignment: .leading) {
                            Text(resorts.name)
                                .font(.headline)
                            Text("\(resorts.runs) runs")
                                .foregroundColor(.secondary)
                        }
                    }
                    if favorites.contains(resorts) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .accessibilityLabel("This is a favorite resort")
                            .foregroundColor(.red)
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Menu {
                        Button(action: {
                            sortResorts = .byName
                        }) {
                            Label("Sort by name", systemImage: "character")
                        }
                        Button(action: {
                            sortResorts = .byCountry
                        }) {
                            Label("Sort by country", systemImage: "flag")
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.title3)
                    }
                }
            }
            
            .searchable(text: $searchText, prompt: "Search")
            .navigationTitle("Resorts:")
        }
        .environmentObject(favorites)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}

