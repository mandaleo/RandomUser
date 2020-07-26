import UIKit
import SnapKit

final class DefaultListUsersView: UIView, ListUsersView {
  
  private var dataSource: UITableViewDataSource?
  weak var delegate: ListsUsersViewDelegate?
  
  private var tableView: UITableView = {
    return UITableView()
  }()
  
  private func setupView() {
    tableView.register(ListUserCell.self)
    addSubview(tableView)
  }
  
  private func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func setup(with users: [User]) {
    setupView()
    setupConstraints()
    dataSource = ListUsersDataSource(users: users)
    tableView.dataSource = dataSource
    tableView.delegate = dataSource as? UITableViewDelegate
    tableView.reloadData()
  }
}
