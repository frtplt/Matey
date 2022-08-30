//
//  AddNewTransactionViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol AddNewTransactionInterface: AnyObject {
    func saveTransaction(name: String, friend: String, lend: String, borrow: String, username: String)
}

class AddNewTransactionViewModel: AddNewTransactionInterface {

    var coreDataManager = CoreDataManager()

    func saveTransaction(name: String, friend: String, lend: String, borrow: String, username: String) {
        coreDataManager.insertPerson(name: name, friend: friend, lend: lend, borrow: borrow, username: username)
    }
}

