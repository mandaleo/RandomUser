protocol ListUsersPresenter: class, AutoMockable {
  var ui: ListUsersUI? { get set }
  func didLoad()
  func didSelect(user: User)
  func loadMoreUsers()
}
