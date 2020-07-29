import XCTest
@testable import RandomUser

final class ListUsersNavigatorSpec: XCTestCase {

  private var userDetailsProvider: UserDetailsProviderMock!
  private var sut: ListUsersNavigator!
  
  override func setUp() {
    super.setUp()
    userDetailsProvider = UserDetailsProviderMock()
    sut = DefaultListUsersNavigator(from: UIViewController(),
                                    userDetailsProvider: userDetailsProvider)
  }
  
  func tes_navigate_user_details() {
    sut.show(user: User.mock)
    XCTAssertTrue(userDetailsProvider.userDetailsViewControllerForCalled,
                  "Should call the View controller")
  }
}
