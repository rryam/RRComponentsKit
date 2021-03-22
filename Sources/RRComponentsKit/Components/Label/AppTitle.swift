//
//  TextLabelComponents.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI

public struct AppTitle: View {
    var title: String

    public init(_ title: String) {
        self.title = title
    }

    public var body: some View {
    Text(title)
        .tracking(1.0)
        .font(type: .poppins, weight: .bold, style: .title2)
    }
}
