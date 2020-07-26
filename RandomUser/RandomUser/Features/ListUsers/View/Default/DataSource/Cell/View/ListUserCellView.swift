import UIKit
import SnapKit
import Kingfisher

private enum ViewLayout {
  static let spacing = CGFloat(8)
  static let mainFont = UIFont.boldSystemFont(ofSize: 20)
  static let secondaryFont = UIFont.italicSystemFont(ofSize: 16)
}

final class ListUserCellView: UIView {
  
  private var verticalStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = ViewLayout.spacing
    return stack
  }()
  
  private var nameLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .natural
    label.font = ViewLayout.mainFont
    label.numberOfLines = 0
    return label
  }()
  
  private var emailLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .natural
    label.font = ViewLayout.secondaryFont
    label.numberOfLines = 0
    return label
  }()
  
  private var phoneLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .natural
    label.font = ViewLayout.secondaryFont
    label.numberOfLines = 0
    return label
  }()
  
  func setup(with model: ListUsersCellViewModel) {
    setupView()
    nameLabel.text = model.name
    emailLabel.text = model.email
    phoneLabel.text = model.phone
  }
  
  private func setupView() {
    verticalStack.addArrangedSubview(nameLabel)
    verticalStack.addArrangedSubview(emailLabel)
    verticalStack.addArrangedSubview(phoneLabel)
    addSubview(verticalStack)
  }
}
