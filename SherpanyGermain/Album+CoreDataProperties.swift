//
//  Album+CoreDataProperties.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 27.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Album {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
        return NSFetchRequest<Album>(entityName: "Album");
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var userId: Int32
    @NSManaged public var albumOf: User?
    @NSManaged public var hasPhoto: NSSet?

}

// MARK: Generated accessors for hasPhoto
extension Album {

    @objc(addHasPhotoObject:)
    @NSManaged public func addToHasPhoto(_ value: Photo)

    @objc(removeHasPhotoObject:)
    @NSManaged public func removeFromHasPhoto(_ value: Photo)

    @objc(addHasPhoto:)
    @NSManaged public func addToHasPhoto(_ values: NSSet)

    @objc(removeHasPhoto:)
    @NSManaged public func removeFromHasPhoto(_ values: NSSet)

}
