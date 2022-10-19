//
//  OnboardingViewModel.swift
//  MateyTests
//
//  Created by Firat Polat on 15.10.2022.
//

import XCTest
@testable import Matey

final class OnboardingViewModelUnitTests: XCTestCase {

    private var view: MockOnboardingViewController!
    private var onboardingViewModel: OnboardingViewModelInterface!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = MockOnboardingViewController()
        onboardingViewModel = OnboardingViewModel(view: view)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        onboardingViewModel = nil
    }

    func test_notifyViewDidload_InvokesRequiredMethods() {
        XCTAssertFalse(view.invokedSetupUI)

        onboardingViewModel?.notifyViewDidload()

        XCTAssertTrue(view.invokedSetupUI)
    }

    func test_saveUsername_whenUsernameValid() {
        XCTAssertFalse(view.invokedPushMainTabBarViewController)

        onboardingViewModel.saveUsername(username: "Test")

        XCTAssertEqual(view.invokedPushMainTabBarViewControllerCount, 1)
    }

    func test_saveUsername_whenUsernameNotValid() {
        XCTAssertFalse(view.invokedPushMainTabBarViewController)
        XCTAssertFalse(view.invokedShowAlert)

        onboardingViewModel.saveUsername(username: "")

        XCTAssertEqual(view.invokedShowAlertCount, 2)
        XCTAssertEqual(view.invokedPushMainTabBarViewControllerCount, 0)
    }
}

