protocol ListUsersProvider {
  func listUserViewController() -> ListUsersViewController
}

extension Assembly: ListUsersProvider {
  
  func listUserViewController() -> ListUsersViewController {
    let viewController = ListUsersViewController()
    let interactor = listUsersInteractor()
    let navigator = listUsersNavigator()
    let presenter = listUsersPresenter(from: viewController,
                                       interactor: interactor,
                                       navigator: navigator)
    interactor.delegate = presenter
    presenter.ui = viewController
    // TODO: - Assign view
    viewController.presenter = presenter
    return viewController
  }
  
  private func listUsersInteractor() -> ListUsersInteractor {
    return DefaultListUsersInteractor(listUserService: listUserService)
  }
  
  private func listUsersNavigator() -> ListUsersNavigator {
    return DefaultListUsersNavigator()
  }
  
  private func listUsersPresenter(from: ListUsersViewController,
                                  interactor: ListUsersInteractor,
                                  navigator: ListUsersNavigator) -> DefaultListUsersPresenter {
    return DefaultListUsersPresenter(interactor: interactor,
                                     navigator: navigator)
    
  }
}
