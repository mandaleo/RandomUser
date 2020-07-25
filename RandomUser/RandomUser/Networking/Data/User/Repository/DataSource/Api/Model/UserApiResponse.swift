struct UserApiResponse: Codable {
  let gender: String?
  let name: UserNameApiResponse?
  let location: LocationApiResponse?
  let email: String?
  let registered: RegisteredApiResponse?
  let phone: String?
  let picture: PictureApiResponse?
  
  enum CodingKeys: String, CodingKey {
    case gender = "gender"
    case name = "name"
    case location = "location"
    case email = "email"
    case registered = "registered"
    case phone = "phone"
    case picture = "picture"
  }
}
