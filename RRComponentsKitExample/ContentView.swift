//
//  ContentView.swift
//  RRComponentsKitExample
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI
import RRComponentsKit

struct ContentView: View {
    var body: some View {
        GradientButton(title: "Evaluate", action: {})

        CustomStepper(value: .constant(1.0), color: .primary, name: "color")
        
        NavTitleView("Title Goes here")
    }
}
