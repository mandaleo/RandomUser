protocol ListUsersInteractorDelegate: class, AutoMockable {
  func didFailLoadingUsers(with error: Error)
}
