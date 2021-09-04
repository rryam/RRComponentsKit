//
//  PrimaryButton.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct PrimaryGradientButton: View {
    private var gradient: Gradient
    private var title: String
    private var action: () -> ()
    
    public init(_ title: String, _ gradient: Gradient, _ action: @escaping () -> Void) {
        self.title = title
        self.gradient = gradient
        self.action = action
    }
    
    public var body: some View {
        Button(action: withAnimation { action }) {
            Text(title)
                .foregroundColor(.white)
                .buttonText()
        }
        .buttonStyle(PrimaryButtonStyle({ LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom).cornerRadius(Constants.cornerRadius) }))
    }
}

public struct PrimaryButton: View {
    private var title: String
    private var action: () -> ()
    
    public init(_ title: String, _ action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: withAnimation { action }) {
            Text(title)
                .foregroundColor(.white)
                .buttonText()
        }
        .buttonStyle(PrimaryButtonStyle({ Color.accentColor.cornerRadius(Constants.cornerRadius) }))
    }
}

struct ColoredButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PrimaryButton("Evaluate", {})            
        }
    }
}
