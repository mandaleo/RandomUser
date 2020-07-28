protocol ListsUsersViewDelegate: class, AutoMockable {
  func didSelect(user: User)
  func didTapOnHideUser(with email: String)
}
