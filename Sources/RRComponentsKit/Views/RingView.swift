//
//  RingView.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 06/04/21.
//

import SwiftUI

public struct ScoreView: View {
    var seconds: Int
    var score: Double
    var highScore: Double
    
    public init(_ score: Double, _ highScore: Double, seconds: Int = 15) {
        self.seconds = seconds
        self.highScore = highScore
        self.score = score
    }
    
    public var body: some View {
        VStack {
            AnalyticsScoreView(highScore: highScore, secondsTaken: seconds) {
                UserScoreView(score)
            }
        }
        .padding(.top)
    }
}

struct AnalyticsScoreView<Content: View>: View {
    var highScore: Double
    var secondsTaken: Int
    var scoreRing: () -> Content
    
    var body: some View {
        HStack {
            Spacer()
            
            scoreRing()
            
            Spacer()
            
            Divider()
                .layoutPriority(-1)
            
            Spacer()

            VStack {
                AnalyticsInfoView(title: "HIGH \nSCORE".lowercased(), value: String(format: "%.1f", highScore))
                
                Spacer()
                AnalyticsInfoView(title: "SECONDS \nTAKEN".lowercased(), value: String(describing: secondsTaken))
            }
            .layoutPriority(-1)
            
            Spacer()
        }
    }
}

struct AnalyticsInfoView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .kerning(1)
                .font(type: .poppins, weight: .light, style: .caption2)
            
            Text(value)
                .kerning(1)
                .font(type: .poppins, weight: .bold, style: .title2)
                .foregroundColor(.accentColor)
        }
        .multilineTextAlignment(.center)
    }
}

struct UserScoreView: View {
    var score: Double
    
    public init(_ score: Double) {
        self.score = score
    }
    
    var body: some View {
        ZStack {
            ProgressRingView(progress: score / 100)
            
            VStack(spacing: 0) {
            Text("SCORE".lowercased())
                .kerning(1)
                .font(type: .poppins, weight: .light, style: .caption1)
            
                Text(String(format: "%.1f", score))
                    .kerning(1)
                    .font(type: .poppins, weight: .black, style: .largeTitle)
                    .foregroundColor(.accentColor)
                    .accessibility(label: Text("\(String(format: "%.1f", score)) points"))
            }
            .accessibilityElement(children: .combine)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(85.0, 100.0).accentColor(Color.red)
    }
}

struct ProgressRingView: View {
    var progress: CGFloat
    var lineWidth: CGFloat = 20
    var size: CGFloat = 150
    var gradient = [.accentColor, Color.accentColor.opacity(0.5)]
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.systemGrey6, style:
                            StrokeStyle(lineWidth: lineWidth))
                .frame(width: size, height: size)
            
            Circle()
                .trim(from: 1 - progress, to: 1)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: gradient),
                        startPoint: .leading, endPoint: .trailing),
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180),
                                  axis: (x: 1, y: 0, z: 0))
                .frame(width: size, height: size)
        }
    }
}

extension Color {
    static var systemGrey6: Color {
        #if os(macOS)
        return Color(NSColor.lightGray)
        #else
        return Color(UIColor.systemGray6)
        #endif
    }
}
