import XCTest
@testable import RandomUser

final class ListUsersPresenterSpec: XCTestCase {

  private var ui: ListUsersUIMock!
  private var interactor: ListUsersInteractorMock!
  private var navigator: ListUsersNavigatorMock!
  private var localStorageService: LocalStorageServiceMock!
  private var sut: DefaultListUsersPresenter!
  
  override func setUp() {
    super.setUp()
    ui = ListUsersUIMock()
    interactor = ListUsersInteractorMock()
    navigator = ListUsersNavigatorMock()
    localStorageService = LocalStorageServiceMock()
    sut = DefaultListUsersPresenter(interactor: interactor,
                                    navigator: navigator,
                                    localStorageService: localStorageService)
    sut.ui = ui
  }
  
  func test_did_load_first_time() {
    localStorageService.integerForKeyReturnValue = 0
    sut.didLoad()
    XCTAssertTrue(ui.setupUICalled, "Should setup the UI")
    XCTAssertTrue(interactor.loadUsersCalled, "Should call interactor to load users")
  }
  
  func test_did_load() {
    localStorageService.integerForKeyReturnValue = 1
    sut.didLoad()
    XCTAssertTrue(ui.setupUICalled, "Should setup the UI")
    XCTAssertFalse(interactor.loadUsersCalled, "Should not call interactor to load users")
  }
  
  func test_select_user() {
    sut.didSelect(user: User.mock)
    XCTAssertTrue(navigator.showUserCalled, "Should call navigator to show user details")
  }
  
  func test_load_more_users() {
    sut.loadUsers()
    XCTAssertTrue(interactor.loadUsersCalled, "Should call interactor to show more users")
  }
  
  func test_hide_user() {
    sut.hideUser(with: User.mock.email)
    XCTAssertTrue(interactor.hideUserWithCalled, "Should call interactor to hide user")
  }
}
