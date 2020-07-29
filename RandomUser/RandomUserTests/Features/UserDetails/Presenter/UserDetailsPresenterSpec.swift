import XCTest
@testable import RandomUser

final class UserDetailsPresenterSpec: XCTestCase {

  private var ui: UserDetailsUIMock!
  private var sut: DefaultUserDetailsPresenter!
  
  override func setUp() {
    super.setUp()
    ui = UserDetailsUIMock()
    sut = DefaultUserDetailsPresenter(user: User.mock)
    sut.ui = ui
  }
  
  func test_did_load() {
    sut.didLoad()
    XCTAssertTrue(ui.setupUIWithCalled, "Should setup the UI")
  }
}
