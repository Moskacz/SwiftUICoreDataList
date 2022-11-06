//
//  SwiftUICoreDataListApp.swift
//  SwiftUICoreDataList
//
//  Created by Michal Moskala on 06/11/2022.
//

import SwiftUI

@main
struct SwiftUICoreDataListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
