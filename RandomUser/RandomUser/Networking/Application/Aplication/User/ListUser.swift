import RxSwift

struct ListUser: ListUsersUseCase {
  
  private let repository: UserRepository
  
  init(repository: UserRepository) {
    self.repository = repository
  }
  
  func execute(request: ListUsersRequest) -> Single<ListUsers> {
    return repository.list(request: request)
  }
}
