final class DefaultListUsersInteractor: ListUsersInteractor {
  
  weak var delegate: ListUsersInteractorDelegate?
  private var listUserService: ListUserService
  
  init(listUserService: ListUserService) {
    self.listUserService = listUserService
    self.listUserService.delegate = self
  }

  func getUsers(with seed: String, numberOfItems: Int, page: Int) {
    listUserService.getUsers(with: seed, numberOfItems: numberOfItems, page: page)
  }
}

// MARK: - ListUserServiceDelegate
extension DefaultListUsersInteractor: ListUserServiceDelegate {
  
  func didLoad(users: [User], page: Int) {
    delegate?.didLoad(users: users, page: page)
  }
  
  func didFailLoadingUsers(with error: Error) {
    delegate?.didFailLoadingUsers(with: error)
  }
}
