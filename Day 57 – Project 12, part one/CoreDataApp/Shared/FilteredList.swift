//
//  FilteredList.swift
//  CoreDataApp (iOS)
//
//  Created by Harsh Chaturvedi on 04/02/22.
//

import SwiftUI
import CoreData

enum Predicate {
    case BEGINSWITH
}

/// # Dynamically filtering @FetchRequest with SwiftUI
struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id:\.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, predicate: String = "BEGINSWITH", sortDescriptors: [NSSortDescriptor] = [], @ViewBuilder content: @escaping (T)->Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate) %@", filterKey, filterValue))
        self.content = content
    }
    
    
    init(filterKey: String, filterValue: String, predicate: Predicate = .BEGINSWITH, sortDescriptors: [NSSortDescriptor] = [], @ViewBuilder content: @escaping (T)->Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate) %@", filterKey, filterValue))
        self.content = content
    }
}
