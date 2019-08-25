//
//  BaseProductListViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

final class BaseProductListViewModel: ProductListViewModel {

    var cellModels = [ProductCellModel]()

    private weak var delegate: ProductListViewModelDelegate?

    init(delegate: ProductListViewModelDelegate) {
        self.delegate = delegate
        cellModels = [
            BaseProductCellModel(title: "A0911", transactionsCount: 424, delegate: self),
            BaseProductCellModel(title: "A8964", transactionsCount: 1, delegate: self),
            BaseProductCellModel(title: "C7156", transactionsCount: 441, delegate: self),
            BaseProductCellModel(title: "G7340", transactionsCount: 450, delegate: self),
            BaseProductCellModel(title: "J4064", transactionsCount: 429, delegate: self)
        ]
    }

}

extension BaseProductListViewModel: ProductCellModelDelegate {

    func productCellViewModelDidSelected(_ cellModel: ProductCellModel) {
        delegate?.productListViewModel(self, didSelectProduct: Product(title: cellModel.title, transactions: []))
    }

}
