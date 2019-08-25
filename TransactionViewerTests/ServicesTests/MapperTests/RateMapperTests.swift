//
//  RateMapperTests.swift
//  TransactionViewerTests
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import XCTest
@testable import TransactionViewer

class RateMapperTests: XCTestCase {

    var mapper: RateMapper!

    private let encoder = PropertyListEncoder()

    override func setUp() {
        super.setUp()
        mapper = BaseRateMapper()
    }

    override func tearDown() {
        mapper = nil
        super.tearDown()
    }

    func test_mapRates_valid_data() {
        // given
        let expected = [Rate(source: .usd, destination: .gbp, value: 0.77)]
        let dict = [["from": "USD", "to": "GBP", "rate": "0.77"]]
        guard let data = try? encoder.encode(dict) else {
            XCTAssert(false, "Can't encode dict to data")
            return
        }

        // when
        let result = mapper.mapRates(from: data)

        // then
        XCTAssertEqual(expected, try? result.get())
    }

    func test_mapRates_invalide_data() {
        // given
        let expected = RateMapperError.decoding
        let dict = [["A": "A"]]
        guard let data = try? encoder.encode(dict) else {
            XCTAssert(false, "Can't encode dict to data")
            return
        }

        // when
        let result = mapper.mapRates(from: data)

        // then
        XCTAssertEqual(expected, result.error)
    }

}
