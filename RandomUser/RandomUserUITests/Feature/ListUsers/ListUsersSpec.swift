import XCTest
import OHHTTPStubs

private enum ComponentIdentifier {
  static let searchBar = "randomUser.searchBar"
}

final class ListUsersSpec: XCTestCase{
  
  var app = XCUIApplication()
 
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
  }
  
  override func tearDown() {
    app.terminate()
    super.tearDown()
  }
  
  func test_filter() {
    app.launch()
    givenUsers()
    whenFilter(by: "Br")
  }
}

// MARK: - When
extension ListUsersSpec {
  func whenFilter(by text: String) {
    let input = app.staticTexts[ComponentIdentifier.searchBar]
    let timeout = TimeInterval(5)
    waitForElementToAppear(input, timeout: timeout)
    input.tap()
    input.typeText(text)
    let element = app.tables.staticTexts["Arno Brun"]
    element.tap()
    let userDetailsNavigationBar = app.navigationBars["Arno Brun"]
    XCTAssert(userDetailsNavigationBar.exists, "Not showing user Details")
  }
  
  @discardableResult
  private func waitForElementToAppear(_ element: XCUIElement,
                                     timeout: TimeInterval) -> Bool {
    let predicate = NSPredicate(format: "exists == true")
    let expectation = self.expectation(for: predicate,
                                       evaluatedWith: element,
                                       handler: nil)
    let result = XCTWaiter.wait(for: [expectation],
                                timeout: timeout)
    return result == .completed
  }
}

extension ListUsersSpec {
  private func givenUsers() {
    stub(condition: pathMatches("/api")) { _ in
      return HTTPStubsResponse(jsonObject: Fixture.load("list.users.ok"),
                               statusCode: 200,
                               headers: nil
      )
    }
  }
}
