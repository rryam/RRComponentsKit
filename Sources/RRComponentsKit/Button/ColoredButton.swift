//
//  ColoredButton.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct ColoredButton: View {
    private var title: String
    private var font: UIFont.TextStyle = .headline
    private var backgroundColor: Color
    private var action: () -> ()

    public init(title: String, font: UIFont.TextStyle = .headline, background: Color, action: @escaping () -> Void) {
        self.font = font
        self.title = title
        self.action = action
        self.backgroundColor = background
    }

    public var body: some View {
        Button(action: withAnimation { action }, label: {
            Text(title)
                .kerning(1.0)
                .font(weight: .bold, style: font)
        })
        .buttonStyle(ColoredButtonStyle(backgroundColor: backgroundColor))
    }
}

struct ColoredButton_Previews: PreviewProvider {
    static var previews: some View {
        ColoredButton(title: "Evaluate", background: .secondary, action: {})
    }
}
