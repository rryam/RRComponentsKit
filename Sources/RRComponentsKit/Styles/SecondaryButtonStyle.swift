//
//  SecondaryButtonStyle.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 13/07/21.
//

import SwiftUI

public struct SecondaryButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke(LinearGradient(colors: [Color.accentColor, Color.accentColor.opacity(0.5)], startPoint: .top, endPoint: .bottom), lineWidth: 1))
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .padding(.top)
    }
}
