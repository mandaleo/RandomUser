import Moya

protocol Endpoint {
  var path: String { get }
  var method: Moya.Method { get }
  var task: Task { get }
  var headers: [String: String]? { get }
  func parameters() -> [String: Any]?
}
