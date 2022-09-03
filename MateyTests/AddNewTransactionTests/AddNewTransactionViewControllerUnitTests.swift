//
//  AddNewTransactionViewControllerUnitTests.swift
//  MateyTests
//
//  Created by Firat Polat on 3.09.2022.
//

import XCTest

final class AddNewTransactionViewControllerUnitTests: XCTestCase {

    private var sut: MockAddNewTransactionViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockAddNewTransactionViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testUiInit() {
        sut?.uiInit()

        XCTAssertEqual(sut?.invokedUiInit, true)
    }

    func testSaveTransaction() {
        sut?.saveTransaction()

        XCTAssertEqual(sut?.invokedSaveTransaction, true)
    }

    func testShowAlert() {
        sut?.showAlert(title: "Deneme", message: "Deneme")

        XCTAssertEqual(sut?.invokedShowAlert, true)
    }
}
