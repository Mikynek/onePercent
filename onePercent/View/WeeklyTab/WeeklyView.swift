//
//  WeeklyView.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 14.05.2024.
//

import SwiftUI
import SwiftData

struct WeeklyView: View {
    @Environment(\.modelContext) private var context
    @Query private var profile: [Profile]
    @Query private var tasks: [Task]
    @State private var showingTaskAdding = false
    
    var body: some View {
        NavigationSplitView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    if tasks.filter({ $0.category == .week }).isEmpty {
                        Text("No weekly goals yet.")
                            .foregroundColor(.gray)
                            .italic()
                    } else {
                        ForEach(tasks) { task in
                            if task.category == .week {
                                WeeklyRow(task: task)
                            }
                        }
                        .onDelete { indexes in
                            for index in indexes {
                                deleteTask(tasks[index])
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowSpacing(2)
                    }
                }
                .navigationTitle("Weekly Goals")
                .sheet(isPresented: $showingTaskAdding,
                       content: {
                    NewTaskForm(startedCategory: .week, isPresented: $showingTaskAdding)
                })
                .listStyle(.plain)
                
                AddTaskButton(showingTaskAdding: $showingTaskAdding)
            }
        } detail: {
            Text("Weekly Goals")
        }
        .onAppear {
            initializeProfile()
            handleWeekStart()
        }
    }
    
    func deleteTask(_ task: Task) {
        context.delete(task)
    }
    
    private func initializeProfile() {
        // Ensure profile is only created and inserted once
        if profile.first == nil {
            let newProfile = Profile(username: "Host", bio: "")
            context.insert(newProfile)
        }
    }
    
    func handleWeekStart() {
        if profile.first != nil {
            if profile[0].hasWeekStartPassed() {
                for task in tasks {
                    if task.category == .week {
                        task.weeklyTimesDone = 0
                    }
                }
                
                let calendar = Calendar.current
                let today = calendar.startOfDay(for: Date.now)
                let weekday = calendar.component(.weekday, from: today)
                var daysUntilMonday = (9 - weekday) % 7
                if daysUntilMonday == 0 { daysUntilMonday = 7 }
                profile[0].weekStart = calendar.date(byAdding: .day, value: daysUntilMonday, to: today)!
            }
        }
    }
}

//#Preview {
//    WeeklyView()
//}
