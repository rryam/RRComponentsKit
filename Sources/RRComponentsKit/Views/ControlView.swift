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
    let step: Double
    
    public init(_ value: Binding<Double>, step: Double = 255) {
        self.step = step
        self._value = value
    }
    
    public var body: some View {
        VStack(spacing: 4) {
            MovingNumbersView(number: value * step, numberOfDecimalPlaces: 0) { number in
                Text(number)
                    .kerning(1.0)
                    .foregroundColor(.accentColor)
                    .font(type: .montserrat, weight: .light, style: .callout)
            }
            
            WideStepper($value, onIncrement: onIncrement, onDecrement: onDecrement) {
                WideSlider($value).padding(.horizontal, 8)
            }
        }
    }
    
    private func onDecrement() {
        if value > 0 {
            value -= (1/step)
            //   FeedbackManager.light()
        }
    }
    
    private func onIncrement() {
        if value < 1 {
            value += (1/step)
            //  FeedbackManager.light()
        }
    }
}


struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(.constant(0.5))
    }
}
