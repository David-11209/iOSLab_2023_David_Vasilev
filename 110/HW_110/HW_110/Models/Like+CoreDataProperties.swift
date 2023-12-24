//
//  Like+CoreDataProperties.swift
//  HW_110
//
//  Created by Давид Васильев on 13.12.2023.
//
//

import Foundation
import CoreData


extension Like {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Like> {
        return NSFetchRequest<Like>(entityName: "Like")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var photo: Photo?
    @NSManaged public var user: User?

}

extension Like : Identifiable {

}
