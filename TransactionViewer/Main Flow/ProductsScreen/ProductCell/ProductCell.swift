//
//  ProductCell.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class ProductCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!

    func configure(with cellModel: ProductCellModel) {
        titleLabel.text = cellModel.title
    }

}
