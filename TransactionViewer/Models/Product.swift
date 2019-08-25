//
//  Product.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

struct Product: Hashable {

    let sku: String
    var transactions: Set<Transaction>

    mutating func add(_ transaction: Transaction) {
        transactions.insert(transaction)
    }

}
