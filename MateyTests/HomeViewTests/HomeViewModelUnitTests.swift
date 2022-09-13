//
//  HomeViewModelUnitTests.swift
//  MateyTests
//
//  Created by Firat Polat on 13.09.2022.
//

import XCTest

class HomeViewModelUnitTests: XCTestCase {

    private var sut: MockHomeViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockHomeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testNotifyViewDidload() {
        sut?.notifyViewDidload()

        XCTAssertEqual(sut?.invokedNotifyViewDidload, true)
    }

    func testCurrentUserData() {
        sut?.currentUserData(username: "deneme")

        XCTAssertEqual(sut?.invokedCurrentUserDataUsername, true)
    }

    func testTotalLendCount() {
        sut?.totalLendCount()

        XCTAssertEqual(sut?.invokedTotalLendCount, true)
    }

    func testTotalBorrowCount() {
        sut?.totalBorrowCount()

        XCTAssertEqual(sut?.invokedTotalBorrowCount, true)
    }
}

