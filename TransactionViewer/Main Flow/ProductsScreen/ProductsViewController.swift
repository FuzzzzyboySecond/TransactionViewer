//
//  ProductsViewController.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class ProductsViewController: UIViewController {

    private enum Constants {
        static let navigationTitle = "Products"
    }

    @IBOutlet private weak var tableView: UITableView!

    private let cellModels: [ProductCellModel] = [
        BaseProductCellModel(title: "A0911", transactionsCount: 424),
        BaseProductCellModel(title: "A8964", transactionsCount: 420),
        BaseProductCellModel(title: "C7156", transactionsCount: 441),
        BaseProductCellModel(title: "G7340", transactionsCount: 450),
        BaseProductCellModel(title: "J4064", transactionsCount: 429)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationItem()
    }

    private func configureNavigationItem() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Constants.navigationTitle
    }

    private func configureTableView() {
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.registerNib(ProductCell.self)
    }

}

extension ProductsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(for: ProductCell.self, indexPath: indexPath) else {
            fatalError("Can't deque ProductCell")
        }
        cell.configure(with: cellModels[indexPath.row])
        return cell
    }

}
