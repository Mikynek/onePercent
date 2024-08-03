//
//  BindingExtension.swift
//  onePercent
//
//  Created by Phil Dukhov
//  https://stackoverflow.com/questions/68543882/cannot-convert-value-of-type-bindingstring-to-expected-argument-type-bindi
//

import Foundation
import SwiftUI

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
