//
//  TransactionService.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

enum TransactionServiceError: Error {
    case loadError
    case mapper
}

protocol TransactionService {
    func loadTransactions(completion: @escaping (Result<[Transaction], TransactionServiceError>) -> Void)
}
