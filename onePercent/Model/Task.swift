//
//  Task.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 14.05.2024.
//

import Foundation
import SwiftData

@Model
final class Task: Identifiable {
    var id: String
    var name: String
    var desc: String?
    var category: Category
    var streak: Int
    var frequency: Int
    var isDone: Bool
    var weeklyTimesDone: Int
    
    enum Category: String, CaseIterable, Codable {
        case day = "Daily"
        case week = "Weekly"
        case todo = "To-Do"
    }
    
    init(name: String, desc: String?, category: Category, frequency: Int) {
        self.id = UUID().uuidString
        self.name = name
        self.desc = desc
        self.category = category
        self.streak = 0
        self.frequency = frequency
        self.isDone = false
        self.weeklyTimesDone = 0
    }
}
