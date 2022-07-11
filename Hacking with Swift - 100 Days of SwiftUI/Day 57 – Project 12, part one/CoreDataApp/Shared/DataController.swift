//
//  DataController.swift
//  CoreDataApp
//
//  Created by Harsh Chaturvedi on 27/01/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData Failed to Load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
