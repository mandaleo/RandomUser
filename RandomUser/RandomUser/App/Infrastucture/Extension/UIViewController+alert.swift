extension UIViewController {
  func showAlertError(with message: String, action: UIAlertAction?) {
    let alert = UIAlertController(title: "Error",
                                  message: message ,
                                  preferredStyle: .alert)
    if let action = action {
      alert.addAction(action)
    }
    
    let cancelAction = UIAlertAction(title: "Cancel",
                                     style: .cancel) { [weak self] _ in
                                      self?.dismiss(animated: true, completion: nil)
    }
    alert.addAction(cancelAction)
    self.present(alert, animated: true, completion: nil)
  }
}
