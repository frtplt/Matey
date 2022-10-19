//
//  HomeViewModelUnitTests.swift
//  MateyTests
//
//  Created by Firat Polat on 13.09.2022.
//

import XCTest
@testable import Matey

final class HomeViewModelUnitTests: XCTestCase {
    
    private var homeViewModel: HomeViewModel!
    private var view: MockHomeViewController!
    private var coreDataManager: MockCoreDataManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = MockHomeViewController()
        coreDataManager = MockCoreDataManager()
        homeViewModel = HomeViewModel(view: view, coreDataManager: coreDataManager)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        coreDataManager = nil
        homeViewModel = nil
    }
    
    func test_notifyViewWillAppear_InvokesRequiredMethods() {
        XCTAssertFalse(view.invokedSetupUI)
        
        homeViewModel?.notifyViewWillAppear()
        
        XCTAssertTrue(view.invokedSetupUI)
    }
    
    func test_deleteTransaction_InvokesRequiredMethods() {
        let id = UUID()
        XCTAssertFalse(coreDataManager.invokedDelete)
        XCTAssertFalse(view.invokedSetupUI)
        
        homeViewModel.deleteTransaction(id: id, indexpath: 0)
        
        XCTAssertEqual(coreDataManager.invokedDeleteCount, 1)
        XCTAssertEqual(coreDataManager.invokedDeleteParameters?.id, id)
        XCTAssertTrue(view.invokedSetupUI)
    }
}

