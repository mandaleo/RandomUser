protocol UserDetailsProvider {
  func userDetailsViewController(for user: User) -> UserDetailsViewController
}

extension Assembly: UserDetailsProvider {
  
  func userDetailsViewController(for user: User) -> UserDetailsViewController {
    let viewController = UserDetailsViewController()
    let presenter = listUsersPresenter(user: user)
    presenter.ui = viewController
    viewController.userDetailsView = userDetailsView
    viewController.presenter = presenter
    return viewController
  }
  
  private func listUsersPresenter(user: User) -> DefaultUserDetailsPresenter {
    return DefaultUserDetailsPresenter(user: user)
    
  }
  
  private var userDetailsView: UserDetailsView {
    return DefaultUserDetailsView()
  }
}
