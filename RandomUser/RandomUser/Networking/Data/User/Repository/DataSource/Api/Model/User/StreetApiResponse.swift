struct StreetApiResponse: Codable {
  let number: Int?
  let name: String?
  
  enum CodingKeys: String, CodingKey {
    case number = "number"
    case name = "name"
  }
}
