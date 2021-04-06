//
//  RingView.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 06/04/21.
//

import SwiftUI

public struct RingView: View {
    var currentScore: Double
    var individualPoints: String
    var leftColor: Color
    var rightColor: Color
    
    private let lineWidth: CGFloat = 50
    private let dash: [CGFloat] = [4, 10]
    
    public var body: some View {
        VStack {
            Text("OVERALL SCORE")
                .font(weight: .bold, style: .title3)
            ZStack {
                
                CustomCircle(leftColor: .ringBackground, rightColor: Color.ringBackground.opacity(0.7), currentScore: 1)
                CustomCircle(leftColor: leftColor, rightColor: rightColor, currentScore: currentScore)
                
                VStack {
                    Text(individualPoints)
                        .font(weight: .bold, style: .title1)
                        .accessibility(label: Text("\(individualPoints) points"))
                    
                    Text("OUT OF 100")
                        .font(style: .callout)
                        .foregroundColor(.secondary)
                }
                .accessibilityElement(children: .combine)
            }
            .offset(y: 40)
            .padding(.bottom, -40)
        }
    }
}

struct CustomCircle: View {
    var leftColor: Color
    var rightColor: Color
    var currentScore: Double
    
    var gradient: Gradient {
        Gradient(colors: [rightColor, leftColor])
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: CGFloat(currentScore) / 2)
            .stroke(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing),
                    style: StrokeStyle(lineWidth: 80, lineCap: .butt, lineJoin: .bevel, dash: [10, 11]))
            .rotationEffect(.degrees(-180))
    }
}
