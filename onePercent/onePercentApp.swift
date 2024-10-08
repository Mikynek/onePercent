//
//  onePercentApp.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 14.05.2024.
//

import SwiftUI
import SwiftData

@main
struct onePercentApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Task.self,
            Profile.self
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
