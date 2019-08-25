//
//  DataLoaderTests.swift
//  TransactionViewerTests
//
//  Created by Kirill Shakhansky on 25/08/2019.
//  Copyright © 2019 Kirill Shakhansky. All rights reserved.
//

import XCTest
@testable import TransactionViewer

class DataLoaderTests: XCTestCase {

    var dataLoader: DataLoader!
    var expectation: XCTestExpectation!
    let timeout: TimeInterval = 3

    override func setUp() {
        super.setUp()
        dataLoader = BaseDataLoader()
        expectation = expectation(description: "loadData expectation")
    }

    override func tearDown() {
        expectation = nil
        dataLoader = nil
        super.tearDown()
    }

    func test_load_succes() {
        // given
        let bundle = Bundle(for: DataLoaderTests.self)
        guard let url = bundle.url(forResource: "rates", withExtension: "plist"),
            let expected = try? Data(contentsOf: url) else {
                XCTAssert(false, "Can't get url for rates.plist")
                return
        }

        // when
        dataLoader.loadData(from: url) { result in
            // then
            XCTAssertEqual(expected, try? result.get())
            self.expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)

    }

    func test_load_notLocalURL() {
        // given
        let url = URL(string: "https://yandex.ru")!
        let expectedError: DataLoaderError = .notLocalURL

        // when
        dataLoader.loadData(from: url) { result in
            // then
            XCTAssertEqual(expectedError, result.error)
            self.expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)

    }

    func test_invalide_data() {
        // given
        let bundle = Bundle(for: DataLoaderTests.self)
        guard var url = bundle.url(forResource: "rates", withExtension: "plist") else {
                XCTAssert(false, "Can't get url for rates.plist")
                return
        }
        url = url.appendingPathExtension("a")
        let expectedError: DataLoaderError = .invalideData

        // when
        dataLoader.loadData(from: url) { result in
            // then
            XCTAssertEqual(expectedError, result.error)
            self.expectation.fulfill()
        }
        waitForExpectations(timeout: timeout)

    }

}
