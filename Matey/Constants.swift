//
//  Constants.swift
//  Matey
//
//  Created by Firat Polat on 24.08.2022.
//

import Foundation
import UIKit

struct ConstantsHomeVC {
    static let title = "Home"

    static let labelNameText = "Hi Fırat"
    static let labelNameFontSize = 32.0

    static let labelWelcomeText = "welcome back!"
    static let labelWelcomeFontSize = 24.0

    static let labelTotalBalanceText = "Total Balance"
    static let labelTotalBalanceFontSize = 16.0

    static let labelTotalBalanceAmountText = "8,400 ₺"
    static let labelTotalBalanceAmountFont = 24.0


    static let labelLendText = "Lend"
    static let labelLendFontSize = 16.0

    static let labelLendAmountText = "10,000 ₺"
    static let labelLendAmountFontSize = 24.0
    static let labelLendAmountTextColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)

    static let labelBorrowText = "Borrow"
    static let labelBorrowFontSize = 16.0

    static let labelBorrowAmountText = "1,600 ₺"
    static let labelBorrowAmountFontSize = 24.0
    static let labelBorrowAmountTextColor = UIColor.red

    static let labelHeaderText = "Where is my Money?"
    static let labelHeaderFontSize = 24.0
    static let labelHeaderTextColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)

    static let homeCellIdentifier = "HomeCell"
    static let homeDeleteAlertMessage = "Are you sure want to delete transaction?"

    static let collectionViewItemFractionalWidth = 1
    static let collectionViewItemFractionalHeight = 1

    static let collectionViewGroupWidthDimension = 218
    static let collectionViewGroupHeightDimension = 318

    static let interGroupSpacing = 10
    static let contentInsetsTop = 0
    static let contentInsetsLeading = 10
    static let contentInsetsBottom = 30
    static let contentInsetsTrailing = 10

    static let plusButtonBackgroundColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
    static let plusButtonFrame = CGRect(x: 0, y: 0, width: 64, height: 64)
    static let imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    static let plusButtonName = "plus"
}

struct ConstantsAddNewTransactionVC {
    static let storyboardName = "AddNewTransaction"
    static let title = "Add New Transaction"

    static let navigationBarTintColor = UIColor.white

    static let textFieldRegistrantsNamePlaceholder = "Friend Name"
    static let textFieldRegistrantsUsernamePlaceholder = "Your Username"
    static let textFieldFriendUsernamePlaceholder = "Friend Username"
    static let textFieldLendAmountPlaceholder = "Lend Amount"
    static let textFieldBorrowAmountPlaceholder = "Borrow Amount"

    static let textFieldLendAmountKeyboardType = UIKeyboardType.decimalPad
    static let textFieldBorrowAmountKeyboardType = UIKeyboardType.decimalPad

    static let buttonSaveNewTransactionBackgroundColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
    static let buttonSaveNewTransactionTintColor = UIColor.black
    static let buttonSaveNewTransactionCornerRadius = 16.0
    static let buttonSaveNewTransactionTitle = "Save"

    static let messageTransactionSuccessfully = "Transaction saved successfully!"
    static let messageTransactionSaved = "Saved"
    static let messageTransactionYourNameCantEmpty = "Your name can not be empty!"
    static let messageTransactionYourUsernameCantEmpty =  "Your username can not be empty!"
    static let messageTransactionFriendUsernameCantEmpty = "Friend username can not be empty!"
    static let messageWarning = "Warning"
    static let messageDone = "Done"
    static let messageFillLines = "Please fill the lines"
    static let messageCouldntSave = "Failed to save!"
}

struct ConstantsOnboardingVC {
    static let onboardingBackgroundColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
    static let onboardingImageName = "personOnboarding"

    static let labelDescriptionText = "Easily Follow Transaction with Personal Profile"
    static let labelUsernameTitleText = "Enter Your Name"

    static let textFieldUsernamePlaceHolderText = "Please Enter Your Name"

    static let buttonGetStartedTitleText = "Get Started"
    static let buttonGetStartedColor = UIColor.white
    static let buttonGetStartedCornerRadius = 8.0

    static let messageUsernameSuccessfully = "Username saved successfully!"
    static let messageUsernameSaved = "Saved"
    static let messageWarning = "Warning"
    static let messageTransactionUserNameCantEmpty = "Username can not be empty!"
}

struct ConstantsMainTabBarVC {
    static let storyboardName = "Main"
    static let storyboardIdentifier = "MainTabBarViewController"
    
    static let tabBarTintColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
}

struct ConstantsUserDefault {
    static let currentUsername = UserDefaults.standard.value(forKey: "username") as? String ?? ""
}


