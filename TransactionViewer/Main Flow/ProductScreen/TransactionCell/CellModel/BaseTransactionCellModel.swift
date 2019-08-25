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

    init(poundText: String, originalText: String) {
        self.poundText = poundText
        self.originalText = originalText
    }

}
