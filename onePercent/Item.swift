//
//  Item.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 14.05.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
