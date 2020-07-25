// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import RandomUser
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class FakeTestMock: NSObject, FakeTest {

    //MARK: - testShit

    private(set) var testShitCallsCount = 0
    var testShitCalled: Bool {
        return testShitCallsCount > 0
    }
    var testShitClosure: (() -> Void)?

    func testShit() {
        testShitCallsCount += 1
        testShitClosure?()
    }

}
