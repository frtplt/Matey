//
//  MockAddNewTransactionViewModel.swift
//  MateyTests
//
//  Created by Firat Polat on 3.09.2022.
//

@testable import Matey
import UIKit

final class MockAddNewTransactionViewModel: AddNewTransactionViewModelInterface {

    var invokedSaveTransaction = false
    var invokedSaveTransactionCount = 0
    var invokedSaveTransactionParameters: (name: String, friend: String, lend: Double, borrow: Double, username: String, id: UUID)?
    var invokedSaveTransactionParametersList = [(name: String, friend: String, lend: Double, borrow: Double, username: String, id: UUID)]()

    func saveTransaction(name: String, friend: String, lend: Double, borrow: Double, username: String, id: UUID) {
        invokedSaveTransaction = true
        invokedSaveTransactionCount += 1
        invokedSaveTransactionParameters = (name, friend, lend, borrow, username, id)
        invokedSaveTransactionParametersList.append((name, friend, lend, borrow, username, id))
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
