import UIKit

final class ListUsersDataSource: NSObject, UITableViewDataSource {
  
  private let users: [User]
  
  init(users: [User]) {
    self.users = users
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    <#code#>
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    <#code#>
  }
}
