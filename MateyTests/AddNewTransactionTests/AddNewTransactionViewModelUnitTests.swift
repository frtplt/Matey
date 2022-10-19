//
//  AddNewTransactionUnitTests.swift
//  MateyTests
//
//  Created by Firat Polat on 3.09.2022.
//

import XCTest
@testable import Matey

final class AddNewTransactionViewModelUnitTests: XCTestCase {

    private var addNewTransactionViewModel: AddNewTransactionViewModel!
    private var view: MockAddNewTransactionViewController!
    private var coreDataManager: MockCoreDataManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = MockAddNewTransactionViewController()
        coreDataManager = MockCoreDataManager()
        addNewTransactionViewModel = AddNewTransactionViewModel(view: view, coreDataManager: coreDataManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        coreDataManager = nil
        addNewTransactionViewModel = nil
    }

    func test_notifyViewWillAppear_InvokesRequiredMethods() {
        XCTAssertFalse(view.invokedSetupUI)

        addNewTransactionViewModel?.notifyViewWillAppear()

        XCTAssertTrue(view.invokedSetupUI)
    }

    func test_SaveTransaction_InvokesRequiredMethods() {
        let name = "Test"
        let friend = "Test"
        let lend = 1.0
        let borrow = 1.0
        let username = "Test"
        XCTAssertFalse(coreDataManager.invokedInsertPerson)

        addNewTransactionViewModel.saveTransaction(name: name, friend: friend, lend: lend, borrow: borrow, username: username)

        XCTAssertEqual(coreDataManager.invokedInsertPersonCount, 1)
        XCTAssertEqual(coreDataManager.invokedInsertPersonParameters?.name, name)
        XCTAssertEqual(coreDataManager.invokedInsertPersonParameters?.friend, friend)
        XCTAssertEqual(coreDataManager.invokedInsertPersonParameters?.lend, lend)
        XCTAssertEqual(coreDataManager.invokedInsertPersonParameters?.borrow, borrow)
        XCTAssertEqual(coreDataManager.invokedInsertPersonParameters?.username, username)
    }

    func test_isValidTextFields_WhenRegistrantUsernameFalseInput() {
        let textRegistrantsName = "Test"
        let textFieldRegistrantsUsername = ""
        let textFieldFriendUsername = "Test"

        XCTAssertFalse(view.invokedShowAlert)

        let isValid = addNewTransactionViewModel?.isValidTextFields(textRegistrantsName: textRegistrantsName, textFieldRegistrantsUsername: textFieldRegistrantsUsername, textFieldFriendUsername: textFieldFriendUsername)

        XCTAssertEqual(isValid, false)
        XCTAssertEqual(view.invokedShowAlertParameters?.title, ConstantsAddNewTransactionVC.messageWarning)
        XCTAssertEqual(view.invokedShowAlertParameters?.message, ConstantsAddNewTransactionVC.messageTransactionYourUsernameCantEmpty)
        XCTAssertEqual(view.invokedShowAlertCount, 1)
    }

    func test_isValidTextFields_WhenInputsTrue() {
        let textRegistrantsName = "Test"
        let textFieldRegistrantsUsername = "Test"
        let textFieldFriendUsername = "Test"

        XCTAssertFalse(view.invokedShowAlert)

        let isValid = addNewTransactionViewModel?.isValidTextFields(textRegistrantsName: textRegistrantsName, textFieldRegistrantsUsername: textFieldRegistrantsUsername, textFieldFriendUsername: textFieldFriendUsername)

        XCTAssertEqual(isValid, true)
        XCTAssertEqual(view.invokedShowAlertCount, 0)
    }
}
