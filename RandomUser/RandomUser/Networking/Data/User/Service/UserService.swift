import Moya

enum UserService: TargetType {
  case list(ListUsersRequest)
}

extension UserService {
  var baseURL: URL {
    return Service.baseUrl
  }
  
  var path: String {
    return endpoint(for: self).path
  }
  
  var method: Moya.Method {
    return endpoint(for: self).method
  }
  
  var task: Task {
    return endpoint(for: self).task
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var headers: [String: String]? {
    return endpoint(for: self).headers
  }
}

private func endpoint(for service: UserService) -> Endpoint {
  switch service {
  case .list(let request):
    return ListUsersEndpoint(request: request)
  }
}
