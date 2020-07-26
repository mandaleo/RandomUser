import RxSwift

protocol ListUserServiceDelegate: class, AutoMockable {
  func load(users: [User], page: Int)
  func didFailLoadingUsers(with error: Error)
}

protocol ListUserService: AutoMockable {
  var delegate: ListUserServiceDelegate? { get set }
  func getUsers(with seed: String, numberOfItems: Int, page: Int)
}

class DefaultListUserService: ListUserService {
  
  weak var delegate: ListUserServiceDelegate?
  private let listUsers: ListUsersUseCase
  private let bag = DisposeBag()
  
  init(listUsers: ListUsersUseCase) {
    self.listUsers = listUsers
  }
  
  func getUsers(with seed: String, numberOfItems: Int, page: Int) {
    let request = ListUsersRequest(page: page, numberOfItems: numberOfItems, seed: seed)
    listUsers.execute(request: request).subscribe(onSuccess: { [weak self] listUsers in
      self?.delegate?.load(users: listUsers.users, page: listUsers.page)
    }, onError: { [weak self] error in
      self?.delegate?.didFailLoadingUsers(with: error)
      }).disposed(by: bag)
  }
}

// MARK: - Assembly
extension Assembly {
  var lisUserService: ListUserService {
    return DefaultListUserService(listUsers: networking.listUsers)
  }
}
