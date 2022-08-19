//
//  HomeViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol HomeViewModelInterface: AnyObject {
    var allPerson: [Person]? { get set }
    var coreDataManager: CoreDataManager { get set }
    func getAllData() -> [Person]?
}

class HomeViewModel: HomeViewModelInterface {
    var allPerson: [Person]?
    var coreDataManager: CoreDataManager

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }

    func getAllData() -> [Person]? {
        allPerson = coreDataManager.fetchAllPersons()
        return allPerson
    }
}
