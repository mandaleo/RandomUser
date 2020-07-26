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

}
