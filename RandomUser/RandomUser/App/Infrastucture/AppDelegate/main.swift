private func delegateClassName() -> String? {
  let isRunningUITests = CommandLine.arguments.contains("enable-ui-testing")
  return isRunningUITests == true ? NSStringFromClass(MockAppDelegate.self) : NSStringFromClass(AppDelegate.self)
}

_ = UIApplicationMain(
  CommandLine.argc,
  CommandLine.unsafeArgv,
  nil,
  delegateClassName()
)
