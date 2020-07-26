import UIKit
import SnapKit

final class ListUserCell: UITableViewCell {
  
  private var cellView: ListUserCellView = {
    return ListUserCellView()
  }()
  
  init() {
    super.init(style: .default, reuseIdentifier: ListUserCell.cellIdentifier)
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
    setupConstraints()
  }
  
  private func setupView() {
    addSubview(cellView)
  }
  
  private func setupConstraints() {
    cellView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func setup(with model: ListUsersCellViewModel) {
    cellView.setup(with: model)
  }
}
