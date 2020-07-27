import CoreLocation

extension CLLocationCoordinate2D {
  static func coordinatesOrNil(latitude: String?, longitude: String?) -> CLLocationCoordinate2D? {
    guard let latitudeStr = latitude else { return nil }
    guard let latitude = Double(latitudeStr) else { return nil }
    guard let longitudeStr = longitude else { return nil }
    guard let longitude = Double(longitudeStr) else { return nil }
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
  
  static func coordinatesOrNil(latitude: Double?, longitude: Double?) -> CLLocationCoordinate2D? {
    guard let latitude = latitude else { return nil }
    guard let longitude = longitude else { return nil }
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
