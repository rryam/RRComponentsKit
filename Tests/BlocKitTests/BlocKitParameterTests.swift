import XCTest
import SwiftUI
@testable import BlocKit

#if os(macOS)
import AppKit
#elseif os(iOS) || os(visionOS)
import UIKit
#endif

final class BlocKitParameterTests: XCTestCase {
    func testCustomTitleTextUsesRequestedFontSize() throws {
        let title = Text("Score").customTitleText(size: 23)

        let fontSize = try XCTUnwrap(firstValue(named: "size", in: title) as? CGFloat)

        XCTAssertEqual(fontSize, 23)
    }

    func testProminenceReverseInvertsAdjustmentInLightMode() {
        let color = Color(red: 0.5, green: 0.5, blue: 0.5)

        let prominent = color.prominence(value: 0.1, scheme: .light)
        let reversed = color.prominence(value: 0.1, scheme: .light, reverse: true)

        XCTAssertEqual(redComponent(of: prominent), 0.4, accuracy: 0.001)
        XCTAssertEqual(redComponent(of: reversed), 0.6, accuracy: 0.001)
    }

    func testProminenceReverseInvertsAdjustmentInDarkMode() {
        let color = Color(red: 0.5, green: 0.5, blue: 0.5)

        let prominent = color.prominence(value: 0.1, scheme: .dark)
        let reversed = color.prominence(value: 0.1, scheme: .dark, reverse: true)

        XCTAssertEqual(redComponent(of: prominent), 0.6, accuracy: 0.001)
        XCTAssertEqual(redComponent(of: reversed), 0.4, accuracy: 0.001)
    }

    private func firstValue(named name: String, in value: Any) -> Any? {
        let mirror = Mirror(reflecting: value)

        for child in mirror.children {
            if child.label == name {
                return child.value
            }

            if let value = firstValue(named: name, in: child.value) {
                return value
            }
        }

        return nil
    }

    private func redComponent(of color: Color) -> CGFloat {
        #if os(macOS)
        return NSColor(color).usingColorSpace(.deviceRGB)?.redComponent ?? 0
        #elseif os(iOS) || os(visionOS)
        return UIColor(color).cgColor.components?[0] ?? 0
        #else
        return 0
        #endif
    }
}
