//
//  DataController.swift
//  Bookworm
//
//  Created by Harsh Chaturvedi on 10/01/22.
//

import CoreData
import Foundation
import SwiftUI

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failer to load: \(error.localizedDescription)")
            }
        }
    }
}
