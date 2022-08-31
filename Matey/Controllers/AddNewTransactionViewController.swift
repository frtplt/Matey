//
//  AddNewTransactionViewController.swift
//  Matey
//
//  Created by Firat Polat on 30.08.2022.
//

import Foundation
import UIKit

protocol AddNewTransactionViewControllerInterface: AnyObject {
    func uiInit()
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
        if validationTextFields() {
            viewModel?.saveTransaction(name: textFieldRegistrantsName.text ?? "", friend: textFieldFriendUsername.text ?? "", lend: textFieldLendAmount.text ?? "0.0", borrow: textFieldBorrowAmount.text ?? "0.0", username: textFieldRegistrantsUsername.text ?? "")
            showAlert(title: "Saved", message: "Transaction saved successfully!")
            setupTextFieldEmpty()
        }
    }

    // MARK: - Validation func for textfields

    private func validationTextFields() -> Bool {
        if textFieldRegistrantsName.text == "" {
            showAlert(title: "Warning", message: "Your name can not be empty!")
            return false
        } else if textFieldRegistrantsUsername.text == "" {
            showAlert(title: "Warning", message: "Your username can not be empty!")
            return false
        } else if textFieldFriendUsername.text == "" {
            showAlert(title: "Warning", message: "Friend username can not be empty!")
            return false
        } else {
            return true
        }
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
}
