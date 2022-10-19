//
//  HomeViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation
import CoreGraphics

protocol HomeViewModelInterface: BaseViewModelInterface {
    var currentUserData: [Person]? { get }
    var numberOfRows: Int { get }
    var numberOfSections: Int { get }
    var currentUserDataCount: Int { get }
    func getCurrentUserData(with index: Int) -> Person
    func deleteTransaction(id: UUID, indexpath: Int)
    func borrowLabelAmount() -> String
    func lendLabelAmount() -> String
    func totalBalanceLabelAmount() -> String
}

final class HomeViewModel {

    private weak var view: HomeViewControllerInterface?
    private var coreDataManager: CoreDataManagerInterface?

    var currentUserData: [Person]?

    private var totalBorrow = 0.0
    private var totalLend = 0.0

    init(view: HomeViewControllerInterface?, coreDataManager: CoreDataManagerInterface? = CoreDataManager.shared) {
        self.view = view
        self.coreDataManager = coreDataManager
    }

    private func totalBorrowCount() -> Double {
        totalBorrow = 0.0

        for i in 0..<(currentUserData?.count ?? 0) {
            totalBorrow += currentUserData?[i].borrow ?? 0.0
        }
        return totalBorrow
        borrowLabelAmount()
    }

    private func totalLendCount() -> Double {
        totalLend = 0.0

        for i in 0..<(currentUserData?.count ?? 0) {
            totalLend += currentUserData?[i].lend ?? 0.0
        }
        return totalLend
        lendLabelAmount()
    }

    private func fetchCurrentUserData(username: String) -> [Person]? {
        currentUserData = coreDataManager?.fetchCurrentPerson(username: username)
        return currentUserData
    }
}

// MARK: - Interface Setup

extension HomeViewModel: HomeViewModelInterface {

    func notifyViewWillAppear() {
        fetchCurrentUserData(username: ConstantsUserDefault.currentUsername)
        totalBorrowCount()
        totalLendCount()
        totalBalanceLabelAmount()
        view?.setupUI()
    }

    func getCurrentUserData(with index: Int) -> Person {
        currentUserData?[index] ?? Person()
    }

    var numberOfSections: Int {
        1
    }

    var numberOfRows: Int {
        currentUserData?.count ?? 0
    }

    var currentUserDataCount: Int {
        currentUserData?.count ?? 0
    }

    func deleteTransaction(id: UUID, indexpath: Int) {
        currentUserData?.remove(at: indexpath)
        coreDataManager?.delete(id: id)
        notifyViewWillAppear()
    }

    func borrowLabelAmount() -> String {
        "\(totalBorrow)"
    }

    func lendLabelAmount() -> String {
        "\(totalLend)"
    }

    func totalBalanceLabelAmount() -> String {
        "\((totalLend) - (totalBorrow)) ₺"
    }
}
