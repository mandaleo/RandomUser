import UIKit

extension UIImageView {
  func rounded(with cornerRadius: CGFloat) {
    layer.borderWidth = 1
    layer.masksToBounds = false
    layer.borderColor = UIColor.black.cgColor
    layer.cornerRadius = cornerRadius
    clipsToBounds = true
  }
}
