struct ListUsers {
  let users: [User]
  let page: Int
  
  init(apiResponse: ListUsersApiResponse) {
    users = apiResponse.results?.compactMap { User(apiResponse: $0) } ?? []
    page = apiResponse.info?.page ?? 1
  }
}
