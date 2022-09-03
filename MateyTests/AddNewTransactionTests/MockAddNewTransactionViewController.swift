//
//  MockAddNewTransactionViewController.swift
//  MateyTests
//
//  Created by Firat Polat on 3.09.2022.
//

@testable import Matey

final class MockAddNewTransactionViewController: AddNewTransactionViewControllerInterface {

    var invokedUiInit = false
    var invokedUiInitCount = 0

    func uiInit() {
        invokedUiInit = true
        invokedUiInitCount += 1
    }

    var invokedShowAlert = false
    var invokedShowAlertCount = 0
    var invokedShowAlertParameters: (title: String, message: String)?
    var invokedShowAlertParametersList = [(title: String, message: String)]()

    func showAlert(title: String, message: String) {
        invokedShowAlert = true
        invokedShowAlertCount += 1
        invokedShowAlertParameters = (title, message)
        invokedShowAlertParametersList.append((title, message))
    }

    var invokedSaveTransaction = false
    var invokedSaveTransactionCount = 0

    func saveTransaction() {
        invokedSaveTransaction = true
        invokedSaveTransactionCount += 1
    }
}
