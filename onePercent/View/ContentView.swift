//
//  ContentView.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 14.05.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selection: Tab = .weekly
    @Query private var tasks: [Task]
    
    enum Tab {
        case daily
        case weekly
        case todo
        case profile
    }

    var body: some View {
        TabView(selection: $selection,
                content:  {
            DailyView().badge(numberOfDailiesLeft()).tabItem { Label("Daily", systemImage: "figure.stand") }.tag(Tab.daily)
            WeeklyView().tabItem { Label("Weekly", systemImage: "soccerball") }.tag(Tab.weekly)
            TodoView().tabItem { Label("To-Do", systemImage: "checklist.rtl") }.tag(Tab.todo)
            ProfileView().tabItem { Label("Profile", systemImage: "person.crop.circle") }.tag(Tab.profile)
        })
        .onAppear {
            UITabBarItem.appearance().badgeColor = .orange
        }
    }
    
    func numberOfDailiesLeft() -> Int {
        var count = 0
        for task in tasks {
            if task.category == .day {
                if !task.isDone {
                    count += 1
                }
            }
        }
        return count
    }
}

#Preview {
    ContentView()
}
