//
//  AddNewTransactionViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol AddNewTransactionViewModelInterface: BaseViewModelInterface {
    func saveTransaction(name: String, friend: String, lend: Double, borrow: Double, username: String)
}

final class AddNewTransactionViewModel {

    private weak var view: AddNewTransactionViewControllerInterface?
    private var coreDataManager: CoreDataManagerInterface?

    init(view: AddNewTransactionViewControllerInterface?, coreDataManager: CoreDataManagerInterface? = CoreDataManager.shared) {
        self.view = view
        self.coreDataManager = coreDataManager
    }

    func isValidTextFields(textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String) -> Bool {
        if textRegistrantsName.isEmpty {
            view?.showAlert(title: ConstantsAddNewTransactionVC.messageWarning, message: ConstantsAddNewTransactionVC.messageTransactionYourNameCantEmpty)
            return false
        } else if textFieldRegistrantsUsername.isEmpty {
            view?.showAlert(title: ConstantsAddNewTransactionVC.messageWarning, message: ConstantsAddNewTransactionVC.messageTransactionYourUsernameCantEmpty)
            return false
        } else if textFieldFriendUsername.isEmpty {
            view?.showAlert(title: ConstantsAddNewTransactionVC.messageWarning, message: ConstantsAddNewTransactionVC.messageTransactionFriendUsernameCantEmpty)
            return false
        }
        return true
    }
}

// MARK: - Interface Setup

extension AddNewTransactionViewModel: AddNewTransactionViewModelInterface {

    func saveTransaction(name: String, friend: String, lend: Double, borrow: Double, username: String) {
        if isValidTextFields(textRegistrantsName: name, textFieldRegistrantsUsername: friend, textFieldFriendUsername: username) {
            coreDataManager?.insertPerson(name: name, friend: friend, lend: lend, borrow: borrow, username: username, id: UUID())
            self.view?.showAlert(title: ConstantsAddNewTransactionVC.messageTransactionSaved, message: ConstantsAddNewTransactionVC.messageTransactionSuccessfully)
        }
        else {
            self.view?.showAlert(title: "error", message: "error")
        }
    }
}

extension AddNewTransactionViewModel: BaseViewModelInterface {
    func notifyViewWillAppear() {
        view?.setupUI()
    }
}
