import CoreData

struct CoreDataService: LocalStorageService {
  
  var context: NSManagedObjectContext
  
  init(databaseName: String) {
    let container = NSPersistentContainer(name: databaseName)
    container.loadPersistentStores { ( _, error) in
      container.viewContext.mergePolicy = NSRollbackMergePolicy
      guard let error = error else { return }
      fatalError("CoreData Error ===>  \(error.localizedDescription)")
    }
    context = container.viewContext
  }
  
  func save() {
    guard context.hasChanges else {
      print("CoreData ===> Nothinkg to change")
      return
    }
    do {
      try context.save()
    } catch {
      print("CoreData Save context Error ===>  \(error.localizedDescription)")
    }
  }
  
  func hideUser(with email: String) {
    let fetchRequest: NSFetchRequest<RUser> = RUser.fetchRequest()
    let predicate = NSPredicate(format: "email = %@", email)
    fetchRequest.predicate = predicate
    do {
      let items = try context.fetch(fetchRequest)
      for item in items {
        item.setValue(true, forKey: "isHidden")
      }
      save()
    } catch {
      print("CoreData find email fail ===>  \(error.localizedDescription)")
    }
  }
}

// MARK: - Assembly
var coreDataService: LocalStorageService = {
  return CoreDataService(databaseName: "Model")
}()
