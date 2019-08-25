//
//  RateMapper.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

protocol RateMapper {
    func mapRates(from data: Data) -> [Rate]
}
