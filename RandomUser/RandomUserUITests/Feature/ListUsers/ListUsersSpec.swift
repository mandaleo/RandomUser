import XCTest

private enum ComponentIdentifier {
  static let searchBar = "randomUser.searchBar"
  static let arnoBrunUser = "Arno Brun"
  static let donWhite = "Don White"
}

final class ListUsersSpec: XCTestCase {
  
  private var app: XCUIApplication!
  private let timeout = TimeInterval(3)
  
  override func setUp() {
    super.setUp()
    app = XCUIApplication()
    app.launchArguments = ["enable-ui-testing"]
    continueAfterFailure = false
    app.launch()
  }
  
  override func tearDown() {
    app.terminate()
    super.tearDown()
  }
  
  func test_filter() {
    whenFilter(by: "Br")
    thenUserIsFiltered()
  }
  
  func test_show_user_details() {
    whenFilter(by: "Br")
    whenNavigate()
    thenUserDetailsIsShowed()
  }
}

// MARK: - When
extension ListUsersSpec {
  func whenFilter(by text: String) {
    let input = getItem(with: ComponentIdentifier.searchBar)
    input.tap()
    input.typeText(text)
  }
  
  func whenNavigate() {
    let element = getItemOnTable(with: ComponentIdentifier.arnoBrunUser)
    element.tap()
  }
}

// MARK: - Then
extension ListUsersSpec {
  func thenUserIsFiltered() {
    let userShowed = getItemOnTable(with: ComponentIdentifier.arnoBrunUser)
    let userNotShowed = getItemOnTable(with: ComponentIdentifier.donWhite)
    XCTAssertTrue(userShowed.exists, "This users should be exist")
    XCTAssertFalse(userNotShowed.exists, "This user should not be exist")
  }
  
  func thenUserDetailsIsShowed() {
    let userDetailsNavigationBar = getItenOnNavigationBar(with: ComponentIdentifier.arnoBrunUser)
    XCTAssert(userDetailsNavigationBar.exists, "Not showing user Details")
  }
}

// MARK: - Find Elements
extension ListUsersSpec {
  private func getItem(with identifier: String) -> XCUIElement {
    let input = app.staticTexts[identifier]
    waitForElementToAppear(input, timeout: timeout)
    return input
  }
  
  private func getItemOnTable(with identifier: String) -> XCUIElement {
    let input = app.tables.staticTexts[identifier]
    waitForElementToAppear(input, timeout: timeout)
    return input
  }
  
  private func getItenOnNavigationBar(with identifier: String) -> XCUIElement {
    let input = app.navigationBars["Arno Brun"]
    waitForElementToAppear(input, timeout: timeout)
    return input
  }
}

// MARK: - Utils
extension ListUsersSpec {
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
