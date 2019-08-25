//
//  TransactionsViewController.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class TransactionsViewController: UIViewController {

    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total £9,609.17"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TransactionCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let cellModels: [TransactionCellModel] = [
        BaseTransactionCellModel(poundText: "＄30.20", originalText: "£23.25"),
        BaseTransactionCellModel(poundText: "£19.70", originalText: "£19.70"),
        BaseTransactionCellModel(poundText: "CA＄30.70", originalText: "£21.75")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationItem()
        configureSubviews()
    }

    private func configureNavigationItem() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Transactions for A0911"
    }

    private func configureSubviews() {
        view.addSubview(totalLabel)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            totalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            totalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            totalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
            ])

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

            ])
    }

}

extension TransactionsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(for: TransactionCell.self, indexPath: indexPath) else { fatalError("Can't dequeue TransactionCell") }
        cell.configure(with: cellModels[indexPath.row])
        return cell
    }

}
