//
//  View+CustomFont.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

#if os(iOS)
extension Text {
    public func font(type: FontType, weight: FontWeight, style: UIFont.TextStyle) -> Text {
        self.font(Font.custom(type.name + weight.name, size: UIFont.preferredFont(forTextStyle: style).pointSize))
    }
    
    public func font(type: FontType, weight: FontWeight, size: CGFloat) -> Text {
        self.font(.custom(type.name + weight.name, size: size))
    }
}
#endif

#if os(macOS)
extension Text {
    public func font(type: FontType, weight: FontWeight, style: NSFont.TextStyle) -> Text {
        self.font(Font.custom(type.name + weight.name, size: NSFont.preferredFont(forTextStyle: style).pointSize))
    }
    
    public func font(type: FontType, weight: FontWeight, size: CGFloat) -> Text {
        self.font(.custom(type.name + weight.name, size: size))
    }
}
#endif

public enum FontType: String {
    case montserrat
    case josefinSans
    case poppins
    case openSans

    var name: String {
        self.rawValue.capitalized
    }
}

public enum FontWeight: String {
    case light
    case medium
    case semiBold
    case extraLight
    case thin
    case extraBold
    case regular
    case bold
    case lightItalic
    case boldItalic
    case black

    var name: String {
        "-" + self.rawValue.capitalized
    }
}
