//
//  Location.swift
//  BucketList
//
//  Created by Mohanad Ramdan on 30/08/2023.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    var id = UUID()
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(name: "Buckingham Palace", description: "Where Queen Elizabeth lives with her dorgis.", latitude: 51.501, longitude: -0.141)
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
