//
//  HomeViewModelUnitTests.swift
//  MateyTests
//
//  Created by Firat Polat on 13.09.2022.
//

import XCTest
@testable import Matey

class HomeViewModelUnitTests: XCTestCase {

    private var sut: HomeViewModel?
    private var view = MockHomeViewController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HomeViewModel(view: view)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func notifyViewWillAppear() {
        XCTAssertFalse(view.invokedSetupUI)
        sut?.notifyViewWillAppear()
        XCTAssertTrue(view.invokedSetupUI)
    }

    func testTotalBorrow() {
        CoreDataManager.shared.deleteAllRecords(entity: "Person") // Not good!! If you want use this method for unit test you have to create mock Container for your datas.
        sut?.totalBorrowCount()
        XCTAssertFalse(sut?.totalBorrow != 0, "Total lend not equal to zero check the deleteAllRecords func")

        CoreDataManager.shared.insertPerson(name: "deneme", friend: ConstantsUserDefault.currentUsername, lend: 200, borrow: 200, username: ConstantsUserDefault.currentUsername, id: UUID())

        sut?.totalBorrowCount()
        XCTAssertTrue(sut?.totalBorrow != 0, "Total lend equal to zero check the totalLendCount func")
    }


    func testTotalLend() {
        CoreDataManager.shared.deleteAllRecords(entity: "Person") // Not good!! If you want use this method for unit test you have to create mock Container for your datas.
        sut?.totalLendCount()
        XCTAssertFalse(sut?.totalLend != 0, "Total lend not equal to zero check the deleteAllRecords func")

        CoreDataManager.shared.insertPerson(name: "deneme", friend: ConstantsUserDefault.currentUsername, lend: 200, borrow: 200, username: ConstantsUserDefault.currentUsername, id: UUID())

        sut?.totalLendCount()
        XCTAssertTrue(sut?.totalLend != 0, "Total lend equal to zero check the totalLendCount func")
    }
}

