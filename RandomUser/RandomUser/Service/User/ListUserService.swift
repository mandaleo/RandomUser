import RxSwift

private enum DefaultValues {
  static let seed = "abc"
  static let numberOfItems = 20
  static let page = 1
}

protocol ListUserServiceDelegate: class, AutoMockable {
  func didLoadUsers()
  func didFailLoadingUsers(with error: Error)
}

protocol ListUserService: AutoMockable {
  var delegate: ListUserServiceDelegate? { get set }
  func loadUsers()
  func hideUser(with email: String)
}

class DefaultListUserService: ListUserService {
  
  weak var delegate: ListUserServiceDelegate?
  private let listUsers: ListUsersUseCase
  private var localStorageService: LocalStorageService
  private let bag = DisposeBag()
  
  init(listUsers: ListUsersUseCase,
       localStorageService: LocalStorageService) {
    self.listUsers = listUsers
    self.localStorageService = localStorageService
  }
  
  func loadUsers() {
    let request = ListUsersRequest(page: DefaultValues.page,
                                   numberOfItems: DefaultValues.numberOfItems,
                                   seed: DefaultValues.seed)
    listUsers.execute(request: request).subscribe(onSuccess: { [weak self] listUsers in
      self?.storage(users: listUsers.users)
    }, onError: { [weak self] error in
      self?.delegate?.didFailLoadingUsers(with: error)
      }).disposed(by: bag)
  }
  
  func hideUser(with email: String) {
    localStorageService.hideUser(with: email)
  }
  
  private func storage(users: [User]) {
    for user in users {
      RUser(user: user, context: localStorageService.context)
    }
    localStorageService.save()
    delegate?.didLoadUsers()
  }
}

// MARK: - Assembly
extension Assembly {
  var listUserService: ListUserService {
    return DefaultListUserService(listUsers: networking.listUsers,
                                  localStorageService: coreDataService)
  }
}
