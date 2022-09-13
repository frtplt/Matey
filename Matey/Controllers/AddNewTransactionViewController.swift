//
//  AddNewTransactionViewController.swift
//  Matey
//
//  Created by Firat Polat on 30.08.2022.
//

import UIKit

protocol AddNewTransactionViewControllerInterface: AnyObject {
    func uiInit()
    func showAlert(title: String, message: String)
    func saveTransaction()
}

final class AddNewTransactionViewController: UIViewController {

    @IBOutlet weak private var textFieldRegistrantsName: UITextField!
    @IBOutlet weak private var textFieldRegistrantsUsername: UITextField!
    @IBOutlet weak private var textFieldFriendUsername: UITextField!
    @IBOutlet weak private var textFieldLendAmount: UITextField!
    @IBOutlet weak private var textFieldBorrowAmount: UITextField!
    @IBOutlet weak private var buttonSaveNewTransaction: UIButton!

    var viewModel: AddNewTransactionViewModelInterface?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = AddNewTransactionViewModel(view: self)
        viewModel?.notifyViewDidload()
    }

    // MARK: - When user pressed the save button

    @IBAction func saveTransactionButtonAction(_ sender: UIButton) {
        saveTransaction()
    }

    // MARK: - Setup textfields empty func
    private func setupTextFieldEmpty() {
        textFieldRegistrantsName.text = ""
        textFieldRegistrantsUsername.text = ""
        textFieldFriendUsername.text = ""
        textFieldLendAmount.text = ""
        textFieldBorrowAmount.text = ""
    }
}

// MARK: - Interface Setup

extension AddNewTransactionViewController: AddNewTransactionViewControllerInterface {

    func uiInit() {
        title = ConstantsAddNewTransactionVC.title
        navigationController?.navigationBar.tintColor = ConstantsAddNewTransactionVC.navigationBarTintColor

        textFieldRegistrantsName.placeholder = ConstantsAddNewTransactionVC.textFieldRegistrantsNamePlaceholder
        textFieldRegistrantsName.textFieldCornerRadius()
        textFieldRegistrantsName.textFieldLeftPadding()

        textFieldRegistrantsUsername.placeholder = ConstantsAddNewTransactionVC.textFieldRegistrantsUsernamePlaceholder
        textFieldRegistrantsUsername.textFieldCornerRadius()
        textFieldRegistrantsUsername.textFieldLeftPadding()

        textFieldFriendUsername.placeholder = ConstantsAddNewTransactionVC.textFieldFriendUsernamePlaceholder
        textFieldFriendUsername.textFieldCornerRadius()
        textFieldFriendUsername.textFieldLeftPadding()

        textFieldLendAmount.placeholder = ConstantsAddNewTransactionVC.textFieldLendAmountPlaceholder
        textFieldLendAmount.keyboardType = ConstantsAddNewTransactionVC.textFieldLendAmountKeyboardType
        textFieldLendAmount.textFieldCornerRadius()
        textFieldLendAmount.textFieldLeftPadding()

        textFieldBorrowAmount.placeholder = ConstantsAddNewTransactionVC.textFieldBorrowAmountPlaceholder
        textFieldBorrowAmount.keyboardType = ConstantsAddNewTransactionVC.textFieldBorrowAmountKeyboardType
        textFieldBorrowAmount.textFieldCornerRadius()
        textFieldBorrowAmount.textFieldLeftPadding()

        buttonSaveNewTransaction.backgroundColor = ConstantsAddNewTransactionVC.buttonSaveNewTransactionBackgroundColor
        buttonSaveNewTransaction.tintColor = ConstantsAddNewTransactionVC.buttonSaveNewTransactionTintColor
        buttonSaveNewTransaction.layer.cornerRadius = ConstantsAddNewTransactionVC.buttonSaveNewTransactionCornerRadius
        buttonSaveNewTransaction.setTitle(ConstantsAddNewTransactionVC.buttonSaveNewTransactionTitle, for: .normal)
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: ConstantsAddNewTransactionVC.messageDone, style: UIAlertAction.Style.default) { (action) in }

        alertController.addAction(doneAction)
        alertController.view.tintColor = UIColor.black
        self.present(alertController, animated: true, completion: nil)
    }

    func saveTransaction() {
        let textRegistrantsName = textFieldRegistrantsName.text ?? ""
        let textFieldRegistrantsUsername = textFieldRegistrantsUsername.text ?? ""
        let textFieldFriendUsername = textFieldFriendUsername.text ?? ""

        if viewModel?.validationTextFields(textRegistrantsName: textRegistrantsName, textFieldRegistrantsUsername: textFieldRegistrantsUsername, textFieldFriendUsername: textFieldFriendUsername) == true {
            viewModel?.saveTransaction(name: textRegistrantsName, friend: textFieldFriendUsername, lend: Double(textFieldLendAmount.text ?? "0.0") ?? 0.0, borrow: Double(textFieldBorrowAmount.text ?? "0.0") ?? 0.0, username: textFieldRegistrantsUsername, id: UUID())
            showAlert(title: ConstantsAddNewTransactionVC.messageTransactionSaved, message: ConstantsAddNewTransactionVC.messageTransactionSuccessfully)
            setupTextFieldEmpty()
        }
        else {
            viewModel?.validationTextFields(textRegistrantsName: textRegistrantsName, textFieldRegistrantsUsername: textFieldRegistrantsUsername, textFieldFriendUsername: textFieldFriendUsername)
        }
    }
}
