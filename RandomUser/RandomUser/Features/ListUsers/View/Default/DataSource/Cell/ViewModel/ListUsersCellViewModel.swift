import Foundation

struct ListUsersCellViewModel {
  let name: String
  let email: String
  let thumbnail: URL?
  let phone: String
  
  init(user: User) {
    name = user.name
    email = user.email
    thumbnail = user.thumbnail
    phone = user.phone
  }
}
