//
//  Persistence.swift
//  SwiftUICoreDataList
//
//  Created by Michal Moskala on 06/11/2022.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "SwiftUICoreDataList")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _, _ in })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
