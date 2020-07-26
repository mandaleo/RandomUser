import UIKit

final class ListUsersDataSource: NSObject, UITableViewDataSource {
  
  private let users: [User]
  
  init(users: [User]) {
    self.users = users
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ListUserCell.cellIdentifier) as? ListUserCell else { fatalError("Maybe wrong cellIdentifier???") }
    guard let item = getItem(by: indexPath.row) else { fatalError("Index not correct") }
    cell.setup(with: ListUsersCellViewModel(user: item))
    return cell
  }
  
  private func getItem(by index: Int) -> User? {
    guard users.indices.contains(index) else { return nil }
    return users[index]
  }
}
