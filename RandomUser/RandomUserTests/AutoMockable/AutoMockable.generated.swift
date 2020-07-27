// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import RandomUser
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class ListUserServiceMock: NSObject, ListUserService {
    var delegate: ListUserServiceDelegate?

    //MARK: - getUsers

    private(set) var getUsersWithNumberOfItemsPageCallsCount = 0
    var getUsersWithNumberOfItemsPageCalled: Bool {
        return getUsersWithNumberOfItemsPageCallsCount > 0
    }
    private(set) var getUsersWithNumberOfItemsPageReceivedArguments: (seed: String, numberOfItems: Int, page: Int)?
    private(set) var getUsersWithNumberOfItemsPageReceivedInvocations: [(seed: String, numberOfItems: Int, page: Int)] = []
    var getUsersWithNumberOfItemsPageClosure: ((String, Int, Int) -> Void)?

    func getUsers(with seed: String, numberOfItems: Int, page: Int) {
        getUsersWithNumberOfItemsPageCallsCount += 1
        getUsersWithNumberOfItemsPageReceivedArguments = (seed: seed, numberOfItems: numberOfItems, page: page)
        getUsersWithNumberOfItemsPageReceivedInvocations.append((seed: seed, numberOfItems: numberOfItems, page: page))
        getUsersWithNumberOfItemsPageClosure?(seed, numberOfItems, page)
    }

}
class ListUserServiceDelegateMock: NSObject, ListUserServiceDelegate {

    //MARK: - didLoadUsers

    private(set) var didLoadUsersCallsCount = 0
    var didLoadUsersCalled: Bool {
        return didLoadUsersCallsCount > 0
    }
    var didLoadUsersClosure: (() -> Void)?

    func didLoadUsers() {
        didLoadUsersCallsCount += 1
        didLoadUsersClosure?()
    }

    //MARK: - didFailLoadingUsers

    private(set) var didFailLoadingUsersWithCallsCount = 0
    var didFailLoadingUsersWithCalled: Bool {
        return didFailLoadingUsersWithCallsCount > 0
    }
    private(set) var didFailLoadingUsersWithReceivedError: Error?
    private(set) var didFailLoadingUsersWithReceivedInvocations: [Error] = []
    var didFailLoadingUsersWithClosure: ((Error) -> Void)?

    func didFailLoadingUsers(with error: Error) {
        didFailLoadingUsersWithCallsCount += 1
        didFailLoadingUsersWithReceivedError = error
        didFailLoadingUsersWithReceivedInvocations.append(error)
        didFailLoadingUsersWithClosure?(error)
    }

}
class ListUsersDataSourceDelegateMock: NSObject, ListUsersDataSourceDelegate {

    //MARK: - didSelect

    private(set) var didSelectUserCallsCount = 0
    var didSelectUserCalled: Bool {
        return didSelectUserCallsCount > 0
    }
    private(set) var didSelectUserReceivedUser: User?
    private(set) var didSelectUserReceivedInvocations: [User] = []
    var didSelectUserClosure: ((User) -> Void)?

    func didSelect(user: User) {
        didSelectUserCallsCount += 1
        didSelectUserReceivedUser = user
        didSelectUserReceivedInvocations.append(user)
        didSelectUserClosure?(user)
    }

    //MARK: - willChangeContent

    private(set) var willChangeContentCallsCount = 0
    var willChangeContentCalled: Bool {
        return willChangeContentCallsCount > 0
    }
    var willChangeContentClosure: (() -> Void)?

    func willChangeContent() {
        willChangeContentCallsCount += 1
        willChangeContentClosure?()
    }

    //MARK: - didChangeContent

    private(set) var didChangeContentCallsCount = 0
    var didChangeContentCalled: Bool {
        return didChangeContentCallsCount > 0
    }
    var didChangeContentClosure: (() -> Void)?

    func didChangeContent() {
        didChangeContentCallsCount += 1
        didChangeContentClosure?()
    }

    //MARK: - insertRow

    private(set) var insertRowAtCallsCount = 0
    var insertRowAtCalled: Bool {
        return insertRowAtCallsCount > 0
    }
    private(set) var insertRowAtReceivedIndexPath: IndexPath?
    private(set) var insertRowAtReceivedInvocations: [IndexPath] = []
    var insertRowAtClosure: ((IndexPath) -> Void)?

    func insertRow(at indexPath: IndexPath) {
        insertRowAtCallsCount += 1
        insertRowAtReceivedIndexPath = indexPath
        insertRowAtReceivedInvocations.append(indexPath)
        insertRowAtClosure?(indexPath)
    }

    //MARK: - deleteRow

