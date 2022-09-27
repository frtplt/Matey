//
//  MockAddNewTransactionViewModel.swift
//  MateyTests
//
//  Created by Firat Polat on 3.09.2022.
//

@testable import Matey
import UIKit

final class MockAddNewTransactionViewModel: AddNewTransactionViewModelInterface {

    var invokedTextRegistrantsNameSetter = false
    var invokedTextRegistrantsNameSetterCount = 0
    var invokedTextRegistrantsName: String?
    var invokedTextRegistrantsNameList = [String]()
    var invokedTextRegistrantsNameGetter = false
    var invokedTextRegistrantsNameGetterCount = 0
    var stubbedTextRegistrantsName: String! = ""

    var textRegistrantsName: String {
        set {
            invokedTextRegistrantsNameSetter = true
            invokedTextRegistrantsNameSetterCount += 1
            invokedTextRegistrantsName = newValue
            invokedTextRegistrantsNameList.append(newValue)
        }
        get {
            invokedTextRegistrantsNameGetter = true
            invokedTextRegistrantsNameGetterCount += 1
            return stubbedTextRegistrantsName
        }
    }

    var invokedTextFieldRegistrantsUsernameSetter = false
    var invokedTextFieldRegistrantsUsernameSetterCount = 0
    var invokedTextFieldRegistrantsUsername: String?
    var invokedTextFieldRegistrantsUsernameList = [String]()
    var invokedTextFieldRegistrantsUsernameGetter = false
    var invokedTextFieldRegistrantsUsernameGetterCount = 0
    var stubbedTextFieldRegistrantsUsername: String! = ""

    var textFieldRegistrantsUsername: String {
        set {
            invokedTextFieldRegistrantsUsernameSetter = true
            invokedTextFieldRegistrantsUsernameSetterCount += 1
            invokedTextFieldRegistrantsUsername = newValue
            invokedTextFieldRegistrantsUsernameList.append(newValue)
        }
        get {
            invokedTextFieldRegistrantsUsernameGetter = true
            invokedTextFieldRegistrantsUsernameGetterCount += 1
            return stubbedTextFieldRegistrantsUsername
        }
    }

    var invokedTextFieldFriendUsernameSetter = false
    var invokedTextFieldFriendUsernameSetterCount = 0
    var invokedTextFieldFriendUsername: String?
    var invokedTextFieldFriendUsernameList = [String]()
    var invokedTextFieldFriendUsernameGetter = false
    var invokedTextFieldFriendUsernameGetterCount = 0
    var stubbedTextFieldFriendUsername: String! = ""

    var textFieldFriendUsername: String {
        set {
            invokedTextFieldFriendUsernameSetter = true
            invokedTextFieldFriendUsernameSetterCount += 1
            invokedTextFieldFriendUsername = newValue
            invokedTextFieldFriendUsernameList.append(newValue)
        }
        get {
            invokedTextFieldFriendUsernameGetter = true
            invokedTextFieldFriendUsernameGetterCount += 1
            return stubbedTextFieldFriendUsername
        }
    }

    var invokedTextFieldLendAmountSetter = false
    var invokedTextFieldLendAmountSetterCount = 0
    var invokedTextFieldLendAmount: Double?
    var invokedTextFieldLendAmountList = [Double]()
    var invokedTextFieldLendAmountGetter = false
    var invokedTextFieldLendAmountGetterCount = 0
    var stubbedTextFieldLendAmount: Double! = 0

    var textFieldLendAmount: Double {
        set {
            invokedTextFieldLendAmountSetter = true
            invokedTextFieldLendAmountSetterCount += 1
            invokedTextFieldLendAmount = newValue
            invokedTextFieldLendAmountList.append(newValue)
        }
        get {
            invokedTextFieldLendAmountGetter = true
            invokedTextFieldLendAmountGetterCount += 1
            return stubbedTextFieldLendAmount
        }
    }

    var invokedTextFieldBorrowAmountSetter = false
    var invokedTextFieldBorrowAmountSetterCount = 0
    var invokedTextFieldBorrowAmount: Double?
    var invokedTextFieldBorrowAmountList = [Double]()
    var invokedTextFieldBorrowAmountGetter = false
    var invokedTextFieldBorrowAmountGetterCount = 0
    var stubbedTextFieldBorrowAmount: Double! = 0

    var textFieldBorrowAmount: Double {
        set {
            invokedTextFieldBorrowAmountSetter = true
            invokedTextFieldBorrowAmountSetterCount += 1
            invokedTextFieldBorrowAmount = newValue
            invokedTextFieldBorrowAmountList.append(newValue)
        }
        get {
            invokedTextFieldBorrowAmountGetter = true
            invokedTextFieldBorrowAmountGetterCount += 1
            return stubbedTextFieldBorrowAmount
        }
    }

    var invokedSaveTransaction = false
    var invokedSaveTransactionCount = 0
    var invokedSaveTransactionParameters: (name: String, friend: String, lend: Double, borrow: Double, username: String)?
    var invokedSaveTransactionParametersList = [(name: String, friend: String, lend: Double, borrow: Double, username: String)]()

    func saveTransaction(name: String, friend: String, lend: Double, borrow: Double, username: String) {
        invokedSaveTransaction = true
        invokedSaveTransactionCount += 1
        invokedSaveTransactionParameters = (name, friend, lend, borrow, username)
        invokedSaveTransactionParametersList.append((name, friend, lend, borrow, username))
    }

    var invokedIsValidTextFields = false
    var invokedIsValidTextFieldsCount = 0
    var invokedIsValidTextFieldsParameters: (textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String)?
    var invokedIsValidTextFieldsParametersList = [(textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String)]()
    var stubbedIsValidTextFieldsResult: Bool! = false

    func isValidTextFields(textRegistrantsName: String, textFieldRegistrantsUsername: String, textFieldFriendUsername: String) -> Bool {
        invokedIsValidTextFields = true
        invokedIsValidTextFieldsCount += 1
        invokedIsValidTextFieldsParameters = (textRegistrantsName, textFieldRegistrantsUsername, textFieldFriendUsername)
        invokedIsValidTextFieldsParametersList.append((textRegistrantsName, textFieldRegistrantsUsername, textFieldFriendUsername))
        return stubbedIsValidTextFieldsResult
    }

    var invokedNotifyViewWillAppear = false
    var invokedNotifyViewWillAppearCount = 0

    func notifyViewWillAppear() {
        invokedNotifyViewWillAppear = true
        invokedNotifyViewWillAppearCount += 1
    }
}
