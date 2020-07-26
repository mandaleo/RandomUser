import UIKit

final class ListUsersViewController: UIViewController {
  
  var presenter: ListUsersPresenter?
  var listUsersView: ListUsersView?
  
  override func loadView() {
    super.loadView()
    view = listUsersView as? UIView
    listUsersView?.delegate = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    presenter?.didLoad()
   
  }
}

// MARK: - ListUsersUI
extension ListUsersViewController: ListUsersUI {
  func setupUI(with users: [User]) {
    listUsersView?.setup(with: users)
  }
}

// MARK: - ListsUsersViewDelegate
extension ListUsersViewController: ListsUsersViewDelegate {
  
}
