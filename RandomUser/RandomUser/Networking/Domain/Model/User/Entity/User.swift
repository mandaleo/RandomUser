import Foundation
import CoreLocation

struct User {
  
  let gender: String
  let fistName: String
  let lastName: String
  let street: String
  let city: String
  let state: String
  let coordinates: CLLocationCoordinate2D?
  let email: String
  let registeredDate: Date?
  let phone: String
  let thumbnail: URL?
  let image: URL?
  var isHidden: Bool
  
  var name: String {
    return self.fistName + " " + self.lastName
  }
  
  init(apiResponse: UserApiResponse) {
    gender = apiResponse.gender ?? ""
    fistName = apiResponse.name?.name ?? ""
    lastName = apiResponse.name?.lastName ?? ""
    street = (apiResponse.location?.street?.name ?? "") + ", " + "\(apiResponse.location?.street?.number ?? 0)"
    city = apiResponse.location?.city ?? ""
    state = apiResponse.location?.state ?? ""
    coordinates =  CLLocationCoordinate2D.coordinatesOrNil(latitude: apiResponse.location?.coordinates?.latitude,
                                                           longitude: apiResponse.location?.coordinates?.longitude)
    email = apiResponse.email ?? ""
    registeredDate = apiResponse.registered?.date?.toDate()
    phone = apiResponse.phone ?? ""
    thumbnail = URL(string: apiResponse.picture?.thumbnail ?? "")
    image = URL(string: apiResponse.picture?.large ?? "")
    isHidden = false
  }
  
  init(gender: String?,
       fistName: String?,
       lastName: String?,
       street: String?,
       city: String?,
       state: String?,
       coordinates: CLLocationCoordinate2D?,
       email: String?,
       registeredDate: Date?,
       phone: String?,
       thumbnail: URL?,
       image: URL?,
       isHidden: Bool) {
    self.gender = gender ?? ""
    self.fistName = fistName ?? ""
    self.lastName = lastName ?? ""
    self.street = street ?? ""
    self.city = city ?? ""
    self.state = state ?? ""
    self.coordinates = coordinates
    self.email = email ?? ""
    self.registeredDate = registeredDate
    self.phone = phone ?? ""
    self.thumbnail = thumbnail
    self.image = image
    self.isHidden = isHidden
  }
}

extension User {
  static var mock: User {
    return User(gender: "female",
                fistName: "Sedef",
                lastName: "Koçyiğit",
                street: "Tunalı Hilmi Cd, 7801",
                city: "Şırnak",
                state: "Afyonkarahisar",
                coordinates: CLLocationCoordinate2D(latitude: 74.4451, longitude: 145.5838),
                email: "sedef.kocyigit@example.com",
                registeredDate: "2008-06-29T08:34:20.967Z".toDate(),
                phone: "(700)-675-1814",
                thumbnail: URL(string: "https://randomuser.me/api/portraits/thumb/women/95.jpg"),
                image: URL(string: "https://randomuser.me/api/portraits/women/95.jpg"),
                isHidden: false)
  }
  
  static var mock2: User {
    return User(gender: "male",
                fistName: "Maurice",
                lastName: "Jimenez",
                street: "Walnut Hill Ln, 138",
                city: "Boulder",
                state: "Washington",
                coordinates: CLLocationCoordinate2D(latitude: -41.7203, longitude: 11.2935),
                email: "maurice.jimenez@example.com",
                registeredDate: "1950-04-12T13:08:50.686Z".toDate(),
                phone: "(811)-087-5515",
                thumbnail: URL(string: "https://randomuser.me/api/portraits/thumb/men/58.jpg"),
                image: URL(string: "https://randomuser.me/api/portraits/men/58.jpg"),
                isHidden: false)
  }
}
