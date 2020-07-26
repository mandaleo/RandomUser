final class DefaultUserDetailsPresenter: UserDetailsPresenter {
  
  weak var ui: UserDetailsUI?
  private let user: User
  
  init(user: User) {
    self.user = user
  }
  
  func didLoad() {
    ui?.setupUI(with: user)
  }
}
