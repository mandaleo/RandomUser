import Moya

struct ListUsersEndpoint: Endpoint {
  
  private let request: ListUsersRequest
  
  init(request: ListUsersRequest) {
    self.request = request
  }
  
  var path: String {
    return ""
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var task: Task {
    guard let parameters = parameters() else { return .requestPlain }
     return .requestParameters(parameters: parameters,
                                 encoding: URLEncoding.default)
  }
  
  var headers: [String: String]? {
     return nil
   }
   
   func parameters() -> [String: Any]? {
    return ["page": request.page,
            "results": request.numberOfItems,
            "seed": request.seed]
   }
}
