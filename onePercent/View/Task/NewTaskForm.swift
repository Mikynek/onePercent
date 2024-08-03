//
//  NewTaskForm.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 16.05.2024.
//

import SwiftUI

struct NewTaskForm: View {
    @Environment(\.modelContext) private var context
    @Binding var isPresented: Bool
    
    @State private var taskName = ""
    @State private var taskDescription = ""
    @State private var selectedCategory: Task.Category
    @State private var selectedFrequency = 1
    
    var startedCategory: Task.Category
    
    init(startedCategory: Task.Category, isPresented: Binding<Bool>) {
        self.startedCategory = startedCategory
        self._isPresented = isPresented
        _selectedCategory = State(initialValue: startedCategory)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create New Task")
                .font(.largeTitle)
                .bold()
            TextField("Task Name", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Description", text: $taskDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Category:")
                .font(.headline)
            
            HStack {
                ForEach(Task.Category.allCases, id: \.self) { category in
                    Spacer()
                    Button(action: {
                        self.selectedCategory = category
                    }) {
                        Text(category.rawValue)
                            .padding()
                            .background(self.selectedCategory == category ? Color.orange : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Spacer()
                }
            }
            
            if selectedCategory == .week {
                Text("Frequency:")
                    .font(.headline)
                
                Picker(selection: $selectedFrequency, label: Text("Frequency")) {
                    ForEach(1..<8) { number in
                        Text("\(number)")
                            .tag(number)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            HStack {
                Spacer()
                Button("Add Task") {
                    addTask()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
    
    func addTask() {
        let task = Task(name: taskName, desc: taskDescription, category: selectedCategory, frequency: selectedFrequency)
        context.insert(task)
        isPresented = false
    }
}

//#Preview {
//    NewTaskForm(startedCategory: .week, showingTaskAdding: true)
//}
