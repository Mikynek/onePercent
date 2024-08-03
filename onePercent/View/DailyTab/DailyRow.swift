//
//  DailyRow.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 19.05.2024.
//

import SwiftUI

struct DailyRow: View {
    @State var task: Task
    private let maxDescriptionLength: Int = 72
    
    var body: some View {
        let isDescriptionAvailable = !task.desc!.isEmpty
        
        HStack {
            Toggle(isOn: $task.isDone) {
                if isDescriptionAvailable {
                    taskDescriptionView
                } else {
                    HStack {
                        Text(task.name)
                            .strikethrough(task.isDone)
                        Spacer()
                    }
                }
            }
            .toggleStyle(CheckboxToggleStyle())
            .padding()
            .background(!task.isDone ? Color.orange : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
            .background(
                NavigationLink("", destination: TaskDetail(task: $task))
                    .opacity(0)
            )
            .onChange(of: task.isDone) { oldValue, newValue in
                updateStreak(oldValue: oldValue, newValue: newValue)
            }
        }
    }
    
    private var taskDescriptionView: some View {
        VStack {
            HStack {
                Text(task.name)
                    .strikethrough(task.isDone)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.semibold)
                Spacer()
            }
            if task.desc!.count > maxDescriptionLength {
                Text(task.desc!.prefix(maxDescriptionLength) + "...")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text(task.desc!)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private func updateStreak(oldValue: Bool, newValue: Bool) {
        if newValue {
            task.streak += 1
        } else if oldValue {
            task.streak -= 1
        }
    }
}

//#Preview {
//    DailyRow()
//}
