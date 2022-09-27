//
//  OnboardingViewController.swift
//  Matey
//
//  Created by Firat Polat on 14.09.2022.
//

import UIKit

protocol OnboardingViewControllerInterface: BaseViewControllerInterface {
    func showAlert(title: String, message: String)
    func saveUsername()
    func pushMainTabBarViewController()
}

final class OnboardingViewController: UIViewController {

    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var labelDescription: UILabel!
    @IBOutlet weak private var labelUsernameTitle: UILabel!
    @IBOutlet weak private var textfieldUsername: UITextField!
    @IBOutlet weak private var buttonGetStarted: UIButton!

    var viewModel: OnboardingViewModelInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = OnboardingViewModel(view: self)
        viewModel?.notifyViewDidload()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func getStartedButtonAction() {
        saveUsername()
    }
}

// MARK: - Interface Setup

extension OnboardingViewController: OnboardingViewControllerInterface {
    //TODO: Show alert extension oluştur
    func showAlert(title: String, message: String) {
        self.showAlertExt(title: title, message: message)
    }

    func pushMainTabBarViewController() {
        let storyboard = UIStoryboard(name: ConstantsMainTabBarVC.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: ConstantsMainTabBarVC.storyboardIdentifier) as! MainTabBarViewController
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }

    func saveUsername() {
        guard let textUserName = textfieldUsername.text else { return }

        viewModel?.saveUsername(username: textUserName)
        }
    }

extension OnboardingViewController: BaseViewControllerInterface {
    func setupUI() {

        view.backgroundColor = ConstantsOnboardingVC.onboardingBackgroundColor

        imageView.image = UIImage(named: ConstantsOnboardingVC.onboardingImageName)

        labelDescription.text = ConstantsOnboardingVC.labelDescriptionText
        labelUsernameTitle.text = ConstantsOnboardingVC.labelUsernameTitleText

        textfieldUsername.placeholder = ConstantsOnboardingVC.textFieldUsernamePlaceHolderText

        buttonGetStarted.setTitle(ConstantsOnboardingVC.buttonGetStartedTitleText, for: .normal)
        buttonGetStarted.setTitleColor(ConstantsOnboardingVC.buttonGetStartedColor, for: .normal)
        buttonGetStarted.layer.cornerRadius = ConstantsOnboardingVC.buttonGetStartedCornerRadius
        buttonGetStarted.backgroundColor = .black
    }
}
