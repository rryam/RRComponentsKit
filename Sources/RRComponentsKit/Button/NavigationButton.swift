//
//  NavigationButton.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 29/03/21.
//

import SwiftUI

struct NavigationButton: View {
    var imageName: String
    var label: String
    var action: () -> ()

    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .font(.system(size: 25))
                .frame(width: 40, height: 40, alignment: .center)
                .accessibility(label: Text(label))
        }
        .buttonStyle(PlainButtonStyle())
    }
}
