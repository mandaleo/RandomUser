import CoreData

struct CoreDataService: LocalStorageService {
  
  var context: NSManagedObjectContext
  
  init(databaseName: String) {
    let container = NSPersistentContainer(name: databaseName)
    container.loadPersistentStores { ( _, error) in
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
      fatalError("CoreData Save context Error ===>  \(error.localizedDescription)")
    }
  }
}

// MARK: - Assembly
extension Assembly {
  var coreDataService: LocalStorageService {
    return CoreDataService(databaseName: "Model")
  }
}

