//
//  fblamobileappApp.swift
//  fblamobileapp
//
//  Created by Hannah You on 2/24/25.
//

import SwiftUI
import SwiftData

@main
struct fblamobileappApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            UserProfile.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
