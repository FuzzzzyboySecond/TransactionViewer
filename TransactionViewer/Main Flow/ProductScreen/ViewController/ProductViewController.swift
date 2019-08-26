//
//  ProductViewController.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController {

    private lazy var totalLabel: UILabel = {
        let label = UILabel()
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

    var viewModel: ProductViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationItem()
        configureSubviews()
        bindViewModel()
        viewModel?.updateRates()
    }

    private func configureNavigationItem() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = viewModel?.title
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

    private func bindViewModel() {
        viewModel?.cellModels.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel?.totalText.bind { [weak self] text in
            DispatchQueue.main.async {
                self?.totalLabel.text = text
            }
        }
    }

}

extension ProductViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellModels.value.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(for: TransactionCell.self, indexPath: indexPath),
            let cellModel = viewModel?.cellModels.value[indexPath.row]
            else { fatalError("Can't dequeue TransactionCell") }
        cell.configure(with: cellModel)
        return cell
    }

}
