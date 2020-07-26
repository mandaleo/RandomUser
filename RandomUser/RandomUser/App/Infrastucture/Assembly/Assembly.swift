final class Assembly {
  fileprivate static let shared = Assembly()
}

var randonUser: Assembly {
  return Assembly.shared
}
