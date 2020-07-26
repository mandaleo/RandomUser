import UIKit

final class ListUsersViewController: UIViewController {
  
  var presenter: ListUsersPresenter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.didLoad()
    self.view.backgroundColor = .yellow
  }
}

// MARK: - ListUsersUI
extension ListUsersViewController: ListUsersUI {
  
}
