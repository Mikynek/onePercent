//
//  FireAnimation.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 19.05.2024.
//

import SwiftUI

struct FireAnimation: View {
    @State private var animate = false

    var body: some View {
        Text("🔥")
            .font(.title)
            .scaleEffect(animate ? 1.2 : 1.0)
            .opacity(animate ? 1.0 : 0.5)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                    animate.toggle()
                }
            }
    }
}
