//
//  UserInfo.swift
//  CodableChallenge
//
//  Created by Mohanad Ramdan on 24/08/2023.
//

import Foundation

struct User: Codable{
    var age:Int , company:String, name:String, isActive: Bool ,id:String ,about:String, email:String
    var friends :[Friend]
    
}
struct Friend: Codable {
    var name:String, id:String
}
