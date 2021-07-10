//
//  ControlView.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 11/07/21.
//

import SwiftUI

public struct ControlView: View {
    @Binding var value: Double
    var step: Double
    
    public init(_ value: Binding<Double>, step: Double = 1.0/255) {
        self.step = step
        self._value = value
    }

    public var body: some View {
        WideStepper($value, onIncrement: onIncrement, onDecrement: onDecrement) {
            WideSlider($value)
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
