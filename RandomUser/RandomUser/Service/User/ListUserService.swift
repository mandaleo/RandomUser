import RxSwift

private enum DefaultValues {
  static let seed = "abc"
  static let numberOfItems = 10
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
  private let dbStorageService: DbStorageService
  private let localStorageService: LocalStorageService
  private let bag = DisposeBag()
  
  init(listUsers: ListUsersUseCase,
       dbStorageService: DbStorageService,
       localStorageService: LocalStorageService) {
    self.listUsers = listUsers
    self.dbStorageService = dbStorageService
    self.localStorageService = localStorageService
  }
  
  func loadUsers() {
    let request = ListUsersRequest(page: nextPage,
                                   numberOfItems: DefaultValues.numberOfItems,
                                   seed: DefaultValues.seed)
    listUsers.execute(request: request).subscribe(onSuccess: { [weak self] listUsers in
      self?.save(currentPage: listUsers.page)
      self?.storage(users: listUsers.users)
    }, onError: { [weak self] error in
      self?.delegate?.didFailLoadingUsers(with: error)
      }).disposed(by: bag)
  }
  
  func hideUser(with email: String) {
    dbStorageService.hideUser(with: email)
  }
  
  private func storage(users: [User]) {
    for user in users {
      RUser(user: user, context: dbStorageService.context)
    }
    dbStorageService.save()
    delegate?.didLoadUsers()
  }
  
  func save(currentPage: Int) {
    localStorageService.store(value: currentPage, forKey: .currentPage)
  }
  
  private var nextPage: Int {
    return localStorageService.integer(forKey: .currentPage) + 1
  }
}

// MARK: - Assembly
extension Assembly {
  var listUserService: ListUserService {
    return DefaultListUserService(listUsers: networking.listUsers,
                                  dbStorageService: coreDataService,
                                  localStorageService: localStorageService)
  }
}
