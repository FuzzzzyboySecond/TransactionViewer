//
//  TransactionCell.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import UIKit

final class TransactionCell: UITableViewCell {

    private lazy var originalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var convertedPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with cellModel: TransactionCellModel) {
        convertedPriceLabel.text = cellModel.poundText
        originalPriceLabel.text = cellModel.originalText
    }

    private func configureSubviews() {
        contentView.addSubview(convertedPriceLabel)
        contentView.addSubview(originalPriceLabel)

        NSLayoutConstraint.activate([
            originalPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            originalPriceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            originalPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ])

        NSLayoutConstraint.activate([
            convertedPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            convertedPriceLabel.centerYAnchor.constraint(equalTo: originalPriceLabel.centerYAnchor)
            ])
    }

}
