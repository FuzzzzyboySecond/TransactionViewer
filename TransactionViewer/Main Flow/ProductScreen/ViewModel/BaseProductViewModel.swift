//
//  BaseProductViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

final class BaseProductViewModel: ProductViewModel {

    let cellModels: [TransactionCellModel] = [
        BaseTransactionCellModel(poundText: "＄30.20", originalText: "£23.25"),
        BaseTransactionCellModel(poundText: "£19.70", originalText: "£19.70"),
        BaseTransactionCellModel(poundText: "CA＄30.70", originalText: "£21.75")
    ]

    let title: String

    init(product: Product) {
        title = "Transactions for \(product.sku)"
    }
}
