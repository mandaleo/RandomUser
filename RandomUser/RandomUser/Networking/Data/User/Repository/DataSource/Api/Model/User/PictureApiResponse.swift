struct PictureApiResponse: Codable {
  let large: String?
  let medium: String?
  let thumbnail: String?
  
  enum CodingKeys: String, CodingKey {
    case large = "large"
    case medium = "medium"
    case thumbnail = "thumbnail"
  }
}
