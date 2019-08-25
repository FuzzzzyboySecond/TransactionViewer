//
//  BaseProductsViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

final class BaseProductsViewModel: ProductsViewModel {

    let cellModels: [ProductCellModel] = [
        BaseProductCellModel(title: "A0911", transactionsCount: 424),
        BaseProductCellModel(title: "A8964", transactionsCount: 1),
        BaseProductCellModel(title: "C7156", transactionsCount: 441),
        BaseProductCellModel(title: "G7340", transactionsCount: 450),
        BaseProductCellModel(title: "J4064", transactionsCount: 429)
    ]

}
