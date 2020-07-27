import CoreData

protocol ListUsersInteractorDelegate: class, AutoMockable {
  func didLoadUsers(with context: NSManagedObjectContext)
  func didFailLoadingUsers(with error: Error)
}
