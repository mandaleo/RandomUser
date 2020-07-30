import UIKit
import CoreData

protocol ListUsersDataSourceDelegate: class, AutoMockable {
  func didSelect(user: User)
  func willChangeContent()
  func didChangeContent()
  func insertRow(at indexPath: IndexPath)
  func deleteRow(at indexPath: IndexPath)
  func updateRow(at indexPath: IndexPath)
  func reloadTableView()
  func didTapOnHideUser(with email: String)
}

final class ListUsersDataSource: NSObject, UITableViewDataSource {
  
  private var fetchedResultsController: NSFetchedResultsController<RUser>
  weak var delegate: ListUsersDataSourceDelegate?
  private let isHiddenPredicate = NSPredicate(format: "isHidden == NO")
  
  init(coreDataService: DbStorageService = coreDataService) {
    let fetchRequest: NSFetchRequest<RUser> = RUser.fetchRequest()
    fetchRequest.fetchBatchSize = 20
    let sortDescriptor = NSSortDescriptor(key: "firstName", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    fetchRequest.predicate = isHiddenPredicate
    fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                          managedObjectContext: coreDataService.context,
                                                          sectionNameKeyPath: nil,
                                                          cacheName: nil)
    do {
      try fetchedResultsController.performFetch()
    } catch {
      fatalError(error.localizedDescription)
    }
    super.init()
    fetchedResultsController.delegate = self
  }
  
  func filter(by text: String) {
    defer {
      do {
        try fetchedResultsController.performFetch()
      } catch {
        fatalError(error.localizedDescription)
      }
      delegate?.reloadTableView()
    }
    guard !text.isEmpty else {
      fetchedResultsController.fetchRequest.predicate = isHiddenPredicate
      return
    }
    let predicates = NSCompoundPredicate(type: .and, subpredicates: [isHiddenPredicate,
                                                                     filters(for: text)])
    fetchedResultsController.fetchRequest.predicate = predicates
   
  }
  
  private func filters(for value: String) -> NSCompoundPredicate {
    return NSCompoundPredicate(type: .or,
                               subpredicates: [predicate(with: "firstName", value: value),
                                               predicate(with: "lastName", value: value),
                                               predicate(with: "email", value: value)])
  }
  
  private func predicate(with key: String, value: String) -> NSPredicate {
    return NSPredicate(format: "\(key) CONTAINS[c] %@", value.lowercased())
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
    cell.delegate = self
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

// MARK: - ListUserCellDelegate
extension ListUsersDataSource: ListUserCellDelegate {
  func didTapOnHideUser(with email: String) {
    delegate?.didTapOnHideUser(with: email)
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
    case .update:
      guard let indexPath = indexPath else { return }
      delegate?.updateRow(at: indexPath)
    default:
      break
    }
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    delegate?.didChangeContent()
  }
}
