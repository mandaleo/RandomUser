protocol ListUsersPresenter: class, AutoMockable {
  var ui: ListUsersUI? { get set }
  func didLoad()
  func loadMoreUsers()
}
