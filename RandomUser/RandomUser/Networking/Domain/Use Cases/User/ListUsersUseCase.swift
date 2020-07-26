import RxSwift

protocol ListUsersUseCase {
  func execute(request: ListUsersRequest) -> Single<ListUsers>
}
