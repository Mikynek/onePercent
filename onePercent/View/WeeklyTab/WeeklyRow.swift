//
//  WeeklyRow.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 19.05.2024.
//

import SwiftUI

struct WeeklyRow: View {
    @State var task: Task
    private let maxDescriptionLength: Int = 72
    
    var body: some View {
        let isDescriptionAvailable = !task.desc!.isEmpty
        
        HStack {
            Button(action: {
                task.weeklyTimesDone += 1
            }) {
                Label("TaskDoneCounterIncrement", systemImage: "plus.app")
                    .labelStyle(.iconOnly)
                    .font(.system(size: 24))
            }
            .buttonStyle(BorderlessButtonStyle())
            Spacer()
            if isDescriptionAvailable {
                taskDescriptionView
            } else {
                taskNameAndCountView
            }
        }
        .padding()
        .background(task.frequency > task.weeklyTimesDone ? Color.blue : Color.orange)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
    
    private var taskNameAndCountView: some View {
        HStack {
            Text(task.name)
                .strikethrough(task.isDone)
            Spacer()
            Text("\(task.weeklyTimesDone)/\(task.frequency)")
                .bold()
        }
        .background(
            NavigationLink("", destination: TaskDetail(task: $task))
                .opacity(0)
        )
    }
    
    private var taskDescriptionView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(task.name)
                    .strikethrough(task.isDone)
                    .fontWeight(.semibold)
                Spacer()
                Text("\(task.weeklyTimesDone)/\(task.frequency)")
                    .bold()
            }
            if task.desc!.count > maxDescriptionLength {
                Text(task.desc!.prefix(maxDescriptionLength) + "...")
                    .font(.caption)
            } else {
                Text(task.desc!)
                    .font(.caption)
            }

        }
        .background(
            NavigationLink("", destination: TaskDetail(task: $task))
                .opacity(0)
        )
    }
}
