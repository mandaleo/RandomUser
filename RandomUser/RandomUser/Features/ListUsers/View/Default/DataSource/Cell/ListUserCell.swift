import UIKit
import SnapKit

final class ListUserCell: UITableViewCell {
  
  private var cellView: ListUserCellView = {
    return ListUserCellView()
  }()
  
  private func setupView() {
    addSubview(cellView)
    selectionStyle = .none
  }
  
  private func setupConstraints() {
    cellView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func setup(with model: ListUsersCellViewModel) {
    setupView()
    setupConstraints()
    cellView.setup(with: model)
  }
}
