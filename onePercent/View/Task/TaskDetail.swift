//
//  TaskDetail.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 16.05.2024.
//

import SwiftUI

struct TaskDetail: View {
    @Binding var task: Task
    
    var body: some View {
        List {
            taskNameField
            taskDescriptionField
            categoryButtons
            frequencyPickerIfNeeded
            weekTasksDone
            streakViewer
        }
    }
    
    private var taskNameField: some View {
        HStack {
            Text("Task Name")
            Spacer()
            TextField("Task Name", text: $task.name)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.trailing)
        }
    }
    
    private var taskDescriptionField: some View {
        HStack {
            Text("Task Description")
            Spacer()
            if task.desc!.count > 20 {
                TextEditor(text: $task.desc.toUnwrapped(defaultValue: ""))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.trailing)
                    .frame(minHeight: 100, maxHeight: 300)
            } else {
                TextField("Task Description", text: $task.desc.toUnwrapped(defaultValue: ""))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
    
    private var categoryButtons: some View {
        Picker(selection: $task.category, label: Text("Frequency")) {
            ForEach(Task.Category.allCases, id: \.self) { category in
                Text("\(category.rawValue)").tag(category.rawValue)
                    .font(.largeTitle)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .font(.largeTitle)
    }
    
    private var frequencyPickerIfNeeded: some View {
        Group {
            if task.category == .week {
                VStack {
                    HStack {
                        Text("Frequency:")
                            .font(.subheadline)
                        Spacer()
                    }
                    
                    Picker(selection: $task.frequency, label: Text("Frequency")) {
                        ForEach(1..<8) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
        }
    }
    
    private var weekTasksDone: some View {
        Group {
            if task.category == .week {
                HStack {
                    Text("Times Done for this Week")
                    Spacer()
                    Text("\(task.weeklyTimesDone)")
                        .foregroundColor(.secondary)
                        .bold()
                }
            }
        }
    }
    
    private var streakViewer: some View {
        Group {
            if task.category == .day {
                HStack {
                    Text("Streak")
                    Spacer()
                    StreakText(streak: task.streak, doneToday: task.isDone)
                }
            }
        }
    }
}

//#Preview {
//    TaskDetail()
//}
