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
    case box
    
    var image: String {
        switch self {
            case .slider: return "music.note.list"
            case .stepper: return "magnifyingglass"
            case .button: return "captions.bubble"
            case .box: return "archivebox"
        }
    }
    
    var id: Int {
        self.rawValue
    }
    
    var name: String {
        String(describing: self).uppercased()
    }
    
    @ViewBuilder var view: some View {
        switch self {
            case .slider: CustomSliders(value: .constant(1.0))
            case .stepper: CustomStepper(value: .constant(1.0), color: .primary, name: "color")
            case .button:  GradientButton(title: "Evaluate", action: {})
            case .box: BoxView("Target", Color.pink) { }
        }
    }
}

struct ContentView: View {
    @StateObject private var tabViewModel = TabBarViewModel(TabItemType.allCases, current: TabItemType.box)
    
    var body: some View {
        VStack {
            NavTitleView("Title Goes here").padding(.horizontal)
            
            TabView(selection: $tabViewModel.currentTab) {
                ForEach(TabItemType.allCases, id: \.id) { item in
                    item.view
                        .padding()
                        .tag(item.self)
                }
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