    private(set) var deleteRowAtCallsCount = 0
    var deleteRowAtCalled: Bool {
        return deleteRowAtCallsCount > 0
    }
    private(set) var deleteRowAtReceivedIndexPath: IndexPath?
    private(set) var deleteRowAtReceivedInvocations: [IndexPath] = []
    var deleteRowAtClosure: ((IndexPath) -> Void)?

    func deleteRow(at indexPath: IndexPath) {
        deleteRowAtCallsCount += 1
        deleteRowAtReceivedIndexPath = indexPath
        deleteRowAtReceivedInvocations.append(indexPath)
        deleteRowAtClosure?(indexPath)
    }

    //MARK: - reloadTableView

    private(set) var reloadTableViewCallsCount = 0
    var reloadTableViewCalled: Bool {
        return reloadTableViewCallsCount > 0
    }
    var reloadTableViewClosure: (() -> Void)?

    func reloadTableView() {
        reloadTableViewCallsCount += 1
        reloadTableViewClosure?()
    }

}
class ListUsersInteractorMock: NSObject, ListUsersInteractor {
    var delegate: ListUsersInteractorDelegate?

    //MARK: - getUsers

    private(set) var getUsersWithNumberOfItemsPageCallsCount = 0
    var getUsersWithNumberOfItemsPageCalled: Bool {
        return getUsersWithNumberOfItemsPageCallsCount > 0
    }
    private(set) var getUsersWithNumberOfItemsPageReceivedArguments: (seed: String, numberOfItems: Int, page: Int)?
    private(set) var getUsersWithNumberOfItemsPageReceivedInvocations: [(seed: String, numberOfItems: Int, page: Int)] = []
    var getUsersWithNumberOfItemsPageClosure: ((String, Int, Int) -> Void)?

    func getUsers(with seed: String, numberOfItems: Int, page: Int) {
        getUsersWithNumberOfItemsPageCallsCount += 1
        getUsersWithNumberOfItemsPageReceivedArguments = (seed: seed, numberOfItems: numberOfItems, page: page)
        getUsersWithNumberOfItemsPageReceivedInvocations.append((seed: seed, numberOfItems: numberOfItems, page: page))
        getUsersWithNumberOfItemsPageClosure?(seed, numberOfItems, page)
    }

}
class ListUsersInteractorDelegateMock: NSObject, ListUsersInteractorDelegate {

    //MARK: - didLoadUsers

    private(set) var didLoadUsersCallsCount = 0
    var didLoadUsersCalled: Bool {
        return didLoadUsersCallsCount > 0
    }
    var didLoadUsersClosure: (() -> Void)?

    func didLoadUsers() {
        didLoadUsersCallsCount += 1
        didLoadUsersClosure?()
    }

    //MARK: - didFailLoadingUsers

    private(set) var didFailLoadingUsersWithCallsCount = 0
    var didFailLoadingUsersWithCalled: Bool {
        return didFailLoadingUsersWithCallsCount > 0
    }
    private(set) var didFailLoadingUsersWithReceivedError: Error?
    private(set) var didFailLoadingUsersWithReceivedInvocations: [Error] = []
    var didFailLoadingUsersWithClosure: ((Error) -> Void)?

    func didFailLoadingUsers(with error: Error) {
        didFailLoadingUsersWithCallsCount += 1
        didFailLoadingUsersWithReceivedError = error
        didFailLoadingUsersWithReceivedInvocations.append(error)
        didFailLoadingUsersWithClosure?(error)
    }

}
class ListUsersNavigatorMock: NSObject, ListUsersNavigator {

    //MARK: - show

    private(set) var showUserCallsCount = 0
    var showUserCalled: Bool {
        return showUserCallsCount > 0
    }
    private(set) var showUserReceivedUser: User?
    private(set) var showUserReceivedInvocations: [User] = []
    var showUserClosure: ((User) -> Void)?

    func show(user: User) {
        showUserCallsCount += 1
        showUserReceivedUser = user
        showUserReceivedInvocations.append(user)
        showUserClosure?(user)
    }

}
class ListUsersPresenterMock: NSObject, ListUsersPresenter {
    var ui: ListUsersUI?

    //MARK: - didLoad

    private(set) var didLoadCallsCount = 0
    var didLoadCalled: Bool {
        return didLoadCallsCount > 0
    }
    var didLoadClosure: (() -> Void)?

    func didLoad() {
        didLoadCallsCount += 1
        didLoadClosure?()
    }

    //MARK: - didSelect

    private(set) var didSelectUserCallsCount = 0
    var didSelectUserCalled: Bool {
        return didSelectUserCallsCount > 0
    }
    private(set) var didSelectUserReceivedUser: User?
    private(set) var didSelectUserReceivedInvocations: [User] = []
    var didSelectUserClosure: ((User) -> Void)?

