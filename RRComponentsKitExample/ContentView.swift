//
//  ContentView.swift
//  RRComponentsKitExample
//
//  Created by Rudrank Riyam on 22/03/21.
//

import SwiftUI
import RRComponentsKit

enum TabItemType: Int, CaseIterable, Hashable, TabItem {
    case slider = 1
    case stepper
    case button
    
    var image: String {
        switch self {
            case .slider: return "music.note.list"
            case .stepper: return "magnifyingglass"
            case .button: return "captions.bubble"
        }
    }
    
    var id: Int {
        self.rawValue
    }
    
    var name: String {
        String(describing: self).uppercased()
    }
}

struct ContentView: View {
    @StateObject private var tabViewModel = TabBarViewModel(TabItemType.allCases, current: TabItemType.slider)
    
    var body: some View {
        VStack {
            NavTitleView("Title Goes here")

            TabView(selection: $tabViewModel.currentTab) {
                CustomSliders(value: .constant(1.0))
                    .padding()
                    .tag(TabItemType.slider)
                
                CustomStepper(value: .constant(1.0), color: .primary, name: "color")
                    .padding()
                    .tag(TabItemType.stepper)
                
                GradientButton(title: "Evaluate", action: {})
                    .padding()
                    .tag(TabItemType.button)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            TabBarView(viewModel: tabViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
