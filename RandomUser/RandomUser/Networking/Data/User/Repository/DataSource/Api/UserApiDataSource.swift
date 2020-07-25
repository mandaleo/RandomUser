import RxSwift
import Moya

struct UserApiDataSource: UserDataSource {
  
  private let provider: MoyaProvider<UserService>
  private let listMapper: ListUserApiToDomainMapper
  
  init(provider: MoyaProvider<UserService>,
       listMapper: ListUserApiToDomainMapper) {
    self.provider = provider
    self.listMapper = listMapper
  }
  
  func list(request: ListUsersRequest) -> Single<ListUsers> {
    return provider.rx
      .request(.list(request))
      .filterSuccessfulStatusCodes()
      .map(ListUsersApiResponse.self)
      .map(listMapper.map)
  }
}
