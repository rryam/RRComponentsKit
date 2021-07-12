//
//  SecondaryButton.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 13/07/21.
//

import SwiftUI

public struct SecondaryButton: View {
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
        .buttonStyle(SecondaryButtonStyle())
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton("Try again", action: {})
    }
}
