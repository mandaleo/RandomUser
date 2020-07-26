protocol ListUsersProvider {
  func listUserViewController() -> ListUsersViewController
}

extension Assembly: ListUsersProvider {
  
  func listUserViewController() -> ListUsersViewController {
    let viewController = ListUsersViewController()
    let interactor = listUsersInteractor()
    let navigator = listUsersNavigator(from: viewController)
    let presenter = listUsersPresenter(interactor: interactor,
                                       navigator: navigator)
    interactor.delegate = presenter
    presenter.ui = viewController
    viewController.listUsersView = listUsersView
    viewController.presenter = presenter
    return viewController
  }
  
  private func listUsersInteractor() -> ListUsersInteractor {
    return DefaultListUsersInteractor(listUserService: listUserService)
  }
  
  private func listUsersNavigator(from: ListUsersViewController) -> ListUsersNavigator {
    return DefaultListUsersNavigator(from: from,
                                     userDetailsProvider: self)
  }
  
  private func listUsersPresenter(interactor: ListUsersInteractor,
                                  navigator: ListUsersNavigator) -> DefaultListUsersPresenter {
    return DefaultListUsersPresenter(interactor: interactor,
                                     navigator: navigator)
    
  }
  
  private var listUsersView: ListUsersView {
    return DefaultListUsersView()
  }
}
