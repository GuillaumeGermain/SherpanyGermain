//
//  User+CoreDataProperties.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 27.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var addressId: Int32
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var username: String?
    @NSManaged public var website: String?
    @NSManaged public var hasAlbum: NSSet?
    @NSManaged public var livesAt: UserAddress?
    @NSManaged public var published: NSSet?
    @NSManaged public var worksAt: UserCompany?

}

// MARK: Generated accessors for hasAlbum
extension User {

    @objc(addHasAlbumObject:)
    @NSManaged public func addToHasAlbum(_ value: Album)

    @objc(removeHasAlbumObject:)
    @NSManaged public func removeFromHasAlbum(_ value: Album)

    @objc(addHasAlbum:)
    @NSManaged public func addToHasAlbum(_ values: NSSet)

    @objc(removeHasAlbum:)
    @NSManaged public func removeFromHasAlbum(_ values: NSSet)

}

// MARK: Generated accessors for published
extension User {

    @objc(addPublishedObject:)
    @NSManaged public func addToPublished(_ value: UserPost)

    @objc(removePublishedObject:)
    @NSManaged public func removeFromPublished(_ value: UserPost)

    @objc(addPublished:)
    @NSManaged public func addToPublished(_ values: NSSet)

    @objc(removePublished:)
    @NSManaged public func removeFromPublished(_ values: NSSet)

}
