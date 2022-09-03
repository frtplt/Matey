//
//  MockAddNewTransactionViewModel.swift
//  MateyTests
//
//  Created by Firat Polat on 3.09.2022.
//

@testable import Matey

final class MockAddNewTransactionViewModel: AddNewTransactionViewModelInterface {

    var invokedSaveTransaction = false
    var invokedSaveTransactionCount = 0
    var invokedSaveTransactionParameters: (name: String, friend: String, lend: String, borrow: String, username: String)?
    var invokedSaveTransactionParametersList = [(name: String, friend: String, lend: String, borrow: String, username: String)]()

    func saveTransaction(name: String, friend: String, lend: String, borrow: String, username: String) {
        invokedSaveTransaction = true
        invokedSaveTransactionCount += 1
        invokedSaveTransactionParameters = (name, friend, lend, borrow, username)
        invokedSaveTransactionParametersList.append((name, friend, lend, borrow, username))
    }

    var invokedNotifyViewDidload = false
    var invokedNotifyViewDidloadCount = 0

    func notifyViewDidload() {
        invokedNotifyViewDidload = true
        invokedNotifyViewDidloadCount += 1
    }

    var invokedValidationTextFields = false
    var invokedValidationTextFieldsCount = 0
    var invokedValidationTextFieldsParameters: (textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String)?
    var invokedValidationTextFieldsParametersList = [(textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String)]()
    var stubbedValidationTextFieldsResult: Bool! = false

    func validationTextFields(textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String) -> Bool {
        invokedValidationTextFields = true
        invokedValidationTextFieldsCount += 1
        invokedValidationTextFieldsParameters = (textRegistrantsName, textFieldRegistrantsUsername, textFieldFriendUsername)
        invokedValidationTextFieldsParametersList.append((textRegistrantsName, textFieldRegistrantsUsername, textFieldFriendUsername))
        return stubbedValidationTextFieldsResult
    }
}
