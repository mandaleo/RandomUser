struct CoordinatesApiResponse: Codable {
  let latitude: String?
  let longitude: String?
  
  enum CodingKeys: String, CodingKey {
    case latitude
    case longitude
  }
}
