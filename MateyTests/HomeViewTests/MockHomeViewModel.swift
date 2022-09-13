//
//  MockHomeViewModel.swift
//  MateyTests
//
//  Created by Firat Polat on 13.09.2022.
//

@testable import Matey

final class MockHomeViewModel: HomeViewModelInterface {

    var invokedCurrentUserDataGetter = false
    var invokedCurrentUserDataGetterCount = 0
    var stubbedCurrentUserData: [Person]!

    var currentUserData: [Person]? {
        invokedCurrentUserDataGetter = true
        invokedCurrentUserDataGetterCount += 1
        return stubbedCurrentUserData
    }

    var invokedTotalBorrowGetter = false
    var invokedTotalBorrowGetterCount = 0
    var stubbedTotalBorrow: Double! = 0

    var totalBorrow: Double {
        invokedTotalBorrowGetter = true
        invokedTotalBorrowGetterCount += 1
        return stubbedTotalBorrow
    }

    var invokedTotalLendGetter = false
    var invokedTotalLendGetterCount = 0
    var stubbedTotalLend: Double! = 0

    var totalLend: Double {
        invokedTotalLendGetter = true
        invokedTotalLendGetterCount += 1
        return stubbedTotalLend
    }

    var invokedNotifyViewDidload = false
    var invokedNotifyViewDidloadCount = 0

    func notifyViewDidload() {
        invokedNotifyViewDidload = true
        invokedNotifyViewDidloadCount += 1
    }

    var invokedCurrentUserDataUsername = false
    var invokedCurrentUserDataUsernameCount = 0
    var invokedCurrentUserDataUsernameParameters: (username: String, Void)?
    var invokedCurrentUserDataUsernameParametersList = [(username: String, Void)]()
    var stubbedCurrentUserDataUsernameResult: [Person]!

    func currentUserData(username: String) -> [Person]? {
        invokedCurrentUserDataUsername = true
        invokedCurrentUserDataUsernameCount += 1
        invokedCurrentUserDataUsernameParameters = (username, ())
        invokedCurrentUserDataUsernameParametersList.append((username, ()))
        return stubbedCurrentUserDataUsernameResult
    }

    var invokedTotalBorrowCount = false
    var invokedTotalBorrowCountCount = 0
    var stubbedTotalBorrowCountResult: Double! = 0

    func totalBorrowCount() -> Double {
        invokedTotalBorrowCount = true
        invokedTotalBorrowCountCount += 1
        return stubbedTotalBorrowCountResult
    }

    var invokedTotalLendCount = false
    var invokedTotalLendCountCount = 0
    var stubbedTotalLendCountResult: Double! = 0

    func totalLendCount() -> Double {
        invokedTotalLendCount = true
        invokedTotalLendCountCount += 1
        return stubbedTotalLendCountResult
    }
}
