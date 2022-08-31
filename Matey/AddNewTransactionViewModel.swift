//
//  AddNewTransactionViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol AddNewTransactionViewModelInterface: AnyObject {
    func saveTransaction(name: String, friend: String, lend: String, borrow: String, username: String)
    func notifyViewDidload()
}

class AddNewTransactionViewModel {

    private weak var view: AddNewTransactionViewControllerInterface?
    private var coreDataManager = CoreDataManager()

    init(view: AddNewTransactionViewControllerInterface?) {
        self.view = view
    }

    func saveTransaction(name: String, friend: String, lend: String, borrow: String, username: String) {
        coreDataManager.insertPerson(name: name, friend: friend, lend: lend, borrow: borrow, username: username)
    }
}

extension AddNewTransactionViewModel: AddNewTransactionViewModelInterface {

    func notifyViewDidload() {
        view?.uiInit()
    }
}

