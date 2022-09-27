//
//  AddNewTransactionUnitTests.swift
//  MateyTests
//
//  Created by Firat Polat on 3.09.2022.
//

import XCTest
@testable import Matey

final class AddNewTransactionViewModelUnitTests: XCTestCase {

    private var sut: AddNewTransactionViewModel?
    private var view = MockAddNewTransactionViewController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = AddNewTransactionViewModel(view: view)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testSaveTransaction() {
        sut?.saveTransaction(name: "Fırat", friend: "firat", lend: 1000, borrow: 2000, username: ConstantsUserDefault.currentUsername)

        XCTAssertEqual(sut?.invokedSaveTransaction, true) // Ask for invokedTransaction
    }

    func testNotifyViewDidload() {
        XCTAssertFalse(view.invokedSetupUI)
        sut?.notifyViewWillAppear()
        XCTAssertTrue(view.invokedSetupUI)
    }

    func testisValidTextFields() {
        let isNotValid = sut?.isValidTextFields(textRegistrantsName: "Test", textFieldRegistrantsUsername: "", textFieldFriendUsername: "Test")
        XCTAssertEqual(isNotValid, false)

        let isValid = sut?.isValidTextFields(textRegistrantsName: "Test", textFieldRegistrantsUsername: "Test", textFieldFriendUsername: "Test")
        XCTAssertEqual(isValid, true)
    }
}
