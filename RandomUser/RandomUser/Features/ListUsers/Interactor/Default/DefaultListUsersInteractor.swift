import CoreData

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
  
  func didLoadUsers(with context: NSManagedObjectContext) {
    delegate?.didLoadUsers(with: context)
  }
  
  func didFailLoadingUsers(with error: Error) {
    delegate?.didFailLoadingUsers(with: error)
  }
}
