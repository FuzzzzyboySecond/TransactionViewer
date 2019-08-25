//
//  TransactionMapperTests.swift
//  TransactionViewerTests
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import XCTest
@testable import TransactionViewer

class TransactionMapperTests: XCTestCase {

    var mapper: TransactionMapper!

    private let encoder = PropertyListEncoder()

    override func setUp() {
        super.setUp()
        mapper = BaseTransactionMapper()
    }

    override func tearDown() {
        mapper = nil
        super.tearDown()
    }

    func test_mapTransactions_valid_data() {
        // given
        let expected = [Transaction(sku: "A", currency: .usd, amount: 0.1)]
        let dict = [["sku": "A", "currency": "USD", "amount": "0.1"]]
        guard let data = try? encoder.encode(dict) else {
            XCTAssert(false, "Can't encode dict to data")
            return
        }

        // when
        let result = mapper.mapTransactions(from: data)

        // then
        XCTAssertEqual(expected, try? result.get())
    }

    func test_mapTransactions_invalide_data() {
        // given
        let expected = TransactionMapperError.decoding
        let dict = [["A": "A"]]
        guard let data = try? encoder.encode(dict) else {
            XCTAssert(false, "Can't encode dict to data")
            return
        }

        // when
        let result = mapper.mapTransactions(from: data)

        // then
        XCTAssertEqual(expected, result.error)
    }

}
