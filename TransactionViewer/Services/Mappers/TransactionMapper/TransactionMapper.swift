//
//  TransactionMapper.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

enum TransactionMapperError: Error {
    case decoding
}

protocol TransactionMapper {
    func mapTransaction(from data: Data) -> Result<[Transaction], TransactionMapperError>
}
