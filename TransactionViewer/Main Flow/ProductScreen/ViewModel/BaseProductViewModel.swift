//
//  BaseProductViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

final class BaseProductViewModel: ProductViewModel {

    let cellModels: [TransactionCellModel]

    let title: String

    init(product: Product) {
        title = "Transactions for \(product.sku)"
        cellModels = product.transactions.map { BaseTransactionCellModel(transaction: $0, rate: 0.5) }
        print(cellModels)
    }
}
