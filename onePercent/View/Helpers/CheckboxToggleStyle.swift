//
//  CheckboxToggleStyle.swift
//  onePercent
//
//  Created by Team Kodeco
//  https://www.kodeco.com/books/swiftui-cookbook/v1.0/chapters/2-create-a-checkbox-in-swiftui
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    HStack {
      Image(systemName: configuration.isOn ? "checkmark.square" : "square")
        .resizable()
        .frame(width: 24, height: 24)
        .onTapGesture { configuration.isOn.toggle() }
        configuration.label
        Spacer()
    }
  }
}
