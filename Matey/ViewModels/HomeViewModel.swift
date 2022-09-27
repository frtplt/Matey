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
    func deleteTransaction(id: UUID, indexpath: Int)
    func borrowLabelAmount() -> String
    func lendLabelAmount() -> String
    func totalBalanceLabelAmount() -> String
    func numberOfSections() -> Int
    func numberOfRows() -> Int
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

        for i in 0..<currentUserData!.count {
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

        for i in 0..<currentUserData!.count {
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

    func numberOfSections() -> Int {
        1
    }

    func numberOfRows() -> Int {
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
