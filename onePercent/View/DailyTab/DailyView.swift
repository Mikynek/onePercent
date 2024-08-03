//
//  DailyView.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 14.05.2024.
//

import SwiftUI
import SwiftData

struct DailyView: View {
    @Environment(\.modelContext) private var context
    @Query private var tasks: [Task]
    @Query private var profile: [Profile]
    @State private var showingTaskAdding = false
    
    var body: some View {
        NavigationSplitView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    if tasks.filter({ $0.category == .day }).isEmpty {
                        Text("No daily tasks yet.")
                            .foregroundColor(.gray)
                            .italic()
                    } else {
                        ForEach(tasks) { task in
                            if task.category == .day {
                                DailyRow(task: task)
                                    .onChange(of: task.streak) {
                                        updateProfileStreak()
                                    }
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
                .navigationTitle("Daily Tasks")
                .sheet(isPresented: $showingTaskAdding,
                       content: {
                    NewTaskForm(startedCategory: .day, isPresented: $showingTaskAdding)
                })
                .toolbar {
                    StreakText(streak: profile.first?.streak ?? 0, doneToday: profile[0].doneToday)
                }
                .listStyle(.plain)
                
                AddTaskButton(showingTaskAdding: $showingTaskAdding)
            }
        } detail: {
            Text("Daily Tasks")
        }
        .onAppear {
            handleDayStart()
        }
    }
    
    func deleteTask(_ task: Task) {
        context.delete(task)
    }
    
    var allTasksCheckedToday: Bool {
        let dayTasks = tasks.filter { $0.category == .day }
        return dayTasks.allSatisfy { task in
            return task.isDone
        }
    }
    
    func handleDayStart() {
        if profile[0].hasDayStartPassed() {
            profile[0].doneToday = false
            
            for task in tasks {
                if task.category == .day {
                    task.isDone = false
                }
            }
            
            let currentDayStart = profile[0].dayStart
            let nextDayStart = Calendar.current.date(byAdding: .day, value: 1, to: currentDayStart)!
            profile[0].dayStart = nextDayStart
        }
    }
    
    func updateProfileStreak() {
        if allTasksCheckedToday, !profile[0].doneToday {
            profile[0].doneToday = true
            profile[0].streak += 1
        }
    }
}

//#Preview {
//    DailyView()
//}
