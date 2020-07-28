protocol ListUsersInteractor: class, AutoMockable {
  var delegate: ListUsersInteractorDelegate? { get set }
  func getUsers(with seed: String, numberOfItems: Int, page: Int)
  func hideUser(with email: String)
}
