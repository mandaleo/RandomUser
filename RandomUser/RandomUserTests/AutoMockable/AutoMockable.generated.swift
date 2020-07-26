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

    //MARK: - didLoad

    private(set) var didLoadUsersPageCallsCount = 0
    var didLoadUsersPageCalled: Bool {
        return didLoadUsersPageCallsCount > 0
    }
    private(set) var didLoadUsersPageReceivedArguments: (users: [User], page: Int)?
    private(set) var didLoadUsersPageReceivedInvocations: [(users: [User], page: Int)] = []
    var didLoadUsersPageClosure: (([User], Int) -> Void)?

    func didLoad(users: [User], page: Int) {
        didLoadUsersPageCallsCount += 1
        didLoadUsersPageReceivedArguments = (users: users, page: page)
        didLoadUsersPageReceivedInvocations.append((users: users, page: page))
        didLoadUsersPageClosure?(users, page)
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

    //MARK: - didLoad

    private(set) var didLoadUsersPageCallsCount = 0
    var didLoadUsersPageCalled: Bool {
        return didLoadUsersPageCallsCount > 0
    }
    private(set) var didLoadUsersPageReceivedArguments: (users: [User], page: Int)?
    private(set) var didLoadUsersPageReceivedInvocations: [(users: [User], page: Int)] = []
    var didLoadUsersPageClosure: (([User], Int) -> Void)?

    func didLoad(users: [User], page: Int) {
        didLoadUsersPageCallsCount += 1
        didLoadUsersPageReceivedArguments = (users: users, page: page)
        didLoadUsersPageReceivedInvocations.append((users: users, page: page))
        didLoadUsersPageClosure?(users, page)
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

    private(set) var setupUIWithCallsCount = 0
    var setupUIWithCalled: Bool {
        return setupUIWithCallsCount > 0
    }
    private(set) var setupUIWithReceivedUsers: [User]?
    private(set) var setupUIWithReceivedInvocations: [[User]] = []
    var setupUIWithClosure: (([User]) -> Void)?

    func setupUI(with users: [User]) {
        setupUIWithCallsCount += 1
        setupUIWithReceivedUsers = users
        setupUIWithReceivedInvocations.append(users)
        setupUIWithClosure?(users)
    }

}
class ListUsersViewMock: NSObject, ListUsersView {
    var delegate: ListsUsersViewDelegate?

    //MARK: - setup

    private(set) var setupWithCallsCount = 0
    var setupWithCalled: Bool {
        return setupWithCallsCount > 0
    }
    private(set) var setupWithReceivedUsers: [User]?
    private(set) var setupWithReceivedInvocations: [[User]] = []
    var setupWithClosure: (([User]) -> Void)?

    func setup(with users: [User]) {
        setupWithCallsCount += 1
        setupWithReceivedUsers = users
        setupWithReceivedInvocations.append(users)
        setupWithClosure?(users)
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
