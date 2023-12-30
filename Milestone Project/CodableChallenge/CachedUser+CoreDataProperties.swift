//
//  CachedUser+CoreDataProperties.swift
//  CodableChallenge
//
//  Created by Mohanad Ramdan on 25/08/2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var email: String?
    @NSManaged public var about: String?
    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var friend: NSSet?
    
    func convertToUser(){
        
        let wrappedId = id ?? "Unknown ID"
        let wrappedName = name ?? "Unknown Name"
        let wrappedCompany = company ?? "Unknown Company"
        let wrappedEmail = email ?? "Unknown Email"
        let wrappedAbout = about ?? "No about"
        var wrappedFriend: [CachedFriend] {
            let friendSet = friend as? Set<CachedFriend> ?? []
            map.
        }
    }
    
}

// MARK: Generated accessors for friend
extension CachedUser {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: CachedFriend)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: CachedFriend)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
