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
    sut = nil
    super.tearDown()
  }
  
  func test_storage_value() {
    givenUser()
    whenSave()
    thenUserIsStorage()
  }
}

// MARK: Given
extension CoreDataServiceSpec {
  func givenUser() {
    RUser(user: User.mock, context: sut.context)
  }
}

// MARK: When
extension CoreDataServiceSpec {
  func whenSave() {
    sut.save()
  }
}

// MARK: Then
extension CoreDataServiceSpec {
  func thenUserIsStorage() {
    let user = users.first
    XCTAssertNotNil(user, "This should have one element")
    XCTAssertEqual(user?.email!, User.mock.email, "Both should be the same")
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

