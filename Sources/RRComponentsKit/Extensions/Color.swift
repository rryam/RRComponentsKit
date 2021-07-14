//
//  Color.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public extension Color {
    init(red: Int, green: Int, blue: Int) {
        let red = Double(red) / 255
        let green = Double(green) / 255
        let blue = Double(blue) / 255
        
        self.init(red: red, green: green, blue: blue, opacity: 1.0)
    }
    
    init(hex: Int) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF)
    }
}

public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let red = CGFloat(red) / 255
        let green = CGFloat(green) / 255
        let blue = CGFloat(blue) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


public extension Color {
    static var gradientGray: Color {
#if os(macOS)
        return Color(NSColor.black)
#else
        return Color(UIColor.systemGray5)
#endif
    }
    
    static var secondaryBackground: Color {
#if os(macOS)
        return Color(NSColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0))
#else
        return Color(UIColor.systemGray6)
#endif
    }
    
    /// If the app is in dark mode, returns black, otherwise white. Opposite of .primary Color.
    static var traitsBackground: Color {
        Color(UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
        })
    }
    
    static var ringBackground: Color {
        let darkRingBackgroundColor = UIColor(red: 27, green: 27, blue: 32)
        let lightRingBackgroundColor = UIColor(red: 200, green: 200, blue: 20)
        
        return Color(UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? darkRingBackgroundColor : lightRingBackgroundColor
        })
    }
    
    static let stroke = Color.primary.opacity(0.1)
}

// Returns a darker shade of the given color in light mode, and light share in dark mode
public extension Color {
    func prominence(_ value: Double = 0.2) -> Color {
        @Environment(\.colorScheme) var colorScheme: ColorScheme
        
        let prominenceValue = colorScheme == .light ? value : -value
        
        let components = UIColor(self).cgColor.components
        let red: CGFloat = components?[0] ?? 0.0
        let green: CGFloat = components?[1] ?? 0.0
        let blue: CGFloat = components?[2] ?? 0.0
        
        return Color(red: red - prominenceValue, green: green - prominenceValue, blue: blue - prominenceValue)
    }
}
