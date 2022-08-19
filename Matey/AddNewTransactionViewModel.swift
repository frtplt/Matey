//
//  AddNewTransactionViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol AddNewTransactionInterface: AnyObject {
    var coreDataManager: CoreDataManager { get set }
    func saveTransaction(name: String, friend: String, lend: String, borrow: String, id: UUID)
}

class AddNewTransactionViewModel: AddNewTransactionInterface {

    var coreDataManager: CoreDataManager

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }

    func saveTransaction(name: String, friend: String, lend: String, borrow: String, id: UUID) {
        coreDataManager.insertPerson(name: name, friend: friend, lend: lend, borrow: borrow, id: id)
    }
}

