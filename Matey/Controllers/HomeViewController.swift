//
//  HomeViewController.swift
//  Matey
//
//  Created by Firat Polat on 13.08.2022.
//

import Foundation
import UIKit

protocol HomeViewControllerInterface: BaseViewControllerInterface {}

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
    @IBOutlet weak private var collectionView: UICollectionView!
    private var plusButton: UIButton!

    // MARK: - Properties
    private var viewModel: HomeViewModelInterface!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel = HomeViewModel(view: self)
        viewModel?.notifyViewWillAppear()
        collectionView.reloadData()
    }
    // MARK: - Collectionview layout setup

    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in

            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(CGFloat(ConstantsHomeVC.collectionViewItemFractionalWidth)), heightDimension: .fractionalHeight(CGFloat(ConstantsHomeVC.collectionViewItemFractionalHeight))))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(CGFloat(ConstantsHomeVC.collectionViewGroupWidthDimension)), heightDimension: .absolute(CGFloat(ConstantsHomeVC.collectionViewGroupHeightDimension))), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = CGFloat(ConstantsHomeVC.interGroupSpacing)
            section.contentInsets = .init(top: CGFloat(ConstantsHomeVC.contentInsetsTop), leading: CGFloat(ConstantsHomeVC.contentInsetsLeading), bottom: CGFloat(ConstantsHomeVC.contentInsetsBottom), trailing: CGFloat(ConstantsHomeVC.contentInsetsTrailing))

            return section
        }
    }

    private func setupPlusButton() {
        plusButton = UIButton(frame: ConstantsHomeVC.plusButtonFrame)
        var menuButtonFrame = plusButton.frame
        menuButtonFrame.origin.y = view.bounds.height - (view.bounds.height / 5)
        menuButtonFrame.origin.x = view.bounds.width / 10 * 8
        plusButton.frame = menuButtonFrame

        plusButton.backgroundColor = ConstantsHomeVC.plusButtonBackgroundColor
        plusButton.layer.cornerRadius = menuButtonFrame.height / 2
        view.addSubview(plusButton)

        plusButton.setImage(UIImage(named: ConstantsHomeVC.plusButtonName), for: .normal)
        plusButton.imageView?.contentMode = .scaleToFill
        plusButton.imageEdgeInsets = ConstantsHomeVC.imageEdgeInsets
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)

        view.layoutIfNeeded()
        plusButton.bringSubviewToFront(self.view)
    }

    // MARK: - Actions

    @objc private func plusButtonAction() {
        guard let viewController = UIStoryboard(name: ConstantsAddNewTransactionVC.storyboardName, bundle: Bundle.main).instantiateInitialViewController(ofType: AddNewTransactionViewController?.self) else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Collectionview setup

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsHomeVC.homeCellIdentifier, for: indexPath) as? HomeCell else { return UICollectionViewCell() }

        if viewModel.currentUserDataCount > 0 {
            guard let person = viewModel?.getCurrentUserData(with: indexPath.item) else { return UICollectionViewCell() }

            cell.configure(person: person)
            return cell
        }
        else {
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = viewModel?.currentUserData?[indexPath.item]

        self.showAlertExt(title: ConstantsHomeVC.homeDeleteAlertMessage, message: nil) {

            guard let id = person?.id else { return }
            self.viewModel?.deleteTransaction(id: id, indexpath: indexPath.row)
            collectionView.reloadData()
        }
    }
}

// MARK: - Interface Setup

extension HomeViewController: HomeViewControllerInterface {

    func setupUI() {

        setupPlusButton()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()

        title = ConstantsHomeVC.title
        labelName.text = ConstantsUserDefault.currentUsername
        labelName.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelNameFontSize)

        labelWelcome.text = ConstantsHomeVC.labelWelcomeText
        labelWelcome.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelWelcomeFontSize)
        labelWelcome.textColor = .secondaryLabel

        labelTotalBalance.text = ConstantsHomeVC.labelTotalBalanceText
        labelTotalBalance.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelTotalBalanceFontSize)
        labelTotalBalance.textColor = .secondaryLabel
        labelTotalBalanceAmount.text = viewModel?.totalBalanceLabelAmount()
        labelTotalBalanceAmount.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelTotalBalanceAmountFont)

        labelLend.text = ConstantsHomeVC.labelLendText
        labelLend.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelLendFontSize)
        labelLend.textColor = .secondaryLabel
        labelLendAmount.text = viewModel?.lendLabelAmount()
        labelLendAmount.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelLendAmountFontSize)
        labelLendAmount.textColor = ConstantsHomeVC.labelLendAmountTextColor

        labelBorrow.text = ConstantsHomeVC.labelBorrowText
        labelBorrow.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelBorrowFontSize)
        labelBorrow.textColor = .secondaryLabel
        labelBorrowAmount.text = viewModel?.borrowLabelAmount()
        labelBorrowAmount.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelBorrowAmountFontSize)
        labelBorrowAmount.textColor = ConstantsHomeVC.labelBorrowAmountTextColor

        labelHeader.text = ConstantsHomeVC.labelHeaderText
        labelHeader.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelHeaderFontSize)
        labelHeader.textColor = ConstantsHomeVC.labelHeaderTextColor
    }
}
