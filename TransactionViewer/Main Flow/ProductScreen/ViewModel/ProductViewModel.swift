//
//  ProductViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

protocol ProductViewModel {

    var title: String { get }
    var totalText: Dynamic<String> { get }
    var cellModels: Dynamic<[TransactionCellModel]> { get }

    func updateRates()

}
