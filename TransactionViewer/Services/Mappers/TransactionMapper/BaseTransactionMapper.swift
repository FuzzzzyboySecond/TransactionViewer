//
//  BaseTransactionMapper.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

final class BaseTransactionMapper: TransactionMapper {

    let decoder = PropertyListDecoder()

    func mapTransaction(from data: Data) -> Result<[Transaction], TransactionMapperError> {
        do {
            let transactions = try decoder.decode([Transaction].self, from: data)
            return .success(transactions)
        } catch {
            return .failure(.decoding)
        }
    }

}
