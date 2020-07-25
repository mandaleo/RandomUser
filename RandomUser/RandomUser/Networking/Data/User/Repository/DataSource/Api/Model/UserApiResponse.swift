struct UserApiResponse: Codable {
  let gender: String?
  let name: UserNameApiResponse?
  let location: LocationApiResponse?
  let email: String?
  let registered: RegisteredApiResponse?
  let phone: String?
  let picture: PictureApiResponse?
  
  enum CodingKeys: String, CodingKey {
    case gender
    case name
    case location
    case email
    case registered
    case phone
    case picture
  }
}
