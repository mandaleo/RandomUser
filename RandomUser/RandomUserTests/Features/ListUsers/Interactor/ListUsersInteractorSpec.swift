import XCTest
@testable import RandomUser

final class ListUsersInteractorSpec: XCTestCase {

  private var delegate: ListUsersInteractorDelegateMock!
  private var listUserService: ListUserServiceMock!
  private var sut: DefaultListUsersInteractor!
  
  override func setUp() {
    super.setUp()
    delegate = ListUsersInteractorDelegateMock()
    listUserService = ListUserServiceMock()
    sut = DefaultListUsersInteractor(listUserService: listUserService)
    sut.delegate = delegate
  }
  
  func test_load_users() {
    sut.loadUsers()
    XCTAssertTrue(listUserService.loadUsersCalled, "Shoud call load user on the services")
  }
  
  func test_failing_load_users() {
    listUserService.loadUsersClosure  = {
      self.sut.didFailLoadingUsers(with: NSError())
    }
    sut.loadUsers()
    XCTAssertTrue(listUserService.loadUsersCalled, "Shoud call load user on the services")
    XCTAssertTrue(delegate.didFailLoadingUsersWithCalled, "Should call the delegate")
  }
  
  func test_hide_user() {
    sut.hideUser(with: User.mock.email)
    XCTAssertTrue(listUserService.hideUserWithCalled, "Should call the hideUser service")
  }
}
