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
  
  var name: String {
    return self.fistName + " " + self.lastName
  }
  
  init(apiResponse: UserApiResponse) {
    gender = apiResponse.gender ?? ""
    fistName = apiResponse.name?.name ?? ""
    lastName = apiResponse.name?.lastName ?? ""
    street = (apiResponse.location?.street?.name ?? "") + " " + "\(apiResponse.location?.street?.number ?? 0)"
    city = apiResponse.location?.city ?? ""
    state = apiResponse.location?.state ?? ""
    coordinates =  CLLocationCoordinate2D.coordinatesOrNil(latitude: apiResponse.location?.coordinates?.latitude,
                                                           longitude: apiResponse.location?.coordinates?.longitude)
    email = apiResponse.email ?? ""
    registeredDate = apiResponse.registered?.date?.toDate()
    phone = apiResponse.phone ?? ""
    thumbnail = URL(string: apiResponse.picture?.thumbnail ?? "")
    image = URL(string: apiResponse.picture?.large ?? "")
  }
}
