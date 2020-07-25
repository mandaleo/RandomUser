import RxSwift
import Moya

struct UserApiDataSource: UserDataSource {
  
  private let provider: MoyaProvider<UserService>
  
  func list(request: ListUsersRequest) -> Single<(users: [User], page: Int)> {
    <#code#>
  }
}
