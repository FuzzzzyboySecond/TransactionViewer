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

    var viewModel: ProductsViewModel?

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
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
        return viewModel?.cellModels.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(for: ProductCell.self, indexPath: indexPath),
            let cellModel = viewModel?.cellModels[indexPath.row]
            else { fatalError("Can't dequeue ProductCell") }

        cell.configure(with: cellModel)
        return cell
    }

}
