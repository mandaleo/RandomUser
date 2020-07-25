struct ListUsersApiResponse: Codable {
  let results: [String]?
  let info: InfoApiResponse?
  
  enum CodingKeys: String, CodingKey {
    case results = "results"
    case info = "info"
  }
}

