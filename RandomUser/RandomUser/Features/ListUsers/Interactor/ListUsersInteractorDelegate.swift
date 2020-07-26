protocol ListUsersInteractorDelegate: class, AutoMockable {
  func didLoad(users: [User], page: Int)
  func didFailLoadingUsers(with error: Error)
}
