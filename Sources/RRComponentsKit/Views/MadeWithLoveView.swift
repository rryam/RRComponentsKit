//
//  MadeWithLoveView.swift
//  MadeWithLoveView
//
//  Created by Rudrank Riyam on 04/09/21.
//

import SwiftUI

struct MadeWithLoveView: View {
    var body: some View {
        Text("MADE WITH ❤️ BY RUDRANK RIYAM".lowercased())
            .foregroundColor(.primary)
            .kerning(1)
            .font(type: .poppins, weight: .regular, style: .caption1)
            .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
            .accessibility(label: Text("MADE WITH LOVE BY RUDRANK RIYAM"))
            .padding(.bottom)
    }
}

struct MadeWithLoveView_Previews: PreviewProvider {
    static var previews: some View {
        MadeWithLoveView()
    }
}
