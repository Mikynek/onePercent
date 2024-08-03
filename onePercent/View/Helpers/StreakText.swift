//
//  StreakText.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 03.08.2024.
//

import SwiftUI

struct StreakText: View {
    @State var streak: Int
    @State var doneToday: Bool
    
    var body: some View {
        Text("\(streak) 🔥")
            .bold(doneToday)
    }
}

//#Preview {
//    StreakText()
//}
