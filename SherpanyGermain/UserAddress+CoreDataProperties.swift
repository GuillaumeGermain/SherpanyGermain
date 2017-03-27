//
//  UserAddress+CoreDataProperties.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 27.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension UserAddress {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserAddress> {
        return NSFetchRequest<UserAddress>(entityName: "UserAddress");
    }

    @NSManaged public var city: String?
    @NSManaged public var street: String?
    @NSManaged public var suite: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var addressOf: User?
    @NSManaged public var hasGeoLoc: UserAddressGeo?

}
