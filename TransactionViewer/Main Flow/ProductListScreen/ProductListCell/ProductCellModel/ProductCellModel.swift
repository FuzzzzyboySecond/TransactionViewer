//
//  ProductCellModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

protocol ProductCellModelDelegate: class {
    func productCellViewModelDidSelected(_ cellModel: ProductCellModel, with product: Product)
}

protocol ProductCellModel {

    var title: String { get }
    var detailsText: String { get }

    func select()

}
