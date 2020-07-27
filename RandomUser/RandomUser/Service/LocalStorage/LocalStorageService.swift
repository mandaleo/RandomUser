import CoreData

protocol LocalStorageService: AutoMockable {
  var context: NSManagedObjectContext { get }
  func save()
}
