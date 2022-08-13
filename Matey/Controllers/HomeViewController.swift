//
//  HomeViewController.swift
//  Matey
//
//  Created by Firat Polat on 13.08.2022.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {

  // MARK: - UI Elements
  @IBOutlet weak var labelName: UILabel!
  @IBOutlet weak var labelWelcome: UILabel!
  @IBOutlet weak var labelTotalBalance: UILabel!
  @IBOutlet weak var labelTotalBalanceAmount: UILabel!
  @IBOutlet weak var labelLend: UILabel!
  @IBOutlet weak var labelLendAmount: UILabel!
  @IBOutlet weak var labelBorrow: UILabel!
  @IBOutlet weak var labelBorrowAmount: UILabel!
  @IBOutlet weak var labelHeader: UILabel!
  var plusButton: UIButton!

  // MARK: - Properties

  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    uiInit()
    setupPlusButton()
  }

  // MARK: - Functions

  private func uiInit() {
    title = "Home"
    labelName.text = "Hi Fırat"
    labelName.font = UIFont.boldSystemFont(ofSize: 32)
    labelWelcome.text = "welcome back"
    labelWelcome.font = UIFont.systemFont(ofSize: 24)
    labelWelcome.textColor = .secondaryLabel
    labelTotalBalance.text = "Total Balance"
    labelTotalBalance.font = UIFont.systemFont(ofSize: 16)
    labelTotalBalance.textColor = .secondaryLabel
    labelTotalBalanceAmount.text = "8,400 ₺"
    labelTotalBalanceAmount.font = UIFont.boldSystemFont(ofSize: 24)
    labelLend.text = "Lend"
    labelLend.font = UIFont.systemFont(ofSize: 16)
    labelLend.textColor = .secondaryLabel
    labelLendAmount.text = "10,000 ₺"
    labelLendAmount.font = UIFont.boldSystemFont(ofSize: 24)
    labelLendAmount.textColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
    labelBorrow.text = "Borrow"
    labelBorrow.font = UIFont.systemFont(ofSize: 16)
    labelBorrow.textColor = .secondaryLabel
    labelBorrowAmount.text = "1,600 ₺"
    labelBorrowAmount.font = UIFont.boldSystemFont(ofSize: 24)
    labelBorrowAmount.textColor = .red
    labelHeader.text = "Where is my Money?"
    labelHeader.font = UIFont.boldSystemFont(ofSize: 24)
    labelHeader.textColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
  }

  func setupPlusButton() {
          plusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
          var menuButtonFrame = plusButton.frame
        menuButtonFrame.origin.y = view.bounds.height - (view.bounds.height / 5)
          menuButtonFrame.origin.x = view.bounds.width/10 * 8
          plusButton.frame = menuButtonFrame

          plusButton.backgroundColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
          plusButton.layer.cornerRadius = menuButtonFrame.height/2
          view.addSubview(plusButton)

          plusButton.setImage(UIImage(named: "plus"), for: .normal)
          plusButton.imageView?.contentMode = .scaleToFill
          plusButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
          plusButton.addTarget(self, action: #selector(plusButtonAction(sender:)), for: .touchUpInside)

          view.layoutIfNeeded()
          plusButton.bringSubviewToFront(self.view)
      }

  // MARK: - Actions

  @objc private func plusButtonAction(sender: UIButton) {
      print("Tapped")
      let storyboard = UIStoryboard(name: "History", bundle: nil)
      let viewController = storyboard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
      self.navigationController?.pushViewController(viewController, animated: true)
      }
}
