//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Mohanad Ramdan on 27/09/2023.
//

import SwiftUI

struct ResortView: View {
    let resorts: Resort
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    @EnvironmentObject var favorites: Favorites

    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    var body: some View {
        GeometryReader {geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(spacing: 0) {
                        ZStack(alignment: .bottomTrailing) {
                            Image(decorative: resorts.id)
                                .resizable()
                                .scaledToFill()
                            Group {
                                Text("Taken by: ") +
                                Text(resorts.imageCredit)
                            }
                            .font(.system(size: 10))
                            .fontWeight(.light)
                            .padding(3)
                            .foregroundColor(.white.opacity(0.75))
                            .background(.secondary.opacity(0.7))
                            .cornerRadius(5,corners:.topLeft)
                        }
                        HStack {
                            if sizeClass == .compact && typeSize > .large {
                                VStack(spacing: 10) { ResortDetailsView(resorts: resorts) }
                                VStack(spacing: 10) { SkiDetailsView(resorts: resorts) }
                            } else {
                                ResortDetailsView(resorts: resorts)
                                SkiDetailsView(resorts: resorts)
                            }
                        }
                        .padding(.vertical)
                        .background(Color.secondary.opacity(0.2))
                    }
                    .frame(width: geo.size.width*0.95)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                        .padding([.top,.horizontal])
                    Group {
                        Text(resorts.description)
                            .padding(.vertical)
                        
                        Divider()
                        HStack{
                            Text("Facilities:")
                                .font(.headline)
                            ForEach(resorts.facilityTypes){ facility in
                                Button{
                                    showingFacility = true
                                    selectedFacility = facility
                                } label:{
                                    facility.icon
                                        .font(.title3)
                                }
                            }
                            
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                }
                Button(favorites.contains(resorts) ? "Remove from Favorites" : "Add to Favorites") {
                    if favorites.contains(resorts) {
                        favorites.remove(resorts)
                    } else {
                        favorites.add(resorts)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            
        }
        .navigationTitle("\(resorts.name), \(resorts.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in } message: {Text($0.description)}
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ResortView(resorts: Resort.example)
        }
        .environmentObject(Favorites())
    }
}
