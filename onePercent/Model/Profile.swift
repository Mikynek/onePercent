//
//  Profile.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 15.05.2024.
//

import Foundation
import SwiftData

@Model
final class Profile: Identifiable {
    var id: String
    var username: String
    var bio: String
    var created: Date
    var dayStart: Date
    var weekStart: Date
    var streak: Int
    var doneToday: Bool
    
    init(username: String, bio: String) {
        self.id = UUID().uuidString
        self.username = username
        self.bio = bio
        self.created = Date.now
        self.dayStart = Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: Date.now))!
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date.now)
        let weekday = calendar.component(.weekday, from: today)
        var daysUntilMonday = (9 - weekday) % 7
        if daysUntilMonday == 0 { daysUntilMonday = 7 }
        self.weekStart = calendar.date(byAdding: .day, value: daysUntilMonday, to: today)!
                
        self.streak = 0
        self.doneToday = false
    }
    
    func hasDayStartPassed() -> Bool {
        return Date.now >= dayStart
    }
    
    func hasWeekStartPassed() -> Bool {
        return Date.now >= weekStart
    }
}
