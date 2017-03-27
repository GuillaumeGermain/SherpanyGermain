//
//  UserAddressGeo+CoreDataProperties.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 27.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension UserAddressGeo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserAddressGeo> {
        return NSFetchRequest<UserAddressGeo>(entityName: "UserAddressGeo");
    }

    @NSManaged public var lat: Float
    @NSManaged public var lng: Float
    @NSManaged public var belongsTo: UserAddress?

}
