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
    case button
    case box
    
    var image: String {
        switch self {
            case .slider: return "music.note.list"
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
}

struct ContentView: View {
    @StateObject private var tabViewModel = TabBarViewModel(TabItemType.allCases, current: TabItemType.box)
    @State private var value: Double = .random(in: 0...1)
    
    var body: some View {
        VStack {
            NavTitleView("Title Goes here").padding(.horizontal)
            
            TabView(selection: $tabViewModel.currentTab) {
                ForEach(TabItemType.allCases, id: \.id) { item in
                    tabItemView(with: item)
                        .padding()
                        .tag(item.self)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            TabBarView(viewModel: tabViewModel)
        }
    }
    
    @ViewBuilder func tabItemView(with item: TabItemType) -> some View {
        switch item {
            case .slider: ControlView($value)
            case .button: GradientButton(title: "Evaluate", action: {})
            case .box: BoxView(.target, Color.pink) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
