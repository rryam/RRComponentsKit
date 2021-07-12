//
//  PrimaryButton.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct PrimaryButton: View {
    private var title: String
    private var action: () -> ()
    
    public init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: withAnimation { action }) {
            Text(title).buttonText()
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

struct ColoredButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton("Evaluate", action: {})
    }
}
