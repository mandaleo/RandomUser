protocol ListUsersView: class, AutoMockable {
  var delegate: ListsUsersViewDelegate? { get set }
  func setup()
  func filter(by text: String)
}
