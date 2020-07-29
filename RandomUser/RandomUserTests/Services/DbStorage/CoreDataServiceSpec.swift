import XCTest
import CoreData
@testable import RandomUser

final class CoreDataServiceSpec: XCTestCase {
  
  private var sut: DbStorageService!
  
  override func setUp() {
    super.setUp()
    sut = coreDataService
    sut.clear()
  }
  
  override func tearDown() {
    sut.clear()
    sut = nil
    super.tearDown()
  }
  
  func test_clear_storage() {
    givenUser()
    whenSave()
    whenClearStorage()
    thenDatabaseIsEmpty()
  }
  
  func test_storage_value() {
    givenUser()
    whenSave()
    thenUserIsStorage()
  }
  
  func test_not_storage_duplicates() {
    givenSameUserTwice()
    whenSave()
    thenThereIsNoDuplicatedUsers()
  }
  
  func test_hide_user() {
    givenUser()
    giveAnotherUser()
    whenHideUser()
    thenOneUserIsHidden()
  }
}

// MARK: Given
extension CoreDataServiceSpec {
  func givenUser() {
    RUser(user: User.mock, context: sut.context)
  }
  
  func giveAnotherUser() {
    RUser(user: User.mock2, context: sut.context)
  }
  
  func givenSameUserTwice() {
    RUser(user: User.mock, context: sut.context)
    RUser(user: User.mock, context: sut.context)
  }
}

// MARK: When
extension CoreDataServiceSpec {
  func whenSave() {
    sut.save()
  }
  
  func whenClearStorage() {
    sut.clear()
  }
  
  func whenHideUser() {
    sut.hideUser(with: User.mock2.email)
  }
}

// MARK: Then
extension CoreDataServiceSpec {
  func thenUserIsStorage() {
    let user = users.first
    XCTAssertNotNil(user, "This should have one element")
    XCTAssertEqual(user?.email!, User.mock.email, "Both should be the same")
  }
  
  func thenDatabaseIsEmpty() {
    XCTAssertTrue(users.isEmpty, "This should be empty")
  }
  
  func thenOneUserIsHidden() {
    let usersHidden = users.filter { $0.isHidden }
    XCTAssertEqual(usersHidden.count, 1, "Should be only one")
    XCTAssertEqual(usersHidden.first?.email!, User.mock2.email, "This should be the hidden user")
  }
  
  func thenThereIsNoDuplicatedUsers() {
    XCTAssertEqual(users.count, 1, "Should don't have duplicated users")
  }
}

// MARK: - Private functions
extension CoreDataServiceSpec {
  var users: [RUser] {
    let fetchRequest: NSFetchRequest<RUser> = RUser.fetchRequest()
    do {
      return try sut.context.fetch(fetchRequest)
    } catch let error {
      print(error.localizedDescription)
    }
    return []
  }
}

