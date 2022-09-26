//
//  Extension.swift
//  xiezi
//
//  Created by Marc Intha on 28/09/2022.
//

import Foundation
import SwiftUI

public extension Color {
    static let background = Color(NSColor.windowBackgroundColor)
    static let secondaryBackground = Color(NSColor.underPageBackgroundColor)
    static let tertiaryBackground = Color(NSColor.controlBackgroundColor)
    
    // Generate random color, imported from Apple snippet which can be found below
    //
    // @link: https://developer.apple.com/tutorials/sample-apps/recognizinggestures
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0.5...1),
            green: Double.random(in: 0.5...1),
            blue: Double.random(in: 0.5...1)
        )
    }
}

public extension Array {
    func get(index: Int) -> Element? {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return nil
        }
    }
}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
