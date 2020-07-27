import CoreData
import CoreLocation

extension RUser {
  @discardableResult
  convenience init(user: User, context: NSManagedObjectContext) {
    self.init(context: context)
    gender = user.gender
    firstName = user.fistName
    lastName = user.lastName
    street = user.street
    city = user.city
    state = user.state
    latitude = Double(user.coordinates?.latitude ?? 0)
    longitude = Double(user.coordinates?.longitude ?? 0)
    email = user.email
    registeredDate = user.registeredDate
    phone = user.phone
    thumbnail = user.thumbnail?.absoluteString
    image = user.image?.absoluteString
    isHidden = user.isHidden
  }
}

extension RUser {
  var toUser: User {
    return User(gender: gender,
                fistName: firstName,
                lastName: lastName,
                street: street,
                city: city,
                state: state,
                coordinates: CLLocationCoordinate2D.coordinatesOrNil(latitude: latitude ,
                                                                     longitude: longitude),
                email: email,
                registeredDate: registeredDate,
                phone: phone,
                thumbnail: URL(string: thumbnail ?? ""),
                image: URL(string: image ?? ""),
                isHidden: isHidden)
  }
}
