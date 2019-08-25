//
//  UITableView+Extensions.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

extension UITableView {

    func register(_ cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: String(describing: cellType))
    }

    func dequeueReusableCell<T: UITableViewCell>(for cellType: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? T
    }

}
