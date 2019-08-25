//
//  Rate.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

struct Rate: Decodable, Equatable {

    let source: Currency
    let destination: Currency
    let value: Double

    enum CodingKeys: String, CodingKey {
        case source = "from"
        case destination = "to"
        case value = "rate"
    }

    init(source: Currency, destination: Currency, value: Double) {
        self.source = source
        self.destination = destination
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(Currency.self, forKey: .source)
        destination = try container.decode(Currency.self, forKey: .destination)
        let valueString = try container.decode(String.self, forKey: .value)
        guard let value = Double(valueString) else {
            let context = DecodingError.Context(codingPath: [CodingKeys.value],
                                                debugDescription: "Can't convert string to double")
            throw DecodingError.dataCorrupted(context)
        }
        self.value = value
    }

}
