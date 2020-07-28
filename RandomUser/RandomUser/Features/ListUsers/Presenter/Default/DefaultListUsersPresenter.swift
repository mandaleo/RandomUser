
final class DefaultListUsersPresenter: ListUsersPresenter {
  
  weak var ui: ListUsersUI?
  private let interactor: ListUsersInteractor
  private let navigator: ListUsersNavigator
  
  init(interactor: ListUsersInteractor,
       navigator: ListUsersNavigator) {
    self.interactor = interactor
    self.navigator = navigator
  }
  
  func didLoad() {
    ui?.setupUI()
    loadUsers()
  }
  
  func didSelect(user: User) {
    navigator.show(user: user)
  }
  
  func loadUsers() {
    interactor.loadUsers()
  }
  
  func hideUser(with email: String) {
    interactor.hideUser(with: email)
  }
}

// MARK: - ListUsersInteractorDelegate
extension DefaultListUsersPresenter: ListUsersInteractorDelegate {
  
  func didFailLoadingUsers(with error: Error) {
    print("NO!!!!!!!!!!!!!!")
  }
}
