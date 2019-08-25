//
//  Rate.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

struct Rate: Decodable, Equatable {

    let source: String
    let destination: String
    let value: Double

    enum CodingKeys: String, CodingKey {
        case source = "from"
        case destination = "to"
        case value = "rate"
    }

    init(source: String, destination: String, value: Double) {
        self.source = source
        self.destination = destination
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(String.self, forKey: .source)
        destination = try container.decode(String.self, forKey: .destination)
        let valueString = try container.decode(String.self, forKey: .value)
        guard let value = Double(valueString) else {
            let context = DecodingError.Context(codingPath: [CodingKeys.value],
                                                debugDescription: "Can't convert string to double")
            throw DecodingError.dataCorrupted(context)
        }
        self.value = value
    }

}
