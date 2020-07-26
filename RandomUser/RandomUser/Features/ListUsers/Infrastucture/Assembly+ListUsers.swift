protocol ListUsersProvider {
  func listUserViewController() -> ListUsersViewController
}

extension Assembly: ListUsersProvider {
  
  func listUserViewController() -> ListUsersViewController {
    let viewController = ListUsersViewController()
    return viewController
  }
}
