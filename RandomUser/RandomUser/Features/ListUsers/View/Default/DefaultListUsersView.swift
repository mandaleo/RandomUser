import UIKit
import SnapKit

final class DefaultListUsersView: UIView, ListUsersView {
  
  private var dataSource: ListUsersDataSource?
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
  
  func setup() {
    setupView()
    setupConstraints()
    let dataSource =  ListUsersDataSource()
    dataSource.delegate = self
    self.dataSource = dataSource
    tableView.dataSource = dataSource
    tableView.delegate = dataSource
    tableView.reloadData()
    tableView.addInfiniteScroll { [weak self] _ in
      self?.delegate?.loadMoreUsers()
    }
  }
  
  func filter(by text: String) {
    dataSource?.filter(by: text)
  }
}

// MARL: - ListUsersDataSourceDelegate
extension DefaultListUsersView: ListUsersDataSourceDelegate {
  func didSelect(user: User) {
    delegate?.didSelect(user: user)
  }
  
  func willChangeContent() {
    tableView.beginUpdates()
  }
  
  func didChangeContent() {
    tableView.endUpdates()
    tableView.finishInfiniteScroll()
  }
  
  func insertRow(at indexPath: IndexPath) {
    tableView.insertRows(at: [indexPath], with: .automatic)
  }
  
  func deleteRow(at indexPath: IndexPath) {
    tableView.deleteRows(at: [indexPath], with: .automatic)
  }
  
  func updateRow(at indexPath: IndexPath) {
    tableView.reloadRows(at: [indexPath], with: .automatic)
  }
  
  func reloadTableView() {
    tableView.reloadData()
  }
  
  func didTapOnHideUser(with email: String) {
    delegate?.didTapOnHideUser(with: email)
  }
}
