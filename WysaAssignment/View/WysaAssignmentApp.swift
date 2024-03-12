//
//  WysaAssignmentApp.swift
//  WysaAssignment
//
//  Created by Palak on 11/03/24.
//

import SwiftUI

@main
struct WysaAssignmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
