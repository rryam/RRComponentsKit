//
//  WideSlider.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

public struct WideSlider: View {
    @Binding var value: Double
    
    public init(_ value: Binding<Double>) {
        self._value = value
    }
    
    var colors: [Color] {
        [.accentColor.opacity(0.8), .accentColor]
    }
    
    public var body: some View {
        CustomSlider(value: $value, range: (0, 1)) { modifiers in
            ZStack(alignment: .center) {
                LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing)
                    .modifier(modifiers.barLeft)
                                
                Circle()
                    .fill(Color.accentColor)
                    .overlay(Circle().fill(Color.white.opacity(0.15)))
                    .modifier(modifiers.knob)
            }
            .cornerRadius(Constants.cornerRadius)
        }
        .frame(height: 30)
    }
}
