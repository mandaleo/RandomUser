import RxSwift

protocol UserDataSource {
  func list(request: ListUsersRequest) -> Single<ListUsers>
}
