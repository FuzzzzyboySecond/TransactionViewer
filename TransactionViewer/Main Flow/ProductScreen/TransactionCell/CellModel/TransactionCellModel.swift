//
//  TransactionCellModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

protocol TransactionCellModel {
    var poundText: String { get }
    var originalText: String { get }
    var poundsAmount: Double { get }
}
