//
//  RotatingGradientButton.swift
//  RRComponentsKitExample
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

public struct RotatingGradientButton: View {
    var title: String
    var font: UIFont.TextStyle = .callout
    var action: () -> ()

    public init(title: String, font: UIFont.TextStyle = .callout, action: @escaping () -> Void) {
        self.font = font
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: withAnimation { action }, label: {
            Text(title)
                .kerning(1.0)
                .font(weight: .bold, style: .headline)
        })
        .buttonStyle(GradientButtonStyle())
    }
}

struct RotatingGradientButton_Previews: PreviewProvider {
    static var previews: some View {
        RotatingGradientButton(title: "Evaluate", action: {})
    }
}
