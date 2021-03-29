//
//  Color.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

extension Color {
    static var gradientGray: Color {
        #if os(macOS)
        return Color(NSColor.black)
        #else
        return Color(UIColor.systemGray5)
        #endif
    }

    /// If the app is in dark mode, returns black, otherwise white. Opposite of .primary Color.
    static var traitsBackground: Color {
        Color(UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
        })
    }
}
