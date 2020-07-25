struct PictureApiResponse: Codable {
  let large: String?
  let thumbnail: String?
  
  enum CodingKeys: String, CodingKey {
    case large
    case thumbnail
  }
}
