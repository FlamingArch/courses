//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Harsh Chaturvedi on 03/10/21.
//

import SwiftUI
import CoreData

enum Predicate: String {
    case equals = "=="
    case lessThanEquals = "<="
    case greaterThanEquals = ">="
    case inside = "in"
    case beginsWith = "BEGINSWITH", beginsWithCaseInsensitive = "BEGINSWITH[c]"
    case contains = "CONTAINS"
    case notEquals = "NOT =="
    case notLessThanEquals = "NOT <="
    case notGreaterThanEquals = "NOT >="
    case notInside = "NOT in"
    case notBeginsWith = "NOT BEGINSWITH", notBeginsWithCaseInsensitive = "NOTBEGINSWITH[c]"
    case notContains = "NOT CONTAINS"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var sortDescripters: [NSSortDescriptor]?
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterPredicate: Predicate = .beginsWith, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest =  FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescripters ?? [], predicate: NSPredicate(format: "%k \(filterPredicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
