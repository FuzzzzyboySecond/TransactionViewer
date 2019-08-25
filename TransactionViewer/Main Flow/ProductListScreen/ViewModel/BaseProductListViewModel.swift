//
//  BaseProductListViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

final class BaseProductListViewModel: ProductListViewModel {

    var cellModels = Dynamic([ProductCellModel]())

    private let transactionService: TransactionService
    private var productsDict = [String: Product]()
    private weak var delegate: ProductListViewModelDelegate?

    init(transactionService: TransactionService, delegate: ProductListViewModelDelegate) {
        self.transactionService = transactionService
        self.delegate = delegate
    }

    func load() {
        transactionService.loadTransactions { [weak self] result in
            switch result {
            case .success(let transactions):
                self?.handle(transactions)
            case .failure(let error):
                print("transactionService error: \(error)")
            }
        }
    }

    private func handle(_ transactions: [Transaction]) {
        transactions.forEach { transaction in
            guard productsDict[transaction.sku] != nil else {
                productsDict[transaction.sku] = Product(sku: transaction.sku, transactions: [transaction])
                return
            }
            productsDict[transaction.sku]?.add(transaction)
        }
        cellModels.value = productsDict.values.map { BaseProductCellModel.init(product: $0, delegate: self) }
    }

}

extension BaseProductListViewModel: ProductCellModelDelegate {

    func productCellViewModelDidSelected(_ cellModel: ProductCellModel, with product: Product) {
        delegate?.productListViewModel(self, didSelectProduct: product)
    }

}
