//
//  CustomStepper.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI
import AVFoundation

public struct WideStepper<Content: View>: View {
    @Binding var value: Double
    
    let onIncrement: () -> ()
    let onDecrement: () -> ()
    let content: Content
    
    public init(_ value: Binding<Double>, onIncrement: @escaping () -> (), onDecrement: @escaping () -> (), @ViewBuilder content: () -> Content) {
        self._value = value
        self.onIncrement = onIncrement
        self.onDecrement = onDecrement
        self.content = content()
        
    }
    
    public var body: some View {
        HStack {
            WideStepperButton(condition: value > 0, systemName: .minus, action: onDecrement)
            
            content
            
            WideStepperButton(condition: value < 1, systemName: .plus, action: onIncrement)
        }
    }
}
