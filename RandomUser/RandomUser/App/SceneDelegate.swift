import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard  (scene as? UIWindowScene) != nil else { return }
    if let windowScene = scene as? UIWindowScene {
      self.window = UIWindow(windowScene: windowScene)
      self.window?.rootViewController = setRootViewController()
      self.window?.makeKeyAndVisible()
    }
  }
  
  /// This method configure the first view controller of the app and injects its dependencis
  ///
  /// - Returns: Return the first View Controller of the app
  func setRootViewController() -> UIViewController {
    let rootController = FakeViewController()
    let navigationVC = UINavigationController(rootViewController: rootController)
    return navigationVC
  }
}
