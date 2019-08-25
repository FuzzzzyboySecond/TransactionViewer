//
//  ProductsViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

protocol ProductsViewModelDelegate: class {
    func productsViewModel(_ viewModel: ProductsViewModel, didSelectProduct product: Product)
}

protocol ProductsViewModel {
    var cellModels: [ProductCellModel] { get }
}
