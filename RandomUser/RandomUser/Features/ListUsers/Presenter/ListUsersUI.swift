protocol ListUsersUI: class, AutoMockable {
  func setupUI()
  func showError(with message: String, action: UIAlertAction?)
}
