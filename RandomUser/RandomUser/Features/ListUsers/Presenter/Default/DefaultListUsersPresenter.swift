final class DefaultListUsersPresenter: ListUsersPresenter {
  
  weak var ui: ListUsersUI?
  private let interactor: ListUsersInteractor
  private let navigator: ListUsersNavigator
  private let localStorageService: LocalStorageService
  
  init(interactor: ListUsersInteractor,
       navigator: ListUsersNavigator,
       localStorageService: LocalStorageService) {
    self.interactor = interactor
    self.navigator = navigator
    self.localStorageService = localStorageService
  }
  
  func didLoad() {
    ui?.setupUI()
    guard localStorageService.integer(forKey: .currentPage) == 0 else { return }
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
