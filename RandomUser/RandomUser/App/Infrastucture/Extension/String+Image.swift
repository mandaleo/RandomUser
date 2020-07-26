import UIKit

extension String {
  func concat(image: UIImage?, bounds: CGRect) -> NSMutableAttributedString {
    guard let image = image else { return NSMutableAttributedString(string: self) }
    let attributtedTitle = NSMutableAttributedString(string: "")
    let attachment = NSTextAttachment()
    attachment.image = image
    attachment.bounds = bounds
    let attachmentString = NSAttributedString(attachment: attachment)
    attributtedTitle.append(attachmentString)
    attributtedTitle.append(NSAttributedString(string: " " + self))
    return attributtedTitle
  }
}
