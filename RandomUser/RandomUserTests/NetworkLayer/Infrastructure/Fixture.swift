import Foundation

final class Fixture {
  static func load<T>(_ filePath: String) -> T {
    let bundle = Bundle(for: object_getClass(self)!)
    let jsonFile = bundle.path(forResource: filePath, ofType: "json")
    let jsonData = NSData(contentsOfFile: jsonFile!)
    // swiftlint:disable force_cast
    do {
      let json = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .allowFragments)
      return json as! T
    } catch {
      print(error)
    }

    return [:] as! T
    // swiftlint:enable force_cast
  }
}
