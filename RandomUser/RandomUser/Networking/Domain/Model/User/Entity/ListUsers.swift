struct ListUsers {
  let users: [User]
  let page: Int
  
  init(apiResponse: ListUsersApiResponse) {
    users = apiResponse.results?.compactMap { User(apiResponse: $0) } ?? []
    page = apiResponse.info?.page ?? 1
  }
  
  fileprivate init(users: [User],
                   page: Int) {
    self.users = users
    self.page = page
  }
}

// MARK: - Mocks
extension ListUsers {
  static var mock: ListUsers {
    return ListUsers(users: [.mock, .mock2], page: 1)
  }
}
