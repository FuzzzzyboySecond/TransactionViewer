//
//  BaseProductCellModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

final class BaseProductCellModel: ProductCellModel {

    var title: String
    var detailsText: String

    init(title: String, transactionsCount: Int) {
        self.title = title
        detailsText = "\(transactionsCount) transactions"
    }

}
