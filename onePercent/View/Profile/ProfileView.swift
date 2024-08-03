//
//  ProfileView.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 15.05.2024.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @Environment(\.modelContext) private var context
    @Query private var profile: [Profile]
    @State private var username: String = ""
    @State private var bio: String = ""
    @State private var dayStart: Date = Date()

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Profile Information")) {
                    TextField("Username", text: $username)
                        .onChange(of: username) { _, newValue in
                            if let profile = profile.first {
                                profile.username = newValue
                                try? context.save()
                            }
                        }
                    TextField("Bio", text: $bio)
                        .onChange(of: bio) { _, newValue in
                            if let profile = profile.first {
                                profile.bio = newValue
                                try? context.save()
                            }
                        }
                }
                
                HStack {
                    Text("Streak")
                    Spacer()
                    StreakText(streak: profile[0].streak, doneToday: profile[0].doneToday)
                }
                
                Section {
                    DatePicker("Reset Time", selection: $dayStart, displayedComponents: .hourAndMinute)
                        .onChange(of: dayStart) { _, newValue in
                            if let profile = profile.first {
                                profile.dayStart = newValue
                                try? context.save()
                            }
                        }
                }
            }
            .onAppear {
                username = profile[0].username
                bio = profile[0].bio
                dayStart = profile[0].dayStart
            }
        }
    }
}
