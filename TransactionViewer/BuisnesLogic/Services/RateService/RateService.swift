//
//  RateService.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

enum RateServiceError: Error {
    case loadError
    case mapper
}

protocol RateService {
    func loadRates(completion: @escaping (Result<[Rate], RateServiceError>) -> Void)
}
