//
//  OnboardingViewModel.swift
//  Matey
//
//  Created by Firat Polat on 14.09.2022.
//

import Foundation

protocol OnboardingViewModelInterface: AnyObject {
    func notifyViewDidload()
    func validationTextFields(textUserName: String) -> Bool
    func saveUsername(username: String)
}

final class OnboardingViewModel {

    private weak var view: OnboardingViewControllerInterface?

    init(view: OnboardingViewControllerInterface?) {
        self.view = view
    }

    func saveUsername(username: String) {
        UserDefaults.standard.set(username, forKey: "username")
    }
}

// MARK: - Interface Setup

extension OnboardingViewModel: OnboardingViewModelInterface {

    func notifyViewDidload() {
        view?.uiInit()
    }

    func validationTextFields(textUserName: String) -> Bool {
        if textUserName.isEmpty {
            view?.showAlert(title: ConstantsOnboardingVC.messageWarning, message: ConstantsOnboardingVC.messageTransactionUserNameCantEmpty)
            return false
        }
        return true
    }
}
