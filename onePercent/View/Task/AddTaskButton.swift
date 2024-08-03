//
//  AddTaskButton.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 16.05.2024.
//

import SwiftUI

struct AddTaskButton: View {
    @Binding var showingTaskAdding: Bool
    
    var body: some View {
        Button(action: {
            showingTaskAdding.toggle()
        }) {
            Label("Add Task", systemImage: "plus.app.fill")
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        .cornerRadius(8)
        .padding(16)
    }
}

#Preview {
    AddTaskButton(showingTaskAdding: .constant(false))
}
