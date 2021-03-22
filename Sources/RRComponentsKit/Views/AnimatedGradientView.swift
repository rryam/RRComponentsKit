//
//  AnimatedGradientView.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

public struct AnimatedGradientView: View {
    private let initialPoint = UnitPoint(x: 0, y: 0)
    private let endPoint = UnitPoint(x: 8, y: 0)
    private let negativeEndPoint = UnitPoint(x: -8, y: 0)

    @State private var start = UnitPoint(x: 0, y: 0)
    @State private var end = UnitPoint(x: 8, y: 0)

    public var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 20).repeatForever())
            .onAppear {
                self.start = endPoint
                self.end = initialPoint
                self.start = negativeEndPoint
                self.end = endPoint
            }
    }

    private let colors: [Color] =
        [Color(.systemBlue),
         Color(.systemPurple),
         Color(.systemIndigo),
         Color(.systemIndigo),
         Color(.systemRed),
         Color(.systemPurple),
         Color(.systemBlue),
         Color(.systemPurple),
         Color(.systemRed),
         Color(.systemPurple),
         Color(.systemIndigo),
         Color(.systemIndigo)]
}

struct AnimatedGradientView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGradientView()
    }
}
