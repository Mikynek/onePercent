//
//  StreakViewModel.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 20.05.2024.
//

import Foundation
import SwiftUI
import SwiftData

struct StreakViewModel {
    @Query private var tasks: [Task]
    @Query private var profile: [Profile]
    
    var allTasksCheckedToday: Bool {
        let dayTasks = tasks.filter { $0.category == .day }
        return dayTasks.allSatisfy { task in
            return task.isDone
        }
    }
    
    mutating func updateProfileStreak() {
        if allTasksCheckedToday {
            profile[0].doneToday = true
            profile[0].streak += 1
        }
    }
}
