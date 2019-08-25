//
//  BaseRateService.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

final class BaseRateService: RateService {

    private enum Constants {
        static let dataLoaderEndpoint: DataLoaderEndpoint = .rates
    }

    let dataLoader: DataLoader
    let mapper: RateMapper

    init(dataLoader: DataLoader, mapper: RateMapper) {
        self.dataLoader = dataLoader
        self.mapper = mapper
    }

    func loadRates(completion: @escaping (Result<[Rate], RateServiceError>) -> Void) {
        dataLoader.loadData(from: Constants.dataLoaderEndpoint) { [weak mapper] result in
            guard let data = try? result.get() else {
                completion(.failure(.loadError))
                return
            }

            guard let rates = try? mapper?.mapRates(from: data).get() else {
                completion(.failure(.mapper))
                return
            }

            completion(.success(rates))
        }
    }

}
