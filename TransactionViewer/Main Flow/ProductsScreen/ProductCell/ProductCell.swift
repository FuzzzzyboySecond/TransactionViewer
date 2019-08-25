//
//  ProductCell.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class ProductCell: UITableViewCell {

    func configure(with indexPath: IndexPath) {
        textLabel?.text = "Cell \(indexPath.row)"
    }

}
