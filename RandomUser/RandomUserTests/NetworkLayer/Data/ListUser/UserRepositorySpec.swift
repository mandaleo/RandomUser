import XCTest
import OHHTTPStubs
import RxBlocking
@testable import RandomUser

final class UserRepositorySpec: XCTestCase {
  
  private var sut: UserRepository!
  
  override func setUp() {
    super.setUp()
    sut = networking.userRespository
  }
  
  override func tearDown() {
    sut = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func test_get_users() {
    givenUsers()
    XCTAssertNoThrow(try sut.list(request: ListUsersRequest.mock).toBlocking().first())
    let response = try? sut.list(request: ListUsersRequest.mock).toBlocking().first()
    XCTAssertNotNil(response?.users, "Nil????? Seriously ....")
    XCTAssertFalse(response!.users.isEmpty, "Man!!! What are you doing!!!")
    XCTAssertTrue(response!.users.count == 20, "You need to review your maths... should be 40")
    XCTAssertNotNil(response?.page, "Nil????? Seriously ....")
    XCTAssertEqual(response!.page, 1, "Check because should be 1")
  }
}

extension UserRepositorySpec {
  private func givenUsers() {
    stub(condition: pathMatches("/api")) { _ in
      return HTTPStubsResponse(jsonObject: Fixture.load("list.users.ok"),
                               statusCode: 200,
                               headers: nil
      )
    }
  }
}
