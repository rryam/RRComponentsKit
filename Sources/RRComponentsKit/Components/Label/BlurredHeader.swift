//
//  BlurredHeader.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct BlurredHeader: View {
    private var title: String
    private var weight: FontWeight

    public init(_ title: String, weight: FontWeight) {
        self.title = title
        self.weight = weight
    }

    public var body: some View {
        Text(title)
            .tracking(1.0)
            .multilineTextAlignment(.center)
            .font(weight: weight, style: .footnote)
            .foregroundColor(.white)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .foregroundColor(Color.black.opacity(0.15)))
            .padding(8)
    }
}
