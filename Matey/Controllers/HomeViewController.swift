//
//  HomeViewController.swift
//  Matey
//
//  Created by Firat Polat on 13.08.2022.
//

import Foundation
import UIKit

protocol HomeViewControllerInterface: AnyObject {
    var coreDataManager: CoreDataManager { get }
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
    @IBOutlet weak var collectionView: UICollectionView!
    private var plusButton: UIButton!

    // MARK: - Properties

    var coreDataManager = CoreDataManager()
    var viewModel: HomeViewModelInterface?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HomeViewModel(view: self)
        viewModel?.currentUserData(username: "firat") // will be updated after doing the onboarding screen
        viewModel?.notifyViewDidload()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel?.currentUserData(username: "firat") // will be updated after doing the onboarding screen
        viewModel?.totalBorrowCount()
        viewModel?.totalLendCount()
        viewModel?.notifyViewDidload()
        collectionView.reloadData()
    }

    // MARK: - Collectionview layout setup

    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }

            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(218), heightDimension: .absolute(318)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 10
            section.contentInsets = .init(top: 0, leading: 10, bottom: 30, trailing: 10)

            return section
        }
    }
}

// MARK: - Collectionview setup

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.currentUserData?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsHomeVC.homeCellIdentifier, for: indexPath) as? HomeCell else { return UICollectionViewCell() }

        let person = viewModel?.currentUserData?[indexPath.item] ?? Person()

        cell.configure(person: person)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = viewModel?.currentUserData?[indexPath.item]

        let alertController = UIAlertController(title: ConstantsHomeVC.homeDeleteAlertMessage, message: nil, preferredStyle: .alert)

        alertController.addAction(UIAlertAction.init(title: "yes", style: .default, handler: { _ in
            self.collectionView.deleteItems(at: [indexPath])
            self.coreDataManager.delete(id: (person?.id)!)
            self.viewModel?.currentUserData(username: "firat") // will be updated after doing the onboarding screen
            collectionView.reloadData()
        }))

        let disableAction = UIAlertAction(title: "no", style: .default, handler: { _ in })

        alertController.addAction(disableAction)
        alertController.view.tintColor = .black
        alertController.preferredAction = disableAction
        self.present(alertController, animated: true, completion: nil)
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
        labelTotalBalanceAmount.text = "\(Double(Int(viewModel?.totalLend ?? 0.0) + Int(viewModel?.totalBorrow ?? 0.0))) ₺"
        labelTotalBalanceAmount.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelTotalBalanceAmountFont)

        labelLend.text = ConstantsHomeVC.labelLendText
        labelLend.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelLendFontSize)
        labelLend.textColor = .secondaryLabel
        labelLendAmount.text = "\(viewModel?.totalLend ?? 0.0) ₺"
        labelLendAmount.font = UIFont.boldSystemFont(ofSize: ConstantsHomeVC.labelLendAmountFontSize)
        labelLendAmount.textColor = ConstantsHomeVC.labelLendAmountTextColor

        labelBorrow.text = ConstantsHomeVC.labelBorrowText
        labelBorrow.font = UIFont.systemFont(ofSize: ConstantsHomeVC.labelBorrowFontSize)
        labelBorrow.textColor = .secondaryLabel
        labelBorrowAmount.text = "\(viewModel?.totalBorrow ?? 0.0) ₺"
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

        plusButton.backgroundColor = UIColor(displayP3Red: 47/255, green: 140/255, blue: 79/255, alpha: 1.0)
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
        guard let viewController = UIStoryboard(name: "AddNewTransaction", bundle: Bundle.main).instantiateInitialViewController(ofType: AddNewTransactionViewController?.self) else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
