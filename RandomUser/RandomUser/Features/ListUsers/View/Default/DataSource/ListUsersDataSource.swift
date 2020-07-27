import UIKit
import CoreData

protocol ListUsersDataSourceDelegate: class, AutoMockable {
  func didSelect(user: User)
  func willChangeContent()
  func didChangeContent()
  func insertRow(at indexPath: IndexPath)
  func deleteRow(at indexPath: IndexPath)
}

final class ListUsersDataSource: NSObject, UITableViewDataSource {
  
  private var fetchedResultsController: NSFetchedResultsController<RUser>
  weak var delegate: ListUsersDataSourceDelegate?
  
  init(coreDataService: LocalStorageService = coreDataService) {
    let fetchRequest: NSFetchRequest<RUser> = RUser.fetchRequest()
    fetchRequest.fetchBatchSize = 20
    let sortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                          managedObjectContext: coreDataService.context,
                                                          sectionNameKeyPath: nil,
                                                          cacheName: "users")
    do {
      try fetchedResultsController.performFetch()
    } catch {
      fatalError(error.localizedDescription)
    }
    super.init()
    fetchedResultsController.delegate = self
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fetchedResultsController.fetchedObjects?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ListUserCell.cellIdentifier) as? ListUserCell else {
      fatalError("Maybe wrong cellIdentifier???")
    }
    let user = getItem(by: indexPath)
    cell.setup(with: ListUsersCellViewModel(user: user))
    return cell
  }
  
  private func getItem(by indexPath: IndexPath) -> User {
    return fetchedResultsController.object(at: indexPath).toUser
  }
}

// MARK: - UITableViewDataSource
extension ListUsersDataSource: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let user = getItem(by: indexPath)
    delegate?.didSelect(user: user)
  }
}

// MARK: - NSFetchedResultsControllerDelegate
extension ListUsersDataSource: NSFetchedResultsControllerDelegate {
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    delegate?.willChangeContent()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                  didChange anObject: Any,
                  at indexPath: IndexPath?,
                  for type: NSFetchedResultsChangeType,
                  newIndexPath: IndexPath?) {
    switch type {
    case .insert:
      guard let newIndexPath = newIndexPath else { return }
      delegate?.insertRow(at: newIndexPath)
    case .delete:
      guard let indexPath = indexPath else { return }
      delegate?.deleteRow(at: indexPath)
    default:
      break
    }
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    delegate?.didChangeContent()
  }
}
