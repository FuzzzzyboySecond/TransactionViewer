//
//  BaseProductCellModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

final class BaseProductCellModel: ProductCellModel {

    var title: String {
        return product.sku
    }
    var detailsText: String

    private let product: Product
    private weak var delegate: ProductCellModelDelegate?

    init(product: Product, delegate: ProductCellModelDelegate) {
        self.product = product
        let transactionCountText = product.transactions.count == 1 ? "transaction" : "transactions"
        detailsText = "\(product.transactions.count) \(transactionCountText)"
        self.delegate = delegate
    }

    func select() {
        delegate?.productCellViewModelDidSelected(self, with: product)
    }

}
