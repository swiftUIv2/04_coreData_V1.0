//
//  coreData_V1_0App.swift
//  coreData_V1.0
//
//  Created by emm on 27/12/2020.
//

import SwiftUI

@main
struct coreData_V1_0App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
