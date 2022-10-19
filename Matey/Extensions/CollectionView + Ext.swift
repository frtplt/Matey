//
//  CollectionView + Ext.swift
//  Matey
//
//  Created by Firat Polat on 18.09.2022.
//

import Foundation
import UIKit

extension UICollectionView {

    func registerCell<T: UICollectionViewCell>(cell: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: cell))
    }

    func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: String(describing: T.Type.self), for: indexPath) as? T
    }
}
