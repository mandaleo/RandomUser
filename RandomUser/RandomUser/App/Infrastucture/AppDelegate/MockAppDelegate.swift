import UIKit
import Foundation
import OHHTTPStubs

class MockAppDelegate: UIResponder, UIApplicationDelegate {
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    coreDataService.clear()
    clearLocalStorage()
    givenUsers()
    return true
  }
  
  private func clearLocalStorage() {
    guard let domain = Bundle.main.bundleIdentifier else { return }
    UserDefaults.standard.removePersistentDomain(forName: domain)
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
