//
//  AddNewTransactionViewModel.swift
//  Matey
//
//  Created by Firat Polat on 20.08.2022.
//

protocol AddNewTransactionViewModelInterface: AnyObject {
    func saveTransaction(name: String, friend: String, lend: String, borrow: String, username: String)
    func notifyViewDidload()
    func validationTextFields(textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String) -> Bool
}

final class AddNewTransactionViewModel {

    private weak var view: AddNewTransactionViewControllerInterface?
    private var coreDataManager = CoreDataManager()

    init(view: AddNewTransactionViewControllerInterface?) {
        self.view = view
    }

    func saveTransaction(name: String, friend: String, lend: String, borrow: String, username: String) {
        coreDataManager.insertPerson(name: name, friend: friend, lend: lend, borrow: borrow, username: username)
    }
}

// MARK: - Interface Setup

extension AddNewTransactionViewModel: AddNewTransactionViewModelInterface {

    func notifyViewDidload() {
        view?.uiInit()
    }

    func validationTextFields(textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String) -> Bool {
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

