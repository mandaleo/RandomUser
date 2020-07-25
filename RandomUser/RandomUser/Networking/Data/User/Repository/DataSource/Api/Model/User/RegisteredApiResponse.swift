struct RegisteredApiResponse: Codable {
  let date: String?
  
  enum CodingKeys: String, CodingKey {
    case date = "date"
  }
}
