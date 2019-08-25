//
//  ProductListViewModel.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

protocol ProductListViewModelDelegate: class {
    func productListViewModel(_ viewModel: ProductListViewModel, didSelectProduct product: Product)
}

protocol ProductListViewModel {

    var cellModels: [ProductCellModel] { get }

    func load()

}
