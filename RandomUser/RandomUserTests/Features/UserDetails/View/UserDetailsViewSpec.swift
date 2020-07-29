import XCTest
import SnapshotTesting
@testable import RandomUser

final class UserDetailsViewSpec: XCTestCase {
  
func test_load_view() {
    let child = userDetailsView
    child.setup(with: User.mock)
    let container = containerView(with: child)
    assertSnapshot(matching: container, as: .image)
  }
}

extension UserDetailsViewSpec {
  private var userDetailsView: DefaultUserDetailsView {
    return DefaultUserDetailsView()
  }
  
  private func containerView(with view: UIView) -> UIView {
    let containerView = UIView(frame: CGRect(origin: .zero,
                                             size: CGSize(width: 375, height: 812)))
    containerView.addSubview(view)
    view.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    return containerView
  }
}
