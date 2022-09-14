//
//  OnboardingViewController.swift
//  Matey
//
//  Created by Firat Polat on 14.09.2022.
//

import UIKit

protocol OnboardingViewControllerInterface: AnyObject {
    func uiInit()
    func showAlert(title: String, message: String)
    func saveUsername()
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

        // Do any additional setup after loading the view.
        viewModel = OnboardingViewModel(view: self)
        viewModel?.notifyViewDidload()
    }

    @IBAction func getStartedButtonAction(_ sender: UIButton) {
        saveUsername()
        UserDefaults.standard.hasOnboarded = true
    }
}

// MARK: - Interface Setup

extension OnboardingViewController: OnboardingViewControllerInterface {

    func uiInit() {
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

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: ConstantsAddNewTransactionVC.messageDone, style: UIAlertAction.Style.default) { (action) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }

        alertController.addAction(doneAction)
        alertController.view.tintColor = UIColor.black
        self.present(alertController, animated: true, completion: nil)
    }

    func saveUsername() {
        let textUserName = textfieldUsername.text ?? ""

        if viewModel?.validationTextFields(textUserName: textUserName) == true {
            viewModel?.saveUsername(username: textUserName)
            showAlert(title: ConstantsOnboardingVC.messageUsernameSaved, message: ConstantsOnboardingVC.messageUsernameSuccessfully)
        }
        else {
            viewModel?.validationTextFields(textUserName: textUserName)
        }
    }
}
