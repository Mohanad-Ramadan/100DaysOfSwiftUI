//
//  Home+CoreDataProperties.swift
//  CoreDataLearn
//
//  Created by Mohanad Ramdan on 22/08/2023.
//
//

import Foundation
import CoreData


extension Home {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Home> {
        return NSFetchRequest<Home>(entityName: "Home")
    }

    @NSManaged public var unrappedPerson: String?
    @NSManaged public var unrappedHisPhone: String?
    
    var person: String{
        unrappedPerson ?? "Unknown"
    }
    var hisPhone: String{
        unrappedHisPhone ?? "Unknown"
    }
    
}

extension Home : Identifiable {

}
