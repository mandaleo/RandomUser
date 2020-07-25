struct ListUserApiToDomainMapper: Mappable {
  
  func map(_ from: ListUsersApiResponse) -> ListUsers {
    return ListUsers(apiResponse: from)
  }
}
