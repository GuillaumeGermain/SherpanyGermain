//
//  UserPost+CoreDataProperties.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 27.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension UserPost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPost> {
        return NSFetchRequest<UserPost>(entityName: "UserPost");
    }

    @NSManaged public var body: String?
    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var userId: Int32
    @NSManaged public var publishedBy: User?

}
