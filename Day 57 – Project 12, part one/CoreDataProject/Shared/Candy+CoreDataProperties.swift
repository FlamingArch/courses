//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Harsh Chaturvedi on 03/10/21.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

}

extension Candy : Identifiable {
    public var wrappedValue: String {
        name ?? "Unknown Candy"
    }
}
