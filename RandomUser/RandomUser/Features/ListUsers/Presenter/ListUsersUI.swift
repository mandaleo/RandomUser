import CoreData

protocol ListUsersUI: class, AutoMockable {
  func setupUI(with context: NSManagedObjectContext)
}
