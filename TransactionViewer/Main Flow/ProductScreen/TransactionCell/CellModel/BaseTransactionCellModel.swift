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
        poundText = "\(Currency.gbp.symbol)\(transaction.amount * rate)"
        originalText = "\(transaction.currency.symbol)\(transaction.amount)"
    }

}
