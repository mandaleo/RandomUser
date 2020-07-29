import XCTest
import SnapshotTesting
@testable import RandomUser

final class UserDetailsViewSpec: XCTestCase {
  
  func test_load_view() {
    view.setup(with: User.mock)
    assertSnapshot(matching: view, as: .image)
  }
}

extension UserDetailsViewSpec {
  private var view: DefaultUserDetailsView {
    return DefaultUserDetailsView()
  }
}
