struct UserNameApiResponse: Codable {
  let name: String?
  let surname: String
  
  enum CodingKeys: String, CodingKey {
    case name = "first"
    case surname = "last"
  }
}
