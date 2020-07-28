protocol ListUsersInteractor: class, AutoMockable {
  var delegate: ListUsersInteractorDelegate? { get set }
  func loadUsers()
  func hideUser(with email: String)
}
