struct InfoApiResponse: Codable {
  let page: Int?
  
  enum CodingKeys: String, CodingKey {
    case page = "page"
  }
}
