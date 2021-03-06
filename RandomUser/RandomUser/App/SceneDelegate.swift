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
    if let directoryLocation = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {
      print("Documents Directory: \(directoryLocation)Application Support")
    }
  }
  
  func setRootViewController() -> UIViewController {
    let rootController = randonUser.listUserViewController()
    let navigationVC = UINavigationController(rootViewController: rootController)
    return navigationVC
  }
}
