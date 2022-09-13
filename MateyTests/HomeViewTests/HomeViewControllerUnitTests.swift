//
//  HomeViewControllerUnitTests.swift
//  MateyTests
//
//  Created by Firat Polat on 13.09.2022.
//

import XCTest

class HomeViewControllerUnitTests: XCTestCase {

    private var sut: MockHomeViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockHomeViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testUiInit() {
        sut?.uiInit()

        XCTAssertEqual(sut?.invokedUiInit, true)
    }

    func testSetupPlusButton() {
        sut?.setupPlusButton()

        XCTAssertEqual(sut?.invokedSetupPlusButton, true)
    }
}
