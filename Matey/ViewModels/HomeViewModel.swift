//
//  HomeViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol HomeViewModelInterface: AnyObject {
    var currentUserData: [Person]? { get }
    func notifyViewDidload()
    func currentUserData(username: String) -> [Person]?
}

final class HomeViewModel {

    private weak var view: HomeViewControllerInterface?
    var currentUserData: [Person]?
    private var coreDataManager = CoreDataManager()

    init(view: HomeViewControllerInterface?) {
        self.view = view
    }
}

extension HomeViewModel: HomeViewModelInterface {

    func notifyViewDidload() {
        view?.uiInit()
        view?.setupPlusButton()
    }

    func currentUserData(username: String) -> [Person]? {
        currentUserData = coreDataManager.fetchCurrentPerson(username: username)
        return currentUserData
    }
}
