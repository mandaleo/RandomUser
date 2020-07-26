import UIKit

protocol Identifiable: class {
  static var cellIdentifier: String { get }
}

extension Identifiable {
  static var cellIdentifier: String {
    return String(describing: Self.self)
  }
}

extension UITableViewCell: Identifiable {}

extension UITableView {
  func register<T: UITableViewCell>(_ cell: T.Type) {
    self.register(T.self, forCellReuseIdentifier: T.cellIdentifier)
  }
}
