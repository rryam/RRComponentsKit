//
//  CustomStepper.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI
import AVFoundation

public struct CustomStepper: View {
    @Binding private var value: Double
    private var color: Color = .primary
    private var step: Double
    private var name: String

    public init(value: Binding<Double>, color: Color, step: Double = 1.0/255.0, name: String) {
        self._value = value
        self.color = color
        self.step = step
        self.name = name
    }

    public var body: some View {
        VStack(spacing: 2) {
            Text("\(name): \(Int(value * (1 / step)))")
                .foregroundColor(color)
                .tracking(1.0)
                .font(weight: .semiBold, style: .footnote)
                .frame(minWidth: 50)
                .accessibility(label: Text("\(name), "))
                .accessibility(value: Text("\(Int(value * (1 / step)))"))

            HStack(alignment: .center) {
                StepperButton(imageName: "minus", label: "Decrease \(name)", foreground: value > 0 ? color : Color(.gray)) {
                    if value > 0 {
                        value -= step
                        feedback()
                    }
                }

                CustomSliders(value: $value, color: color)
                    .padding(.horizontal, 8)

                StepperButton(imageName: "plus", label: "Increase \(name)", foreground: value < 1 ? color : Color(.gray)) {
                    if value < 1 {
                        value += step
                        feedback()
                    }
                }
            }
        }
        .padding(.vertical, 2)
        .padding(.bottom, 6)
    }

    private func feedback() {
        #if !os(macOS)
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
        let systemSoundID: SystemSoundID = 1105
        AudioServicesPlaySystemSound(systemSoundID)
        #endif
    }
}
