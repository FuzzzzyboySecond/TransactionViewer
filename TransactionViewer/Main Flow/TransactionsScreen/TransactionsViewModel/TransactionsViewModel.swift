//
//  TransactionsViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

protocol TransactionsViewModel {
    var cellModels: [TransactionCellModel] { get }
}
