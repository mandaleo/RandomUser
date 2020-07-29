import CoreData

protocol DbStorageService: AutoMockable {
  var context: NSManagedObjectContext { get }
  func save()
  func hideUser(with email: String)
  func clear()
}
