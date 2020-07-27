private enum DefaultValues {
  static let seed = "abc"
  static let numberOfITems = 20
  static let page = 1
}

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
    // TODO: - Check this
    loadMoreUsers()
  }
  
  func didSelect(user: User) {
    navigator.show(user: user)
  }
  
  func loadMoreUsers() {
    interactor.getUsers(with: DefaultValues.seed,
                        numberOfItems: DefaultValues.numberOfITems,
                        page: DefaultValues.page)
  }
}

// MARK: - ListUsersInteractorDelegate
extension DefaultListUsersPresenter: ListUsersInteractorDelegate {
  
  func didLoadUsers() {
    print("YES!!!!!!!!!!!!!!")
    ui?.setupUI()
  }
  
  func didFailLoadingUsers(with error: Error) {
    print("NO!!!!!!!!!!!!!!")
  }
}
