//
//  BaseTransactionCellModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class BaseTransactionCellModel: TransactionCellModel {

    var poundText: String
    var originalText: String

    init(transaction: Transaction, rate: Double) {
        let convertedAmount = (transaction.amount * rate * 100).rounded(.toNearestOrEven) / 100.0
        poundText = "\(Currency.gbp.symbol)\(convertedAmount)"
        originalText = "\(transaction.currency.symbol)\(transaction.amount)"
    }

}
