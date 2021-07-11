//
//  ControlView.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 11/07/21.
//

import SwiftUI
import MovingNumbersView

public struct ControlView: View {
    @State private var roundedNumber: Int = 0
    @Binding var value: Double
    let step: Double
    
    private let generator = UIImpactFeedbackGenerator(style: .medium)
    
    public init(_ value: Binding<Double>, step: Double = 255) {
        self.step = step
        self._value = value
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            MovingNumbersView(number: value * step, numberOfDecimalPlaces: 0) { number in
                Text(number)
                    .kerning(1.0)
                    .foregroundColor(.accentColor)
                    .font(type: .montserrat, weight: .light, style: .caption2)
            }
            
            WideStepper($value, onIncrement: onIncrement, onDecrement: onDecrement) {
                WideSlider($value).padding(.horizontal)
            }
        }
        .padding(.vertical, 4)
        .onChange(of: value) { _ in
            if Int(value * step) != roundedNumber && Int(value * step) % 5 == 0 {
                roundedNumber = Int(value * step)
                hapticFeedback()
            }
        }
        .onAppear {
            generator.prepare()
        }
    }
    
    private func onDecrement() {
        if value > 0 {
            value -= (1 / step)
            hapticFeedback()
        }
    }
    
    private func onIncrement() {
        if value < 1 {
            value += (1 / step)
            hapticFeedback()
        }
    }
    
    private func hapticFeedback() {
        generator.impactOccurred()
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(.constant(0.5))
    }
}
