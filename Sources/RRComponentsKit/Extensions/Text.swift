//
//  Text.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

extension Text {
    public func customTitleText(size: CGFloat) -> some View {
        self
            .font(type: .poppins, weight: .black, style: .largeTitle)
            .multilineTextAlignment(.center)
    }

    public func titleText() -> some View {
        self
            .font(type: .poppins, weight: .bold, style: .title1)
    }

    public func largeTitleText(type: FontType, topPadding: CGFloat = 37) -> some View {
        self
            .foregroundColor(.primary)
            .font(type: type, weight: .bold, style: .largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, topPadding)
    }
    
    public func buttonText() -> some View {
        self
            .kerning(1.0)
            .font(type: .poppins, weight: .regular, style: .caption1)
    }
    
    public func blurredBackgroundText() -> some View {
        self
            .foregroundColor(.white)
            .kerning(1.0)
            .font(type: .poppins, weight: .regular, style: .caption1)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: Constants.cornerRadius / 2)
                            .foregroundColor(Color.black.opacity(0.2)))
            .padding(8)
            .accessibility(addTraits: .isHeader)
    }
}
