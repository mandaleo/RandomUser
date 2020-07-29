import Foundation
@testable import RandomUser

class TestSetup: NSObject {
  override init() {
    setenv("BASE_URL", "http://mock.mock", 1)
  }
}
