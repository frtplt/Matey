//
//  MockOnboardingViewController.swift
//  MateyTests
//
//  Created by Firat Polat on 15.10.2022.
//

@testable import Matey

final class MockOnboardingViewController: OnboardingViewControllerInterface {

    var invokedShowAlert = false
    var invokedShowAlertCount = 0
    var invokedShowAlertParameters: (title: String, message: String)?
    var invokedShowAlertParametersList = [(title: String, message: String)]()

    func showAlert(title: String, message: String) {
        invokedShowAlert = true
        invokedShowAlertCount += 1
        invokedShowAlertParameters = (title, message)
        invokedShowAlertParametersList.append((title, message))
    }

    var invokedPushMainTabBarViewController = false
    var invokedPushMainTabBarViewControllerCount = 0

    func pushMainTabBarViewController() {
        invokedPushMainTabBarViewController = true
        invokedPushMainTabBarViewControllerCount += 1
    }

    var invokedSetupUI = false
    var invokedSetupUICount = 0

    func setupUI() {
        invokedSetupUI = true
        invokedSetupUICount += 1
    }
}
