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
}
