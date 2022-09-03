//
//  AddNewTransactionUnitTests.swift
//  MateyTests
//
//  Created by Firat Polat on 3.09.2022.
//

import XCTest

final class AddNewTransactionViewModelUnitTests: XCTestCase {

    private var sut: MockAddNewTransactionViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockAddNewTransactionViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testSaveTransaction() {
        sut?.saveTransaction(name: "Fırat", friend: "Ulaş", lend: "1000", borrow: "2000", username: "frtplt")

        XCTAssertEqual(sut?.invokedSaveTransaction, true)
    }

    func testNotifyViewDidload() {
        sut?.notifyViewDidload()

        XCTAssertEqual(sut?.invokedNotifyViewDidload, true)
    }

    func testValidationTextFields() {
        sut?.validationTextFields(textRegistrantsName: "Test", textFieldRegistrantsUsername: "Test", textFieldFriendUsername: "Test")

        XCTAssertEqual(sut?.invokedValidationTextFields, true)
    }
}
