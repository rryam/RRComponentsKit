//
//  TabBarView.swift
//  RRComponentsKit
//
//  Created by Rudrank Riyam on 09/07/21.
//

import SwiftUI

protocol TabItem {
    var id: Int { get }
    var name: String { get }
    var image: String { get }
    
    func isEqualTo(_ other: TabItem) -> Bool
}

extension TabItem where Self: Equatable {
    func isEqualTo(_ other: TabItem) -> Bool {
        guard let otherItem = other as? Self else { return false }
        return self == otherItem
    }
}

class TabBarViewModel: ObservableObject {
    @Published private(set) var tabItems: [TabItem]
    @Published var currentTab: TabItem

    init(_ tabItems: [TabItem], current currentTab: TabItem) {
        self.tabItems = tabItems
        self.currentTab = currentTab
    }
}

struct TabBarView<ViewModel: TabBarViewModel>: View {
    @Namespace private var currentTab
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        HStack {
            ForEach(viewModel.tabItems, id: \.id) { item in
                GeometryReader { geometry in
                    VStack(spacing: 4) {
                        if viewModel.currentTab.isEqualTo(item) {
                            Color.accentColor
                                .frame(height: 2)
                                .offset(y: -8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                        }

                        Image(systemName: item.image)
                            .frame(height: 20)

                        Text(item.name)
                            .tracking(1.0)
                            .font(type: .montserrat, weight: .light, style: .caption2)
                            .fixedSize()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: geometry.size.width / 2, height: 44, alignment: .bottom)
                    .padding(.horizontal)
                    .foregroundColor(viewModel.currentTab.isEqualTo(item) ? .accentColor : .secondary)
                    .onTapGesture {
                        withAnimation {
                            viewModel.currentTab = item
                        }
                    }
                    .accessibilityLabel(viewModel.currentTab.isEqualTo(item) ? "Selected, \(item.name)" : "\(item.name)")
                    .accessibilityValue(Text("Tab \(item.id) of \(viewModel.tabItems.count)"))
                }
                .frame(height: 44, alignment: .bottom)
            }
        }
    }
}
