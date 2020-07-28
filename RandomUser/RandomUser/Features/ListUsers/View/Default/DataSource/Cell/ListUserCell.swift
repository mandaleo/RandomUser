import UIKit
import SnapKit

protocol ListUserCellDelegate: class, AutoMockable {
  func didTapOnHideUser(with email: String)
}

final class ListUserCell: UITableViewCell {
  
  weak var delegate: ListUserCellDelegate?
  private var model: ListUsersCellViewModel?
  
  private var cellView: ListUserCellView = {
    return ListUserCellView()
  }()
  
  private func setupView() {
    cellView.delegate = self
    addSubview(cellView)
    selectionStyle = .none
  }
  
  private func setupConstraints() {
    cellView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func setup(with model: ListUsersCellViewModel) {
    self.model = model
    setupView()
    setupConstraints()
    cellView.setup(with: model)
  }
}

// MARK: - ListUserCellViewDelegate
extension ListUserCell: ListUserCellViewDelegate {
  func didTapOnHideUser() {
    guard let email = model?.email else { return }
    delegate?.didTapOnHideUser(with: email)
  }
}
