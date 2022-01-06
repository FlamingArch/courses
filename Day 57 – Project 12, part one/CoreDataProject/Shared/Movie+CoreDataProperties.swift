//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Harsh Chaturvedi on 20/09/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        return title ?? "Unknown Title"
    }
}

extension Movie : Identifiable {

}
