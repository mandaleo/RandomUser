protocol ListUsersView: class, AutoMockable {
  var delegate: ListsUsersViewDelegate? { get set }
  func setup(with users: [User])
}
