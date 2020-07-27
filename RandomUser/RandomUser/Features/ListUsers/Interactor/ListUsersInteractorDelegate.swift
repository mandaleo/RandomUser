protocol ListUsersInteractorDelegate: class, AutoMockable {
  func didLoadUsers()
  func didFailLoadingUsers(with error: Error)
}
