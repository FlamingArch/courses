//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Harsh Chaturvedi on 03/10/21.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest =  FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%k BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
