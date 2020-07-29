final class DefaultListUsersInteractor: ListUsersInteractor {
  
  weak var delegate: ListUsersInteractorDelegate?
  private var listUserService: ListUserService
  
  init(listUserService: ListUserService) {
    self.listUserService = listUserService
    self.listUserService.delegate = self
  }

  func loadUsers() {
    listUserService.loadUsers()
  }
  
  func hideUser(with email: String) {
    listUserService.hideUser(with: email)
  }
}

// MARK: - ListUserServiceDelegate
extension DefaultListUsersInteractor: ListUserServiceDelegate {
  
  func didLoadUsers() {
    // Nothing to do
  }
  
  func didFailLoadingUsers(with error: Error) {
    delegate?.didFailLoadingUsers(with: error)
  }
}
