import Foundation

private enum Defaults {
  static let defaultFormat = "yyyy-MM-dd HH:mm:ss"
  static let defaultLocale = Locale(identifier: "en_US_POSIX")
}

extension String {
  func toDate(format: String? = nil,
              locale: Locale? = nil) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format ?? Defaults.defaultFormat
    dateFormatter.locale = locale ??  Defaults.defaultLocale
    return dateFormatter.date(from: self)
  }
}
