struct ListUsersApiResponse: Codable {
  let results: [UserApiResponse]?
  let info: InfoApiResponse?
  
  enum CodingKeys: String, CodingKey {
    case results
    case info
  }
}
