import UIKit
import Foundation
import OHHTTPStubs

class MockAppDelegate: UIResponder, UIApplicationDelegate {
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    givenUsers()
    return true
  }
}

// MARK: Stubs
private func givenUsers() {
  stub(condition: pathMatches("/api")) { _ in
    return HTTPStubsResponse(jsonObject: Fixture.load("list.users.ok"),
                             statusCode: 200,
                             headers: nil
    )
  }
}
