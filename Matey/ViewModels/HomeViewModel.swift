//
//  HomeViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol HomeViewModelInterface: AnyObject {
    var currentUserData: [Person]? { get }
    var totalBorrow: Double { get }
    var totalLend: Double { get }
    func notifyViewDidload()
    func currentUserData(username: String) -> [Person]?
    func totalBorrowCount() -> Double
    func totalLendCount() -> Double
}

final class HomeViewModel {

    private weak var view: HomeViewControllerInterface?
    var currentUserData: [Person]?
    var coreDataManager = CoreDataManager()
    var totalBorrow = 0.0
    var totalLend = 0.0

    init(view: HomeViewControllerInterface?) {
        self.view = view
    }
}

// MARK: - Interface Setup

extension HomeViewModel: HomeViewModelInterface {

    func notifyViewDidload() {
        view?.uiInit()
        view?.setupPlusButton()
    }

    func currentUserData(username: String) -> [Person]? {
        currentUserData = coreDataManager.fetchCurrentPerson(username: username)
        return currentUserData
    }

    func totalBorrowCount() -> Double {
        totalBorrow = 0.0

        for i in 0..<currentUserData!.count {
            totalBorrow += currentUserData?[i].borrow ?? 0.0
        }
        return totalBorrow
    }

    func totalLendCount() -> Double {
        totalLend = 0.0

        for i in 0..<currentUserData!.count {
            totalLend += currentUserData?[i].lend ?? 0.0
        }
        return totalLend
    }
}
