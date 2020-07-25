import Foundation

struct Service {
  static var baseUrl: URL {
    return URL(string: Environment.baseUrl)!
  }
}
