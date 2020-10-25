//
//  User+CoreDataProperties.swift
//  FirstCare
//
//  Created by alireza azimi on 2020-10-25.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var uid: String?

}

extension User : Identifiable {

}
