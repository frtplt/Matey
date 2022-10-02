//
//  HomeCell.swift
//  Matey
//
//  Created by Firat Polat on 10.09.2022.
//

import UIKit

final class HomeCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelFriendName: UILabel!
    @IBOutlet private weak var labelLend: UILabel!
    @IBOutlet private weak var labelBorrow: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(person: Person) {
        if person.borrow <= person.lend {
            imageView.image = UIImage(named: "rich")
        } else {
            imageView.image = UIImage(named: "broke")
        }
        labelFriendName.text = person.name?.uppercased()
        labelLend.text = "Lend \(person.lend) ₺"
        labelBorrow.text = "Borrow \(person.borrow) ₺"
        backgroundColor = .systemGray5
        layer.cornerRadius = 8.0
        imageView.layer.cornerRadius = 16.0

        layoutIfNeeded()
    }
}
