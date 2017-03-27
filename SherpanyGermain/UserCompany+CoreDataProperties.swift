//
//  UserCompany+CoreDataProperties.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 27.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension UserCompany {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCompany> {
        return NSFetchRequest<UserCompany>(entityName: "UserCompany");
    }

    @NSManaged public var bs: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var name: String?
    @NSManaged public var hasEmployee: NSSet?

}

// MARK: Generated accessors for hasEmployee
extension UserCompany {

    @objc(addHasEmployeeObject:)
    @NSManaged public func addToHasEmployee(_ value: User)

    @objc(removeHasEmployeeObject:)
    @NSManaged public func removeFromHasEmployee(_ value: User)

    @objc(addHasEmployee:)
    @NSManaged public func addToHasEmployee(_ values: NSSet)

    @objc(removeHasEmployee:)
    @NSManaged public func removeFromHasEmployee(_ values: NSSet)

}
