//
//  TodoRow.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 16.05.2024.
//

import SwiftUI

struct TodoRow: View {
    @State var task: Task
    private let maxDescriptionLength: Int = 72
    
    var body: some View {
        let isDescriptionAvailable = !task.desc!.isEmpty
        
        HStack {
            Toggle(isOn: $task.isDone) {
                if isDescriptionAvailable {
                    taskDescriptionView
                } else {
                    Text(task.name)
                        .strikethrough(task.isDone)
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
        }
    }
    
    private var taskDescriptionView: some View {
        VStack {
            Text(task.name)
                .strikethrough(task.isDone)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.semibold)
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
}

//#Preview {
//    TodoRow(task: task)
//}
