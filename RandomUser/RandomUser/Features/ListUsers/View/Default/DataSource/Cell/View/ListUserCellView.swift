import UIKit
import SnapKit
import Kingfisher

private enum ViewLayout {
  static let avatarSize = CGSize(width: 64, height: 64)
  static let avatarBorderWidth = CGFloat(1)
  static let avatarBorderColor = UIColor.black.cgColor
  static let spacing = CGFloat(8)
  static let mainFont = UIFont.boldSystemFont(ofSize: 20)
  static let secondaryFont = UIFont.italicSystemFont(ofSize: 16)
  static let attachmentBounds = CGRect(x: 0, y: -3,
                                       width: CGFloat(16),
                                       height: CGFloat(16))
}

final class ListUserCellView: UIView {
  
  private var mainStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.spacing = ViewLayout.spacing
    stack.distribution = .fillProportionally
    stack.alignment = .top
    return stack
  }()
  
  private var avatarImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.rounded(with: ViewLayout.avatarSize.height / 2)
    return imageView
  }()
  
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
    nameLabel.text =  model.name
    emailLabel.attributedText = model.email.concat(image: UIImage(systemName: "envelope.fill"),
                                                   bounds: ViewLayout.attachmentBounds)
    phoneLabel.attributedText = model.phone.concat(image: UIImage(systemName: "phone.circle.fill"),
                                                   bounds: ViewLayout.attachmentBounds)
    avatarImageView.kf.setImage(with: model.thumbnail)
  }
  
  private func setupView() {
    setupAvatarImageView()
    setupVerticalStack()
    addSubview(mainStack)
    mainStack.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(ViewLayout.spacing)
      make.top.equalToSuperview().offset(ViewLayout.spacing)
      make.trailing.equalToSuperview().offset(-ViewLayout.spacing)
      make.bottom.equalToSuperview().offset(-ViewLayout.spacing)
    }
  }
  
  private func setupAvatarImageView() {
    mainStack.addArrangedSubview(avatarImageView)
    avatarImageView.snp.makeConstraints { make in
      make.size.equalTo(ViewLayout.avatarSize)
    }
  }
  
  private func setupVerticalStack() {
    verticalStack.addArrangedSubview(nameLabel)
    verticalStack.addArrangedSubview(emailLabel)
    verticalStack.addArrangedSubview(phoneLabel)
    mainStack.addArrangedSubview(verticalStack)
  }
}
