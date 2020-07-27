import UIKit
import CoreData

protocol ListUsersDataSourceDelegate: class, AutoMockable {
  func didSelect(user: User)
}

final class ListUsersDataSource: NSObject, UITableViewDataSource {
  
  private let fetchedResultsController: NSFetchedResultsController<RUser>
  private let coreDataService: LocalStorageService
  weak var delegate: ListUsersDataSourceDelegate?
  
  init(coreDataService: LocalStorageService = randonUser.coreDataService) {
    self.coreDataService = coreDataService
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