    func didSelect(user: User) {
        didSelectUserCallsCount += 1
        didSelectUserReceivedUser = user
        didSelectUserReceivedInvocations.append(user)
        didSelectUserClosure?(user)
    }

    //MARK: - loadMoreUsers

    private(set) var loadMoreUsersCallsCount = 0
    var loadMoreUsersCalled: Bool {
        return loadMoreUsersCallsCount > 0
    }
    var loadMoreUsersClosure: (() -> Void)?

    func loadMoreUsers() {
        loadMoreUsersCallsCount += 1
        loadMoreUsersClosure?()
    }

}
class ListUsersUIMock: NSObject, ListUsersUI {

    //MARK: - setupUI

    private(set) var setupUICallsCount = 0
    var setupUICalled: Bool {
        return setupUICallsCount > 0
    }
    var setupUIClosure: (() -> Void)?

    func setupUI() {
        setupUICallsCount += 1
        setupUIClosure?()
    }

}
class ListUsersViewMock: NSObject, ListUsersView {
    var delegate: ListsUsersViewDelegate?

    //MARK: - setup

    private(set) var setupCallsCount = 0
    var setupCalled: Bool {
        return setupCallsCount > 0
    }
    var setupClosure: (() -> Void)?

    func setup() {
        setupCallsCount += 1
        setupClosure?()
    }

    //MARK: - filter

    private(set) var filterByCallsCount = 0
    var filterByCalled: Bool {
        return filterByCallsCount > 0
    }
    private(set) var filterByReceivedText: String?
    private(set) var filterByReceivedInvocations: [String] = []
    var filterByClosure: ((String) -> Void)?

    func filter(by text: String) {
        filterByCallsCount += 1
        filterByReceivedText = text
        filterByReceivedInvocations.append(text)
        filterByClosure?(text)
    }

}
class ListsUsersViewDelegateMock: NSObject, ListsUsersViewDelegate {

    //MARK: - didSelect

    private(set) var didSelectUserCallsCount = 0
    var didSelectUserCalled: Bool {
        return didSelectUserCallsCount > 0
    }
    private(set) var didSelectUserReceivedUser: User?
    private(set) var didSelectUserReceivedInvocations: [User] = []
    var didSelectUserClosure: ((User) -> Void)?

    func didSelect(user: User) {
        didSelectUserCallsCount += 1
        didSelectUserReceivedUser = user
        didSelectUserReceivedInvocations.append(user)
        didSelectUserClosure?(user)
    }

}
class LocalStorageServiceMock: NSObject, LocalStorageService {
    var context: NSManagedObjectContext {
        get { return underlyingContext }
        set(value) { underlyingContext = value }
    }
    var underlyingContext: NSManagedObjectContext!

    //MARK: - save

    private(set) var saveCallsCount = 0
    var saveCalled: Bool {
        return saveCallsCount > 0
    }
    var saveClosure: (() -> Void)?

    func save() {
        saveCallsCount += 1
        saveClosure?()
    }

}
class UserDetailsPresenterMock: NSObject, UserDetailsPresenter {
    var ui: UserDetailsUI?

    //MARK: - didLoad

    private(set) var didLoadCallsCount = 0
    var didLoadCalled: Bool {
        return didLoadCallsCount > 0
    }
    var didLoadClosure: (() -> Void)?

    func didLoad() {
        didLoadCallsCount += 1
        didLoadClosure?()
    }

}
class UserDetailsUIMock: NSObject, UserDetailsUI {

    //MARK: - setupUI

    private(set) var setupUIWithCallsCount = 0
    var setupUIWithCalled: Bool {
        return setupUIWithCallsCount > 0
    }
    private(set) var setupUIWithReceivedUser: User?
    private(set) var setupUIWithReceivedInvocations: [User] = []
    var setupUIWithClosure: ((User) -> Void)?

    func setupUI(with user: User) {
        setupUIWithCallsCount += 1
        setupUIWithReceivedUser = user
        setupUIWithReceivedInvocations.append(user)
        setupUIWithClosure?(user)
    }

}
class UserDetailsViewMock: NSObject, UserDetailsView {

    //MARK: - setup

    private(set) var setupWithCallsCount = 0
    var setupWithCalled: Bool {
        return setupWithCallsCount > 0
    }
    private(set) var setupWithReceivedUser: User?
    private(set) var setupWithReceivedInvocations: [User] = []
    var setupWithClosure: ((User) -> Void)?

    func setup(with user: User) {
        setupWithCallsCount += 1
        setupWithReceivedUser = user
        setupWithReceivedInvocations.append(user)
        setupWithClosure?(user)
    }

}
