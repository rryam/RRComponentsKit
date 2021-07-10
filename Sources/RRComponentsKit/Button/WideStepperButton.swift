//
//  WideStepperButton.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 10/07/21.
//

import SwiftUI

enum StepperButtonImage: String {
    case plus
    case minus
}

struct WideStepperButton: View {
    var condition: Bool
    var systemName: StepperButtonImage
    var action: () -> ()
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName.rawValue)
                .foregroundColor(condition ? .accentColor : .secondaryBackground)
        }
       .buttonStyle(.stepper)
    }
}

struct WideStepperButton_Previews: PreviewProvider {
    static var previews: some View {
        WideStepperButton(condition: true, systemName: .minus, action: {})
    }
}
