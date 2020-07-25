import RxSwift

protocol UserDataSource {
  func list(request: ListUsersRequest) -> Single<(users: [User], page: Int)>
}
