import RxSwift

protocol ListUserServiceDelegate: class, AutoMockable {
  func didLoad(users: [User], page: Int)
  func didFailLoadingUsers(with error: Error)
}

protocol ListUserService: AutoMockable {
  var delegate: ListUserServiceDelegate? { get set }
  func getUsers(with seed: String, numberOfItems: Int, page: Int)
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
  
  func getUsers(with seed: String, numberOfItems: Int, page: Int) {
    let request = ListUsersRequest(page: page, numberOfItems: numberOfItems, seed: seed)
    listUsers.execute(request: request).subscribe(onSuccess: { [weak self] listUsers in
      self?.storage(users: listUsers.users)
      self?.delegate?.didLoad(users: listUsers.users, page: listUsers.page)
    }, onError: { [weak self] error in
      self?.delegate?.didFailLoadingUsers(with: error)
      }).disposed(by: bag)
  }
  
  private func storage(users: [User]) {
    for user in users {
      RUser(user: user, context: localStorageService.context)
      localStorageService.save()
    }
  }
}

// MARK: - Assembly
extension Assembly {
  var listUserService: ListUserService {
    return DefaultListUserService(listUsers: networking.listUsers,
                                  localStorageService: coreDataService)
  }
}
