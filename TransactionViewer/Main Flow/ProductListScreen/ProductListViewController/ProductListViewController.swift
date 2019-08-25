//
//  ProductListViewController.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class ProductListViewController: UIViewController {

    private enum Constants {
        static let navigationTitle = "Products"
    }

    var viewModel: ProductListViewModel?

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        configureTableView()
        bindViewModel()
        viewModel?.load()
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

    private func bindViewModel() {
        viewModel?.cellModels.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

extension ProductListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellModels.value.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(for: ProductCell.self, indexPath: indexPath),
            let cellModel = viewModel?.cellModels.value[indexPath.row]
            else { fatalError("Can't dequeue ProductCell") }

        cell.configure(with: cellModel)
        return cell
    }

}
