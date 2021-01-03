//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by User11 on 2021/1/3.
//

import SwiftUI

@main
struct FinalProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
