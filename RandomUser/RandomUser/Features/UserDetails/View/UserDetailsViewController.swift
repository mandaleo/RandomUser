import UIKit

final class UserDetailsViewController: UIViewController {
  
  var presenter: UserDetailsPresenter?
  var userDetailsView: UserDetailsView?
  
  override func loadView() {
    super.loadView()
    view = userDetailsView as? UIView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.didLoad()
  }
}

// MARK: - UserDetailsUI
extension UserDetailsViewController: UserDetailsUI {
  func setupUI(with user: User) {
    title = user.name
    userDetailsView?.setup(with: user)
  }
}
