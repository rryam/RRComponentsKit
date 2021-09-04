//
//  BoxView.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 10/07/21.
//

import SwiftUI

public enum BoxHeaderType: String {
    case target
    case yours
}

public struct BoxView<Content: View, Fill: ShapeStyle>: View {
    let header: BoxHeaderType
    let fill: Fill
    let content: Content
    
    public init(_ header: BoxHeaderType, _ fill: Fill, @ViewBuilder content: () -> Content) {
        self.header = header
        self.fill = fill
        self.content = content()
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(fill)
                .overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .stroke(Color.stroke))
            
            VStack {
                Text(header.rawValue.lowercased()).blurredBackgroundText()
                
                content
            }
        }
        .padding(.bottom, 4)
    }
}
