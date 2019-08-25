//
//  ProductCellModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

protocol ProductCellModel {
    var title: String { get }
    var transactionsCount: Int { get }
}
