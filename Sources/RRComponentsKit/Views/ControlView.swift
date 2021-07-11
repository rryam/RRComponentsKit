//
//  ControlView.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 11/07/21.
//

import SwiftUI
import MovingNumbersView

public struct ControlView: View {
    @Binding var value: Double
    var step: Double
    
    public init(_ value: Binding<Double>, step: Double = 1.0/255) {
        self.step = step
        self._value = value
    }
    
    public var body: some View {
        VStack(spacing: 4) {
            MovingNumbersView(number: value * (1 / step), numberOfDecimalPlaces: 1) { number in
                Text(number)
                    .kerning(1.0)
                    .foregroundColor(.accentColor)
                    .font(type: .montserrat, weight: .light, style: .callout)
            }
            
            WideStepper($value, onIncrement: onIncrement, onDecrement: onDecrement) {
                WideSlider($value)
            }
        }
    }
    
    private func onDecrement() {
        if value > 0 {
            value -= step
         //   FeedbackManager.light()
        }
    }
    
    private func onIncrement() {
        if value < 1 {
            value += step
          //  FeedbackManager.light()
        }
    }
}


struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(.constant(0.5))
    }
}
