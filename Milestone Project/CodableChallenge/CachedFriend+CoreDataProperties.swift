//
//  CachedFriend+CoreDataProperties.swift
//  CodableChallenge
//
//  Created by Mohanad Ramdan on 25/08/2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
    public var wrappedId: String {
        id ?? "\(UUID())"
    }
    public var wrappedName: String{
        name ?? "Unknown"
    }

}

extension CachedFriend : Identifiable {

}
