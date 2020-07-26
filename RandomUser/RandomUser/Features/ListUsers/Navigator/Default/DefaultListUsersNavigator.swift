import UIKit

final class DefaultListUsersNavigator: ListUsersNavigator {
  
  private weak var from: UIViewController?
  private let userDetailsProvider: UserDetailsProvider
  
  init(from: UIViewController,
       userDetailsProvider: UserDetailsProvider) {
    self.from = from
    self.userDetailsProvider = userDetailsProvider
  }
  
  func show(user: User) {
    guard let from = from else { fatalError("Why from is nil????") }
    from.navigationController?.pushViewController(userDetailsProvider.userDetailsViewController(for: user),
                                                  animated: true)
  }
}
