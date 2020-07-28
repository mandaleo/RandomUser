protocol LocalStorageService: AutoMockable {
  func store(value: Int, forKey key: LocalStorageKey)
  func integer(forKey key: LocalStorageKey) -> Int
}

struct UserDefaultsLocalStorage: LocalStorageService {
  
  private let userDefaults: UserDefaults
  
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
  }

  func store(value: Int, forKey key: LocalStorageKey) {
    userDefaults.set(value, forKey: key.rawValue)
  }
  
  func integer(forKey key: LocalStorageKey) -> Int {
    return userDefaults.integer(forKey: key.rawValue)
  }
}

// MARK: - Assembly
extension Assembly {
  var localStorageService: LocalStorageService {
    return UserDefaultsLocalStorage(userDefaults: UserDefaults.standard)
  }
}
