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

    //MARK: - load

    private(set) var loadUsersPageCallsCount = 0
    var loadUsersPageCalled: Bool {
        return loadUsersPageCallsCount > 0
    }
    private(set) var loadUsersPageReceivedArguments: (users: [User], page: Int)?
    private(set) var loadUsersPageReceivedInvocations: [(users: [User], page: Int)] = []
    var loadUsersPageClosure: (([User], Int) -> Void)?

    func load(users: [User], page: Int) {
        loadUsersPageCallsCount += 1
        loadUsersPageReceivedArguments = (users: users, page: page)
        loadUsersPageReceivedInvocations.append((users: users, page: page))
        loadUsersPageClosure?(users, page)
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
