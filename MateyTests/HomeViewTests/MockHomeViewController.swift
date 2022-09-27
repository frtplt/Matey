//
//  MockHomeViewController.swift
//  MateyTests
//
//  Created by Firat Polat on 13.09.2022.
//

@testable import Matey

final class MockHomeViewController: HomeViewControllerInterface {

    var invokedSetupUI = false
    var invokedSetupUICount = 0

    func setupUI() {
        invokedSetupUI = true
        invokedSetupUICount += 1
    }
}
