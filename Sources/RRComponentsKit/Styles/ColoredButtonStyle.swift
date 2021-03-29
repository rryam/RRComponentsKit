//
//  ColoredButtonStyle.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct ColoredButtonStyle: ButtonStyle {
    var backgroundColor: Color

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(weight: .semiBold, style: .title3)
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(backgroundColor.cornerRadius(Constants.cornerRadius))
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .padding([.top])
    }
}
