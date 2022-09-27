//
//  MockHomeViewModel.swift
//  MateyTests
//
//  Created by Firat Polat on 13.09.2022.
//

import Foundation
@testable import Matey

// TODO: Test ediceğimiz reel diğerleri mock

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

    var invokedNotifyViewWillAppear = false
    var invokedNotifyViewWillAppearCount = 0

    func notifyViewWillAppear() {
        invokedNotifyViewWillAppear = true
        invokedNotifyViewWillAppearCount += 1
    }

    var invokedDeleteTransaction = false
    var invokedDeleteTransactionCount = 0
    var invokedDeleteTransactionParameters: (id: UUID, indexpath: Int)?
    var invokedDeleteTransactionParametersList = [(id: UUID, indexpath: Int)]()

    func deleteTransaction(id: UUID, indexpath: Int) {
        invokedDeleteTransaction = true
        invokedDeleteTransactionCount += 1
        invokedDeleteTransactionParameters = (id, indexpath)
        invokedDeleteTransactionParametersList.append((id, indexpath))
    }

    var invokedBorrowLabelAmount = false
    var invokedBorrowLabelAmountCount = 0
    var stubbedBorrowLabelAmountResult: String! = ""

    func borrowLabelAmount() -> String {
        invokedBorrowLabelAmount = true
        invokedBorrowLabelAmountCount += 1
        return stubbedBorrowLabelAmountResult
    }

    var invokedLendLabelAmount = false
    var invokedLendLabelAmountCount = 0
    var stubbedLendLabelAmountResult: String! = ""

    func lendLabelAmount() -> String {
        invokedLendLabelAmount = true
        invokedLendLabelAmountCount += 1
        return stubbedLendLabelAmountResult
    }

    var invokedTotalBalanceLabelAmount = false
    var invokedTotalBalanceLabelAmountCount = 0
    var stubbedTotalBalanceLabelAmountResult: String! = ""

    func totalBalanceLabelAmount() -> String {
        invokedTotalBalanceLabelAmount = true
        invokedTotalBalanceLabelAmountCount += 1
        return stubbedTotalBalanceLabelAmountResult
    }

    var invokedNumberOfSections = false
    var invokedNumberOfSectionsCount = 0
    var stubbedNumberOfSectionsResult: Int! = 0

    func numberOfSections() -> Int {
        invokedNumberOfSections = true
        invokedNumberOfSectionsCount += 1
        return stubbedNumberOfSectionsResult
    }

    var invokedNumberOfRows = false
    var invokedNumberOfRowsCount = 0
    var stubbedNumberOfRowsResult: Int! = 0

    func numberOfRows() -> Int {
        invokedNumberOfRows = true
        invokedNumberOfRowsCount += 1
        return stubbedNumberOfRowsResult
    }
}
