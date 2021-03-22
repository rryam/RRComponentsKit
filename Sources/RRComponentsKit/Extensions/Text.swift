//
//  Text.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

extension Text {
    func customTitleText(size: CGFloat) -> some View {
        self
            .multilineTextAlignment(.center)
            .font(weight: .black, style: .largeTitle)
    }

    func titleText() -> some View {
        self
            .font(weight: .bold, style: .title1)
    }

    func largeTitleText(topPadding: CGFloat = 37) -> some View {
        self
            .foregroundColor(.primary)
            .font(weight: .bold, style: .largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, topPadding)
    }
}
