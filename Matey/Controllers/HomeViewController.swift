//
//  HomeViewController.swift
//  Matey
//
//  Created by Firat Polat on 13.08.2022.
//

import Foundation
import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func uiInit()
    func setupPlusButton()
}

final class HomeViewController: UIViewController {

    // MARK: - UI Elements
    @IBOutlet weak private var labelName: UILabel!
    @IBOutlet weak private var labelWelcome: UILabel!
    @IBOutlet weak private var labelTotalBalance: UILabel!
    @IBOutlet weak private var labelTotalBalanceAmount: UILabel!
    @IBOutlet weak private var labelLend: UILabel!
    @IBOutlet weak private var labelLendAmount: UILabel!
    @IBOutlet weak private var labelBorrow: UILabel!
    @IBOutlet weak private var labelBorrowAmount: UILabel!
    @IBOutlet weak private var labelHeader: UILabel!
    private var plusButton: UIButton!

    // MARK: - Properties

    var viewModel: HomeViewModelInterface?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HomeViewModel(view: self)
        viewModel?.notifyViewDidload()
    }
}

    // MARK: - Interface Setup

extension HomeViewController: HomeViewControllerInterface {

    func uiInit() {
        title = ConstantsHomeVC.title
        labelName.text = ConstantsHomeVC.labelNameText
        labelName.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelNameFontSize)

        labelWelcome.text = ConstantsHomeVC.labelWelcomeText
        labelWelcome.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelWelcomeFontSize)
        labelWelcome.textColor = .secondaryLabel

        labelTotalBalance.text = ConstantsHomeVC.labelTotalBalanceText
        labelTotalBalance.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelTotalBalanceFontSize)
        labelTotalBalance.textColor = .secondaryLabel
        labelTotalBalanceAmount.text = ConstantsHomeVC.labelTotalBalanceAmountText
        labelTotalBalanceAmount.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelTotalBalanceAmountFont)

        labelLend.text = ConstantsHomeVC.labelLendText
        labelLend.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelLendFontSize)
        labelLend.textColor = .secondaryLabel
        labelLendAmount.text = ConstantsHomeVC.labelLendAmountText
        labelLendAmount.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelLendAmountFontSize)
        labelLendAmount.textColor = ConstantsHomeVC.labelLendAmountTextColor

        labelBorrow.text = ConstantsHomeVC.labelBorrowText
        labelBorrow.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelBorrowFontSize)
        labelBorrow.textColor = .secondaryLabel
        labelBorrowAmount.text = ConstantsHomeVC.labelBorrowAmountText
        labelBorrowAmount.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelBorrowAmountFontSize)
        labelBorrowAmount.textColor = ConstantsHomeVC.labelBorrowAmountTextColor

        labelHeader.text = ConstantsHomeVC.labelHeaderText
        labelHeader.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelHeaderFontSize)
        labelHeader.textColor = ConstantsHomeVC.labelHeaderTextColor
    }

    func setupPlusButton() {
        plusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        var menuButtonFrame = plusButton.frame
        menuButtonFrame.origin.y = view.bounds.height - (view.bounds.height / 5)
        menuButtonFrame.origin.x = view.bounds.width/10 * 8
        plusButton.frame = menuButtonFrame

        plusButton.backgroundColor = ConstantsHomeVC.plusButtonBackgroundColor
        plusButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(plusButton)

        plusButton.setImage(UIImage(named: "plus"), for: .normal)
        plusButton.imageView?.contentMode = .scaleToFill
        plusButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)

        view.layoutIfNeeded()
        plusButton.bringSubviewToFront(self.view)
    }

    // MARK: - Actions

    @objc private func plusButtonAction() {
        print("Tapped")
        guard let viewController = self.storyboard?.instantiateViewController(ofType: HistoryViewController.self) else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
