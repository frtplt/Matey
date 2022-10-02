//
//  HomeViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol HomeViewModelInterface: BaseViewModelInterface {
    var currentUserData: [Person]? { get }
    var totalBorrow: Double { get }
    var totalLend: Double { get }
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
    var currentUserData: [Person]? = {
        CoreDataManager.shared.fetchCurrentPerson(username: ConstantsUserDefault.currentUsername)
    }()
    var totalBorrow = 0.0
    var totalLend = 0.0

    init(view: HomeViewControllerInterface?) {
        self.view = view
    }

    func totalBorrowCount() -> Double {
        // Ask for refresh currendatauser for unit test
        var currentUserData: [Person]? = {
            CoreDataManager.shared.fetchCurrentPerson(username: ConstantsUserDefault.currentUsername)
        }()
        totalBorrow = 0.0

        for i in 0..<(currentUserData?.count ?? 0) {
            totalBorrow += currentUserData?[i].borrow ?? 0.0
        }
        return totalBorrow
        borrowLabelAmount()
    }

    func totalLendCount() -> Double {
        // Ask for refresh currendatauser for unit test
        var currentUserData: [Person]? = {
            CoreDataManager.shared.fetchCurrentPerson(username: ConstantsUserDefault.currentUsername)
        }()
        totalLend = 0.0

        for i in 0..<(currentUserData?.count ?? 0) {
            totalLend += currentUserData?[i].lend ?? 0.0
        }
        return totalLend
        lendLabelAmount()
    }
}

// MARK: - Interface Setup

extension HomeViewModel: HomeViewModelInterface {

    func notifyViewWillAppear() {
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
        CoreDataManager.shared.delete(id: id)
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
