//
//  StepperButtonStyle.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

struct StepperButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font()
            .padding(5)
            .frame(width: 28, height: 28)
            .background(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                    .fill(Color.gradientGray))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}
