//
//  Rate.swift
//  TransactionViewer
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

struct Rate: Decodable {

    let source: String
    let destination: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case source = "from"
        case destination = "to"
        case value = "rate"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decode(String.self, forKey: .source)
        destination = try container.decode(String.self, forKey: .destination)
        value = try container.decode(String.self, forKey: .value)
    }

}
