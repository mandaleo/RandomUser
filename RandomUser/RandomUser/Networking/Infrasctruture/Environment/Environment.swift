import Foundation

struct Environment {
  static var baseUrl = value(named: .baseUrl)
}

extension Environment {
  private static func value(named name: Constant) -> String {
    return value(named: name.rawValue)
  }
  
  private static func value(named name: String) -> String {
    let key = name
    let value = valueFromPlist(named: key)
    guard !value.isEmpty else { fatalError() }
    return value
  }
  
  private static func valueFromPlist(named: String) -> String {
    guard let url = Bundle.main.path(forResource: "Environment",
                                     ofType: "plist") else { fatalError() }
    guard let dictionary = NSDictionary(contentsOfFile: url) else { fatalError() }
    guard let value = dictionary.value(forKey: named) as? String else { fatalError() }
    return value
  }
}

private enum Constant: String {
  case baseUrl = "BASE_URL"
}
