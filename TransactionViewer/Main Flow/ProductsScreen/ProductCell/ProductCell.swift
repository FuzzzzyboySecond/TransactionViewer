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
    @IBOutlet private weak var detailsLabel: UILabel!

    private var cellModel: ProductCellModel?

    func configure(with cellModel: ProductCellModel) {
        accessoryType = .disclosureIndicator
        self.cellModel = cellModel
        titleLabel.text = cellModel.title
        detailsLabel.text = cellModel.detailsText
    }

    @IBAction private func tap() {
        cellModel?.select()
    }

}
