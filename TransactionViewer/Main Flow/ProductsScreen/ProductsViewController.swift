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
        tableView.register(ProductCell.self)
    }

}

extension ProductsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(for: ProductCell.self, indexPath: indexPath) else {
            fatalError("Can't deque ProductCell")
        }
        cell.configure(with: indexPath)
        return cell
    }

}
