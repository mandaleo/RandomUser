import XCTest
import RxSwift
import CoreData
@testable import RandomUser

final class ListUserServiceSpec: XCTestCase {
  
  private var sut: ListUserService!
  private var delegate: ListUserServiceDelegateMock!
  private var listUsers: ListUsersUseCaseMock!
  private var dbStorageService: DbStorageServiceMock!
  private var localStorageService: LocalStorageServiceMock!
  
  override func setUp() {
    super.setUp()
    delegate = ListUserServiceDelegateMock()
    listUsers = ListUsersUseCaseMock()
    dbStorageService = DbStorageServiceMock()
    localStorageService = LocalStorageServiceMock()
    sut = DefaultListUserService(listUsers: listUsers,
                                 dbStorageService: dbStorageService,
                                 localStorageService: localStorageService)
    sut.delegate = delegate
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func test_load_users() {
    givenListUsers()
    whenLoadUsers()
    thenUsersDidLoad()
  }
  
  func test_fail_loading_users() {
    givenListUsersWtihError()
    whenLoadUsers()
    thenNotLoadUsers()
  }
  
  func test_hide_user() {
    givenListUsers()
    whenHideUser()
    thenUserWillHide()
  }
}

// MARK: - Given
extension ListUserServiceSpec {
  func givenListUsers() {
    listUsers.willReturnUsers()
    localStorageService.integerForKeyReturnValue = 1
    dbStorageService.underlyingContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
  }
  
  func givenListUsersWtihError() {
    listUsers.willReturnError()
    localStorageService.integerForKeyReturnValue = 1
    dbStorageService.underlyingContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
  }
}

// MARK: - When
extension ListUserServiceSpec {
  func whenLoadUsers() {
    sut.loadUsers()
  }
  
  func whenHideUser() {
    sut.hideUser(with: User.mock.email)
  }
}

// MARK: - Then
extension ListUserServiceSpec {
  func thenUsersDidLoad() {
    XCTAssertTrue(localStorageService.storeValueForKeyCalled, "Should save page in user defaults")
    XCTAssertTrue(dbStorageService.saveCalled, "Should save users on core data")
    XCTAssertTrue(delegate.didLoadUsersCalled, "Should call delegate when users did load")
  }
  
  func thenNotLoadUsers() {
    XCTAssertTrue(delegate.didFailLoadingUsersWithCalled, "Should call error method")
  }
  
  func thenUserWillHide() {
    XCTAssertTrue(dbStorageService.hideUserWithCalled, "Shoud call hice user in dbStorage service")
  }
}

// MARK: - AutoMockable extension
extension ListUsersUseCaseMock {
  func willReturnUsers() {
    executeRequestReturnValue = Single.create(subscribe: { (event) in
      event(.success(ListUsers.mock))
      return Disposables.create()
    })
  }
  
  func willReturnError() {
    executeRequestReturnValue = Single.create(subscribe: { (event) in
      event(.error(self.emptyError))
      return Disposables.create()
    })
  }
  
  private var emptyError: Error {
    return NSError(domain: "domain", code: 0, userInfo: ["":""]) as Error
  }
}
