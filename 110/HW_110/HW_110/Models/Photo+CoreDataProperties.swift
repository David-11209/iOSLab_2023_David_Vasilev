//
//  Photo+CoreDataProperties.swift
//  HW_110
//
//  Created by Давид Васильев on 13.12.2023.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var comment: String?
    @NSManaged public var date: Date
    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var like: Like?
    @NSManaged public var user: User?

}

extension Photo : Identifiable {

}
