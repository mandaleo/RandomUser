struct LocationApiResponse: Codable {
  let street: StreetApiResponse?
  let city: String?
  let state: String?
  let coordinates: CoordinatesApiResponse?
  
  enum CodingKeys: String, CodingKey {
    case street
    case city
    case state
    case coordinates
  }
}
