//
//  AddNewTransactionViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

import Foundation

protocol AddNewTransactionViewModelInterface: BaseViewModelInterface {
    var textRegistrantsName: String { get set }
    var textFieldRegistrantsUsername: String { get set }
    var textFieldFriendUsername: String { get set }
    var textFieldLendAmount: Double { get set }
    var textFieldBorrowAmount: Double { get set }
    func saveTransaction(name: String, friend: String, lend: Double, borrow: Double, username: String)
    func isValidTextFields(textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String) -> Bool
}

final class AddNewTransactionViewModel {

    private weak var view: AddNewTransactionViewControllerInterface?

    var textRegistrantsName: String = ""
    var textFieldRegistrantsUsername: String = ""
    var textFieldFriendUsername: String = ""
    var textFieldLendAmount: Double = 0
    var textFieldBorrowAmount: Double = 0
    var invokedSaveTransaction = false

    init(view: AddNewTransactionViewControllerInterface?) {
        self.view = view
    }
    
    func saveTransaction(name: String, friend: String, lend: Double, borrow: Double, username: String) {
        invokedSaveTransaction = true
        if isValidTextFields(textRegistrantsName: textRegistrantsName, textFieldRegistrantsUsername: textFieldRegistrantsUsername, textFieldFriendUsername: textFieldFriendUsername) {
            CoreDataManager.shared.insertPerson(name: name, friend: friend, lend: lend, borrow: borrow, username: username, id: UUID())
            self.view?.showAlert(title: ConstantsAddNewTransactionVC.messageTransactionSaved, message: ConstantsAddNewTransactionVC.messageTransactionSuccessfully)
        }
        else {
            self.view?.showAlert(title: "error", message: "error")
        }
    }
}

// MARK: - Interface Setup

extension AddNewTransactionViewModel: AddNewTransactionViewModelInterface {

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

extension AddNewTransactionViewModel: BaseViewModelInterface {
    func notifyViewWillAppear() {
        view?.setupUI()
    }
}

