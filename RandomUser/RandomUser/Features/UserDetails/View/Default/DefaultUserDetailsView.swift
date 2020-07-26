import UIKit
import SnapKit
import Kingfisher

private enum ViewLayout {
  static let spacing = CGFloat(8)
  static let mainFont = UIFont.boldSystemFont(ofSize: 32)
  static let secondaryFont = UIFont.italicSystemFont(ofSize: 24)
  static let mapViewHeight = CGFloat(300)
}

final class DefaultUserDetailsView: UIView, UserDetailsView {
  
  private var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = false
    scrollView.backgroundColor = .white
    return scrollView
  }()
  
  private var mainStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = ViewLayout.spacing
    return stack
  }()
  
  private var avatarInfoStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.spacing = ViewLayout.spacing
    stack.distribution = .fillProportionally
    stack.alignment = .top
    return stack
  }()
  
  private var avatarImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private var infoStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = ViewLayout.spacing
    return stack
  }()
  
  private var genderLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .natural
    label.font = ViewLayout.secondaryFont
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
  
  private var registeredLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .natural
    label.font = ViewLayout.secondaryFont
    label.numberOfLines = 0
    return label
  }()
  
  private var mapView: MapKitLocationView = {
    return MapKitLocationView()
  }()
  
  private func setupView() {
    mainStack.addArrangedSubview(avatarInfoStack)
    avatarInfoStack.addArrangedSubview(avatarImageView)
    avatarInfoStack.addArrangedSubview(infoStack)
    infoStack.addArrangedSubview(genderLabel)
    infoStack.addArrangedSubview(registeredLabel)
    infoStack.addArrangedSubview(emailLabel)
    mainStack.addArrangedSubview(mapView)
    scrollView.addSubview(mainStack)
    addSubview(scrollView)
  }
  
  private func setupConstraints() {
    scrollView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    mainStack.snp.makeConstraints { make in
      make.leading.equalTo(self).offset(ViewLayout.spacing)
      make.top.equalTo(safeAreaLayoutGuide).offset(ViewLayout.spacing)
      make.trailing.equalTo(self).offset(-ViewLayout.spacing)
      make.bottom.greaterThanOrEqualTo(scrollView).offset(-ViewLayout.spacing)
    }
    
    mapView.snp.makeConstraints { make in
      make.height.equalTo(ViewLayout.mapViewHeight)
    }
  }
  
  func setup(with user: User) {
    setupView()
    setupConstraints()
    setupInfo(to: user)
    setupMap(with: user)
  }
  
  private func setupInfo(to user: User) {
    avatarImageView.kf.setImage(with: user.image)
    genderLabel.text = "Gender: " + user.gender
    registeredLabel.text = "Registered on: " + (user.registeredDate?.toString() ?? "Unknown")
    emailLabel.text = "Email: " + user.email
  }
  
  private func setupMap(with user: User) {
    mapView.setup(with: user.coordinates,
                  street: user.street,
                  city: user.city,
                  state: user.state)
  }
}
