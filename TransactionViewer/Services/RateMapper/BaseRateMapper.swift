//
//  BaseRateMapper.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

final class BaseRateMapper: RateMapper {

    func mapRates(from data: Data) -> [Rate] {
        let decoder = PropertyListDecoder()
        do {
            let rates = try decoder.decode([Rate].self, from: data)
            return rates
        } catch {
            print(error)
            return []
        }
    }

}
