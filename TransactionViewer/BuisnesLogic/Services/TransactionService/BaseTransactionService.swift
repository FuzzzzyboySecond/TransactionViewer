//
//  BaseTransactionService.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

final class BaseTransactionService: TransactionService {

    private enum Constants {
        static let dataLoaderEndpoint: DataLoaderEndpoint = .transactions
    }

    let dataLoader: DataLoader
    let mapper: TransactionMapper

    init(dataLoader: DataLoader, mapper: TransactionMapper) {
        self.dataLoader = dataLoader
        self.mapper = mapper
    }

    func loadTransactions(completion: @escaping (Result<[Transaction], TransactionServiceError>) -> Void) {
        dataLoader.loadData(from: Constants.dataLoaderEndpoint) { [weak mapper] result in
            guard let data = try? result.get() else {
                completion(.failure(.loadError))
                return
            }

            guard let transactions = try? mapper?.mapTransactions(from: data).get() else {
                completion(.failure(.mapper))
                return
            }

            completion(.success(transactions))
        }
    }

}
