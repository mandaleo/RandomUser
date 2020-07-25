struct UserNameApiResponse: Codable {
  let name: String?
  let lastName: String
  
  enum CodingKeys: String, CodingKey {
    case name = "first"
    case lastName = "last"
  }
}
