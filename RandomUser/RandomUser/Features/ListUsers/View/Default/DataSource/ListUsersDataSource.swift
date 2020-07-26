import UIKit

protocol ListUsersDataSourceDelegate: class, AutoMockable {
  func didSelect(user: User)
}

final class ListUsersDataSource: NSObject, UITableViewDataSource {
  
  private let users: [User]
  weak var delegate: ListUsersDataSourceDelegate?
  
  init(users: [User]) {
    self.users = users
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ListUserCell.cellIdentifier) as? ListUserCell else {
      fatalError("Maybe wrong cellIdentifier???")
    }
    let user = getItem(by: indexPath.row)
    cell.setup(with: ListUsersCellViewModel(user: user))
    return cell
  }
  
  private func getItem(by index: Int) -> User {
    guard users.indices.contains(index) else { fatalError("Index not correct") }
    return users[index]
  }
}

// MARK: - UITableViewDataSource
extension ListUsersDataSource: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let user = getItem(by: indexPath.row)
    delegate?.didSelect(user: user)
  }
}
