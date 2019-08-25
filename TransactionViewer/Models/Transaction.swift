//
//  Transaction.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

struct Transaction: Decodable, Hashable {

    var sku: String
    var currency: Currency
    var amount: Double

    init(sku: String, currency: Currency, amount: Double) {
        self.sku = sku
        self.currency = currency
        self.amount = amount
    }

    enum CodingKeys: String, CodingKey {
        case sku
        case currency
        case amount
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sku = try container.decode(String.self, forKey: .sku)
        currency = try container.decode(Currency.self, forKey: .currency)
        let amountString = try container.decode(String.self, forKey: .amount)
        guard let amount = Double(amountString) else {
            let context = DecodingError.Context(codingPath: [CodingKeys.amount],
                                                debugDescription: "Can't convert string to double")
            throw DecodingError.dataCorrupted(context)
        }
        self.amount = amount
    }

}
