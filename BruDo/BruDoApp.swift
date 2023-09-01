//
//  BruDoApp.swift
//  BruDo
//
//  Created by 정현 on 2023/09/01.
//

import SwiftUI

@main
struct BruDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
