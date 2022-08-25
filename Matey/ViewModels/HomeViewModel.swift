//
//  HomeViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol HomeViewModelInterface: AnyObject {
    var allPerson: [Person]? { get }
    func notifyViewDidload()
    func getAllData() -> [Person]?
}

final class HomeViewModel {

    private weak var view: HomeViewControllerInterface?
    var allPerson: [Person]?
    var coreDataManager = CoreDataManager()

    init(view: HomeViewControllerInterface?) {
        self.view = view
    }
}

extension HomeViewModel: HomeViewModelInterface {

    func notifyViewDidload() {
        view?.uiInit()
        view?.setupPlusButton()
    }

    func getAllData() -> [Person]? {
        allPerson = coreDataManager.fetchAllPersons()
        return allPerson
    }
}
