//
//  BaseProductViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

final class BaseProductViewModel: ProductViewModel {

    private enum Constants {
        static let baseCurrency: Currency = .gbp
    }

    var cellModels = Dynamic([TransactionCellModel]())

    private let rateService: RateService
    private let product: Product
    private var rates = [Rate]()

    var title: String {
        return "Transactions for \(product.sku)"
    }

    init(product: Product, rateService: RateService) {
        self.product = product
        self.rateService = rateService
    }

    func updateRates() {
        print("=== update rates")
        rateService.loadRates { [weak self] result in
            switch result {
            case .success(let rates):
                print("=== success")
                self?.rates = rates
                self?.updateCellModels()
            case .failure(let error):
                print("=== failure \(error)")
            }
        }
    }

    private func updateCellModels() {
        cellModels.value = product.transactions.compactMap { [weak self] transaction in
            guard let rate = self?.rate(for: transaction.currency) else {
                print("Can't find rate for \(transaction.currency.rawValue)")
                return nil
            }
            return BaseTransactionCellModel(transaction: transaction,
                                     rate: rate)
        }
    }

    private func rate(for currency: Currency) -> Double? {
        guard currency != Constants.baseCurrency else { return 1 }
        if let rate = rates.first(where: { $0.destination == Constants.baseCurrency && $0.source == currency }) {
            return rate.value
        }
        return 0.5
    }
}
