//
//  OnboardingViewModel.swift
//  Matey
//
//  Created by Firat Polat on 14.09.2022.
//

import Foundation
import UIKit

protocol OnboardingViewModelInterface: AnyObject {
    func notifyViewDidload()
    func saveUsername(username: String?)
}

final class OnboardingViewModel {

    private weak var view: OnboardingViewControllerInterface?

    init(view: OnboardingViewControllerInterface?) {
        self.view = view
    }

    private func isTextFieldValid(textUserName: String) -> Bool {
        if textUserName.isEmpty {
            view?.showAlert(title: ConstantsOnboardingVC.messageWarning, message: ConstantsOnboardingVC.messageTransactionUserNameCantEmpty)
            return false
        }
        return true
    }
}

// MARK: - Interface Setup

extension OnboardingViewModel: OnboardingViewModelInterface {

    func notifyViewDidload() {
        view?.setupUI()
    }

    func saveUsername(username: String?) {
        if isTextFieldValid(textUserName: username ?? "") {
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.hasOnboarded = true
            view?.pushMainTabBarViewController()
        }
        else {
            view?.showAlert(title: "error", message: "error")
        }
    }
}
