protocol UserDetailsPresenter: class, AutoMockable {
  var ui: UserDetailsUI? { get set }
  func didLoad()
}
