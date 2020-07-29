import UIKit

final class ListUsersViewController: UIViewController {
  
  var presenter: ListUsersPresenter?
  var listUsersView: ListUsersView?
  
  private var searchBarView: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.searchBarStyle = .prominent
    searchBar.placeholder = " Search..."
    searchBar.sizeToFit()
    searchBar.isTranslucent = false
    searchBar.showsCancelButton = true
    return searchBar
  }()
  
  override func loadView() {
    super.loadView()
    view = listUsersView as? UIView
    listUsersView?.delegate = self
    navigationItem.titleView = searchBarView
    searchBarView.delegate = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    presenter?.didLoad()
   
  }
}

// MARK: - ListUsersUI
extension ListUsersViewController: ListUsersUI {
  func setupUI() {
    listUsersView?.setup()
  }
  
  func showError(with message: String, action: UIAlertAction?) {
    showAlertError(with: message, action: action)
  }
}

// MARK: - ListsUsersViewDelegate
extension ListUsersViewController: ListsUsersViewDelegate {
  func didSelect(user: User) {
    presenter?.didSelect(user: user)
  }
  
  func didTapOnHideUser(with email: String) {
    presenter?.hideUser(with: email)
  }
  
  func loadMoreUsers() {
    presenter?.loadUsers()
  }
}

// MARK: - UISearchBarDelegate
extension ListUsersViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
    NSObject.cancelPreviousPerformRequests(withTarget: self,
                                           selector: #selector(filterList),
                                           object: nil)
    perform(#selector(filterList), with: nil, afterDelay: 0.5)
  }
  
  @objc private func filterList() {
    listUsersView?.filter(by: searchBarView.text ?? "")
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBarView.text = nil
    listUsersView?.filter(by: "")
    searchBar.resignFirstResponder()
  }
  
  private func dismissKeyboard() {
    self.view.endEditing(true)
  }
}
