//
//  GradientButtonStyle.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    let primaryGradient = Gradient(colors: [.secondary, .secondary])
    let secondaryGradient = Gradient(colors: [Color(.lightGray), Color(.darkGray)])
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .font(weight: .semiBold, style: .title3)
            .padding(.vertical, 12)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(AnimatedGradientView().cornerRadius(8))
            .padding(.bottom, 8)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .padding()
    }
}
