//
//  GradientButton.swift
//  RRComponentsKitExample
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

public struct GradientButton: View {
    private var title: String
    private var font: UIFont.TextStyle = .headline
    private var action: () -> ()
    
    public init(title: String, font: UIFont.TextStyle = .headline, action: @escaping () -> Void) {
        self.font = font
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: withAnimation { action }) {
            Text(title)
                .kerning(1.0)
                .font(type: .montserrat, weight: .light, style: .callout)
        }
        .padding(.bottom)
        .buttonStyle(GradientButtonStyle())
    }
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        GradientButton(title: "Evaluate", action: {})
    }
}
