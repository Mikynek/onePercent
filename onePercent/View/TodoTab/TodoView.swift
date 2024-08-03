//
//  TodoView.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 16.05.2024.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    @Environment(\.modelContext) private var context
    @Query private var tasks: [Task]
    @State private var showingTaskAdding = false
    
    var body: some View {
        NavigationSplitView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    if tasks.filter({ $0.category == .todo }).isEmpty {
                        Text("No to-do tasks yet.")
                            .foregroundColor(.gray)
                            .italic()
                    } else {
                        ForEach(tasks) { task in
                            if task.category == .todo {
                                TodoRow(task: task)
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
                .navigationTitle("To-Do List")
                .sheet(isPresented: $showingTaskAdding,
                       content: {
                    NewTaskForm(startedCategory: .todo, isPresented: $showingTaskAdding)
                })
                .listStyle(.plain)
                
                AddTaskButton(showingTaskAdding: $showingTaskAdding)
            }
        } detail: {
            Text("To-Do List")
        }
    }
    
    func deleteTask(_ task: Task) {
        context.delete(task)
    }
}

//#Preview {
//    TodoView()
//}
