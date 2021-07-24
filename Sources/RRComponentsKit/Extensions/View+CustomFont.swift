//
//  View+CustomFont.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

extension Text {
    public func font(type: FontType =  .poppins, weight: FontWeight = .regular, style: UIFont.TextStyle = .body) -> Text {
        self.font(Font.custom(type.name + weight.name, size: UIFont.preferredFont(forTextStyle: style).pointSize))
    }
    
    public func font(type: FontType =  .montserrat, weight: FontWeight = .regular, size: CGFloat) -> Text {
        self.font(.custom(type.name + weight.name, size: size))
    }
}

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
