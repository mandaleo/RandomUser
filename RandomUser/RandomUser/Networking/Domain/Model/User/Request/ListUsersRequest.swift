struct ListUsersRequest {
  let page: Int
  let numberOfItems: Int
  let seed: String
  
  init(page: Int,
       numberOfItems: Int,
       seed: String) {
    self.page = page
    self.numberOfItems = numberOfItems
    self.seed = seed
  }
}

extension ListUsersRequest {
  static var mock: ListUsersRequest {
    return ListUsersRequest(page: 1,
                            numberOfItems: 20,
                            seed: "abc")
  }
}
