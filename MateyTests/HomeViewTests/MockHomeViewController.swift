//
//  MockHomeViewController.swift
//  MateyTests
//
//  Created by Firat Polat on 13.09.2022.
//

@testable import Matey

final class MockHomeViewController: HomeViewControllerInterface {

    var invokedCoreDataManagerGetter = false
    var invokedCoreDataManagerGetterCount = 0
    var stubbedCoreDataManager: CoreDataManager!

    var coreDataManager: CoreDataManager {
        invokedCoreDataManagerGetter = true
        invokedCoreDataManagerGetterCount += 1
        return stubbedCoreDataManager
    }

    var invokedUiInit = false
    var invokedUiInitCount = 0

    func uiInit() {
        invokedUiInit = true
        invokedUiInitCount += 1
    }

    var invokedSetupPlusButton = false
    var invokedSetupPlusButtonCount = 0

    func setupPlusButton() {
        invokedSetupPlusButton = true
        invokedSetupPlusButtonCount += 1
    }
}
