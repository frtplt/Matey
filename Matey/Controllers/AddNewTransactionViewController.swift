//
//  AddNewTransactionViewController.swift
//  Matey
//
//  Created by Firat Polat on 30.08.2022.
//

import UIKit

protocol AddNewTransactionViewControllerInterface: BaseViewControllerInterface {
    func showAlert(title: String, message: String)
}

final class AddNewTransactionViewController: UIViewController {

    @IBOutlet weak private var textFieldRegistrantsName: UITextField!
    @IBOutlet weak private var textFieldRegistrantsUsername: UITextField!
    @IBOutlet weak private var textFieldFriendUsername: UITextField!
    @IBOutlet weak private var textFieldLendAmount: UITextField!
    @IBOutlet weak private var textFieldBorrowAmount: UITextField!
    @IBOutlet weak private var buttonSaveNewTransaction: UIButton!

    private var viewModel: AddNewTransactionViewModelInterface?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = AddNewTransactionViewModel(view: self)
        viewModel?.notifyViewWillAppear()
    }

    // MARK: - When user pressed the save button

    @IBAction func saveTransactionAction() {
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

    func setupUI() {
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
        self.showAlertExt(title: title, message: message)
    }

    func saveTransaction() {
        //TODO: Make clear
        guard let textRegistrantsName = textFieldRegistrantsName.text, let textFieldRegistrantsUsername = textFieldRegistrantsUsername.text, let textFieldFriendUsername = textFieldFriendUsername.text, let textFieldLendAmount = Double(textFieldLendAmount.text ?? "0"), let textFieldBorrowAmount = Double(textFieldBorrowAmount.text ?? "0") else { return self.showAlert(title: ConstantsAddNewTransactionVC.messageCouldntSave, message: ConstantsAddNewTransactionVC.messageFillLines)}

        viewModel?.textRegistrantsName = textRegistrantsName
        viewModel?.textFieldRegistrantsUsername = textFieldRegistrantsUsername
        viewModel?.textFieldFriendUsername = textFieldFriendUsername
        viewModel?.textFieldBorrowAmount = textFieldBorrowAmount
        viewModel?.textFieldLendAmount = textFieldLendAmount

        viewModel?.saveTransaction(name: textRegistrantsName, friend: textFieldFriendUsername, lend: textFieldLendAmount, borrow: textFieldBorrowAmount, username: textFieldRegistrantsUsername)
    }
}
