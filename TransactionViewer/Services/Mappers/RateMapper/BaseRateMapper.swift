//
//  BaseRateMapper.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

final class BaseRateMapper: RateMapper {

    let decoder = PropertyListDecoder()

    func mapRates(from data: Data) -> Result<[Rate], RateMapperError> {
        do {
            let rates = try decoder.decode([Rate].self, from: data)
            return .success(rates)
        } catch {
            return .failure(.decoding)
        }
    }

}
