import RxSwift

struct UserRepository {
  
  private let apiDataSource: UserDataSource
  
  init(apiDataSource: UserDataSource) {
    self.apiDataSource = apiDataSource
  }
  
  func list(request: ListUsersRequest) -> Single<ListUsers> {
    return apiDataSource.list(request: request)
  }
}

extension Networking {
  var userRespository: UserRepository {
    return UserRepository(apiDataSource: userDataSource)
  }
  
  private var userDataSource: UserDataSource {
    return UserApiDataSource(provider: moya(),
                             listMapper: ListUserApiToDomainMapper())
  }
}
