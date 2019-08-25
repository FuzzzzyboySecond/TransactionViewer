//
//  Result+Extensions.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import Foundation

extension Result {

    var error: Failure? {
        switch self {
        case .success: return nil
        case .failure(let failure): return failure
        }
    }
}
