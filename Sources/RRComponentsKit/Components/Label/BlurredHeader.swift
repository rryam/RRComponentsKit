//
//  BlurredHeader.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct BlurredHeader: View {
    private var title: String

    public init(_ title: String) {
        self.title = title
    }

    public var body: some View {
        Text(title).tracking(1.0)
            .multilineTextAlignment(.center)
            .font(style: .footnote)
            .foregroundColor(.white)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .foregroundColor(Color.black.opacity(0.15)))
            .padding(8)
    }
}
