//
//  PrimaryButtonStyle.swift
//  onePercent
//
//  Created by Jakub Mikyšek on 20.05.2024.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
